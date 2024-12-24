// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:manto_bride/Locale/cubit/locale_cubit.dart';
import 'package:manto_bride/core/utils/cache_helper.dart';
import 'package:manto_bride/features/home/presentation/cubit/home_cubit.dart';
import 'package:manto_bride/features/home/presentation/pages/product_details_skeleton.dart';
import 'package:manto_bride/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manto_bride/core/extensions/padding_extensions.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/core/utils/app_constant.dart';
import 'package:manto_bride/features/home/presentation/widgets/product_details_widgets/color_drop_down.dart';
import 'package:manto_bride/features/home/presentation/widgets/product_details_widgets/product_description_widget.dart';
import 'package:manto_bride/features/home/presentation/widgets/product_details_widgets/product_details_bottom_navigation.dart';
import 'package:manto_bride/features/home/presentation/widgets/product_details_widgets/product_slider_widget.dart';
import 'package:manto_bride/features/home/presentation/widgets/product_details_widgets/similar_products.dart';
import 'package:manto_bride/features/home/presentation/widgets/product_details_widgets/sizes_drop_down.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getProductDetails(widget.productId);
    checkIfGuest();
  }

  String? token;
  bool loadingToken = false;
  Future checkIfGuest() async {
    setState(() {
      loadingToken = true;
    });
    token = await CacheHelper.getData(key: "USER_TOKEN");
    setState(() {
      loadingToken = false;
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    context.read<HomeCubit>().removeProductInfoForCart();
  }

  bool loadingshare = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.loadingProductDetails
              ? SizedBox()
              : ProductDetailsBottomNavigation();
        },
      ),
      appBar: AppConstant.customAppBar(
        context,
        "",
        true,
        withTranslate: false,
        IconColor: AppColors.blackColor,
        backgroundColor: Colors.white,
        elvation: 0,
        actions: [
          Padding(
              padding: EdgeInsetsDirectional.only(end: 15.w),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => mainScreen(navigateIndex: 2)),
                        (Route route) => false,
                      );
                    },
                    child: SvgPicture.asset(
                      "assets/icons/basket.svg",
                      width: 25.sp,
                      height: 25.sp,
                      color: AppColors.blackColor,
                    ),
                  ),
                  10.horizontalSpace,
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return loadingToken
                          ? SizedBox()
                          : state.loadingProductDetails
                              ? SizedBox()
                              : state.productData == null
                                  ? SizedBox()
                                  : BlocBuilder<LocaleCubit, LocaleState>(
                                      builder: (context, locale) {
                                        return InkWell(
                                          onTap: () async {
                                            if (loadingshare) {
                                            } else {
                                              setState(() {
                                                loadingshare = true;
                                              });
                                              String imageUrl = "";
                                              for (int i = 0;
                                                  i <
                                                      state
                                                          .productData!
                                                          .product!
                                                          .attachments!
                                                          .length;
                                                  i++) {
                                                if (state.productData!.product!
                                                        .attachments![i].type ==
                                                    "image") {
                                                  imageUrl = state
                                                      .productData!
                                                      .product!
                                                      .attachments![i]
                                                      .imageUrl!;
                                                  break;
                                                }
                                              }
                                              print(imageUrl);
                                              final url = Uri.parse(imageUrl);
                                              final response =
                                                  await http.get(url);
                                              final bytes = response.bodyBytes;
                                              final temp =
                                                  await getTemporaryDirectory();
                                              final path =
                                                  '${temp.path}/image.jpg';
                                              File(path)
                                                  .writeAsBytesSync(bytes);
                                              XFile file = new XFile(path);
                                              setState(() {
                                                loadingshare = false;
                                              });
                                              await Share.shareXFiles([file],
                                                  text:
                                                      ' ${locale.locale.languageCode == "en" ? state.productData!.product!.descriptionEn ?? "" : locale.locale.languageCode == "ar" ? state.productData!.product!.descriptionAr ?? "" : state.productData!.product!.descriptionKu ?? ""} \n ${state.productData!.product!.finalPrice} ${locale.locale.languageCode == "ar" ? state.productData!.product!.symbol_ar : state.productData!.product!.symbol_en}');
                                            }
                                          },
                                          child: loadingshare
                                              ? CircularProgressIndicator(
                                                  color: AppColors.primaryColor,
                                                )
                                              : Icon(
                                                  Icons.share,
                                                  size: 24.sp,
                                                  color: AppColors.blackColor,
                                                ),
                                        );
                                      },
                                    );
                    },
                  ),
                ],
              )),
        ],
      ),
      body: loadingToken
          ? SizedBox()
          : BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return state.loadingProductDetails
                    ? ProductDetailsSkeleton()
                    : state.productData == null
                        ? ProductDetailsSkeleton()
                        : BlocBuilder<HomeCubit, HomeState>(
                            builder: (context, state) {
                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ProductSliderWidget(),
                                    20.ph,
                                    ProductDescriptionWidget(token: token),
                                    20.ph,
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w),
                                      child:
                                          BlocBuilder<LocaleCubit, LocaleState>(
                                        builder: (context, locale) {
                                          return Text(
                                            locale.locale.languageCode == "en"
                                                ? state.productData!.product!
                                                        .descriptionEn ??
                                                    ""
                                                : locale.locale.languageCode ==
                                                        "ar"
                                                    ? state
                                                            .productData!
                                                            .product!
                                                            .descriptionAr ??
                                                        ""
                                                    : state
                                                            .productData!
                                                            .product!
                                                            .descriptionKu ??
                                                        "",
                                            // textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.blackColor),
                                          );
                                        },
                                      ),
                                    ),
                                    20.ph,
                                    Divider(),
                                    5.ph,
                                    state.productData!.product!.colors == null
                                        ? SizedBox()
                                        : state.productData!.product!.colors!
                                                .isEmpty
                                            ? SizedBox()
                                            : ColorDropDown(
                                                productData: state.productData!,
                                              ),
                                    state.productData!.product!.colors == null
                                        ? SizedBox()
                                        : state.productData!.product!.colors!
                                                .isEmpty
                                            ? SizedBox()
                                            : 20.ph,
                                    state.productData!.product!.sizes == null
                                        ? SizedBox()
                                        : state.productData!.product!.sizes!
                                                .isEmpty
                                            ? SizedBox()
                                            : SizesDropDown(
                                                productdata: state.productData!,
                                              ),
                                    state.productData!.product!.sizes == null
                                        ? SizedBox()
                                        : state.productData!.product!.sizes!
                                                .isEmpty
                                            ? SizedBox()
                                            : 20.ph,

                                    // WeightsDropDown(
                                    //   productdata: state.productData!,
                                    // ),
                                    // 20.ph,
                                    // DimensionsDropDown(
                                    //   productdata: state.productData!,
                                    // ),
                                    // 20.ph,
                                    // Divider(),
                                    // 5.ph,
                                    // Padding(
                                    //   padding: EdgeInsets.symmetric(horizontal: 12.w),
                                    //   child: Row(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.spaceBetween,
                                    //     children: [
                                    //       Text(
                                    //         "Shipping info".tr(),
                                    //         style: TextStyle(
                                    //             fontSize: 16.sp,
                                    //             fontWeight: FontWeight.w400,
                                    //             color: AppColors.blackColor),
                                    //       ),
                                    //       Icon(Icons.arrow_forward_ios_outlined)
                                    //     ],
                                    //   ),
                                    // ),
                                    // 5.ph,
                                    // Divider(),
                                    // 5.ph,
                                    // Padding(
                                    //   padding: EdgeInsets.symmetric(horizontal: 12.w),
                                    //   child: Row(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.spaceBetween,
                                    //     children: [
                                    //       Text(
                                    //         "Support".tr(),
                                    //         style: TextStyle(
                                    //             fontSize: 16.sp,
                                    //             fontWeight: FontWeight.w400,
                                    //             color: AppColors.blackColor),
                                    //       ),
                                    //       Icon(Icons.arrow_forward_ios_outlined)
                                    //     ],
                                    //   ),
                                    // ),
                                    // 5.ph,
                                    Divider(),
                                    5.ph,
                                    state.productData!.relatedProducts == null
                                        ? SizedBox()
                                        : state.productData!.relatedProducts!
                                                .isEmpty
                                            ? SizedBox()
                                            : SimilarProducts(),
                                    20.ph,
                                  ],
                                ),
                              );
                            },
                          );
              },
            ),
    );
  }
}
