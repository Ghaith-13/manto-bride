import 'package:manto_bride/core/extensions/padding_extensions.dart';
import 'package:manto_bride/core/utils/cache_helper.dart';
import 'package:manto_bride/features/all_products/presentation/pages/all_products_skeleton.dart';
import 'package:manto_bride/features/auth/presentation/pages/log_in_screen.dart';
import 'package:manto_bride/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:manto_bride/features/favorite/presentation/cubit/favorite_state.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/core/utils/app_constant.dart';
import 'package:manto_bride/features/favorite/presentation/widgets/favorite_widgets.dart/favorite_card_widget.dart';
import 'package:manto_bride/features/home/presentation/cubit/home_cubit.dart';
import 'package:lottie/lottie.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  // final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    checkIfGuest();
  }

  String? token;
  bool loadingToken = false;
  Future checkIfGuest() async {
    setState(() {
      loadingToken = true;
    });
    token = await CacheHelper.getData(key: "USER_TOKEN");
    if (token != null) {
      context.read<FavoriteCubit>().getFavoritesProduct();
      // controller.addListener(() {
      //   if (controller.position.maxScrollExtent == controller.position.pixels) {
      //     context.read<FavoriteCubit>().getFavoritesProduct(context);
      //   }
      // });
    }
    setState(() {
      loadingToken = false;
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    context.read<FavoriteCubit>().clearAll();
    context.read<FavoriteCubit>().removeAllFilters();
  }

  @override
  void dispose() {
    super.dispose();
    // controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppConstant.customAppBar(
              context, state.showmeshProducts ? "Favorites".tr() : "", false,
              withTranslate: false,
              IconColor: AppColors.blackColor,
              backgroundColor: Colors.white,
              elvation: 0,
              actions: [
                Padding(
                    padding: EdgeInsetsDirectional.only(end: 15.w),
                    child: SizedBox())
              ]),
          body: loadingToken
              ? SizedBox()
              : token == null
                  ? Padding(
                      padding: EdgeInsets.all(12.0.sp),
                      child: Column(
                        children: [
                          Lottie.asset('assets/images/log_in.json'),
                          Text(
                            "Log in to enjoy these features.".tr(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.sp),
                          ),
                          10.ph,
                          AppConstant.customElvatedButton(context, "Login", () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const LogInScreen()),
                              (Route route) => false,
                            );
                          },
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    )
                  : BlocBuilder<FavoriteCubit, FavoriteState>(
                      builder: (context, value) {
                        return BlocBuilder<HomeCubit, HomeState>(
                          builder: (context, state) {
                            return SingleChildScrollView(
                              // controller: controller,
                              child: value.loadingFavorite
                                  ? AllProductsSkeleton()
                                  : value.favoriteData == null
                                      ? AllProductsSkeleton()
                                      : value.favoriteData!.isEmpty
                                          ? Center(
                                              child: Column(
                                                children: [
                                                  Lottie.asset(
                                                      'assets/images/empty_data.json'),
                                                  Text(
                                                    "There are no products in the favorites"
                                                        .tr(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 14.w),
                                                  child: value.favoriteData!
                                                              .length ==
                                                          0
                                                      ? Center(
                                                          child: Column(
                                                          children: [
                                                            Lottie.asset(
                                                              'assets/images/empty_data.json',
                                                            ),
                                                            Text(
                                                              "Sorry, there are no products."
                                                                  .tr(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      20.sp),
                                                            ),
                                                          ],
                                                        ))
                                                      : GridView.count(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 10),
                                                          shrinkWrap: true,
                                                          physics:
                                                              NeverScrollableScrollPhysics(),
                                                          crossAxisCount: 2,
                                                          crossAxisSpacing: 10,
                                                          childAspectRatio:
                                                              (1 / 2),
                                                          children: List.generate(
                                                              value.favoriteData ==
                                                                      null
                                                                  ? 0
                                                                  : value
                                                                      .favoriteData!
                                                                      .length,
                                                              (index) {
                                                            return index % 2 ==
                                                                    0
                                                                ? FadeInLeft(
                                                                    child: FavoriteCardWidget(
                                                                        soldOut: value.favoriteData![index].displayProduct!
                                                                            ? false
                                                                            : true,
                                                                        favoriteProduct:
                                                                            value.favoriteData![
                                                                                index]))
                                                                : FadeInRight(
                                                                    child: FavoriteCardWidget(
                                                                        soldOut: value.favoriteData![index].displayProduct!
                                                                            ? false
                                                                            : true,
                                                                        favoriteProduct:
                                                                            value.favoriteData![index]));
                                                          }),
                                                        ),
                                                ),
                                                100.ph,
                                              ],
                                            ),
                            );
                          },
                        );
                      },
                    ),
        );
      },
    );
  }
}
