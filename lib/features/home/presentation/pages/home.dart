// ignore_for_file: must_be_immutable

import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/core/utils/app_constant.dart';
import 'package:manto_bride/core/utils/cache_helper.dart';
import 'package:manto_bride/features/all_products/presentation/pages/all_products_screen.dart';
import 'package:manto_bride/features/home/presentation/cubit/home_cubit.dart';
import 'package:manto_bride/features/home/presentation/pages/brands_screen.dart';
import 'package:manto_bride/features/home/presentation/pages/home_skeleton.dart';
import 'package:manto_bride/features/home/presentation/widgets/home_widgets/brands_section.dart';
import 'package:manto_bride/features/home/presentation/widgets/home_widgets/most_selling_product.dart';
import 'package:manto_bride/features/home/presentation/widgets/home_widgets/offers_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/features/home/presentation/widgets/home_widgets/sections_widget.dart';
import 'package:manto_bride/features/home/presentation/widgets/home_widgets/slider_widget.dart';
import 'package:manto_bride/features/profile/presentation/cubit/profile_cubit.dart';

class HomeScreen extends StatefulWidget {
  ScrollController scrollController;
  HomeScreen({super.key, required this.scrollController});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    checkIfGuest();
  }

  bool loadingToken = false;
  String? token;
  Future checkIfGuest() async {
    setState(() {
      loadingToken = true;
    });
    token = await CacheHelper.getData(key: "USER_TOKEN");
    String? CURRENCY_ID = await CacheHelper.getData(key: "CURRENCY_ID");

    // print(token);
    setState(() {
      loadingToken = false;
    });
    if (token != null) {
      if (CURRENCY_ID != null) {
        await context.read<ProfileCubit>().ChangeCurrencies(CURRENCY_ID);
        await CacheHelper.clearData(key: "CURRENCY_ID");
      }
      await context.read<HomeCubit>().getHomeInfo();
      // context.read<ProfileCubit>().getuserInfo(context);
    } else {
      await context.read<HomeCubit>().getHomeInfo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: widget.scrollController,
        child: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return state.loading
                  ? HomeSkeleton()
                  : state.homeInfo == null
                      ? HomeSkeleton()
                      : Column(
                          children: [
                            // 10.verticalSpace,
                            // SizedBox(
                            //     width: 0.9.sw,
                            //     child: TextField(
                            //       textInputAction: TextInputAction.search,
                            //       onSubmitted: (value) {
                            //         AppConstant.customNavigation(
                            //             context, HomeSearchScreen(), 1, 0);
                            //       },
                            //       decoration: InputDecoration(
                            //         prefixIcon: Icon(
                            //           Icons.search,
                            //           color: AppColors.primaryColor,
                            //         ),
                            //         filled: false,
                            //         border: UnderlineInputBorder(
                            //           borderSide: BorderSide(
                            //             color: AppColors.primaryColor,
                            //             width:
                            //                 2.0, // Adjust the border width as needed
                            //           ),
                            //         ),
                            //         hintStyle: TextStyle(
                            //             color: AppColors.primaryColor),
                            //         hintText: "Find what you want".tr(),
                            //       ),
                            //     )),
                            // 10.ph,
                            SliderForAds(),
                            // 10.ph,
                            Padding(
                              padding: EdgeInsets.all(15.0.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //                     TextButton(
                                  // onPressed: () => {
                                  //       Navigator.of(context).push(
                                  //         MaterialPageRoute(
                                  //           builder: (BuildContext context) => TapPayment(
                                  //               apiKey: "YOUR_API_KEY",
                                  //               redirectUrl: "http://your_website.com/redirect_url",
                                  //               postUrl: "http://your_website.com/post_url",
                                  //               paymentData: const {
                                  //                 "amount": 10,
                                  //                 "currency": "OMR",
                                  //                 "threeDSecure": true,
                                  //                 "save_card": false,
                                  //                 "description": "Test Description",
                                  //                 "statement_descriptor": "Sample",
                                  //                 "metadata": {"udf1": "test 1", "udf2": "test 2"},
                                  //                 "reference": {
                                  //                   "transaction": "txn_0001",
                                  //                   "order": "ord_0001"
                                  //                 },
                                  //                 "receipt": {"email": false, "sms": true},
                                  //                 "customer": {
                                  //                   "first_name": "test",
                                  //                   "middle_name": "test",
                                  //                   "last_name": "test",
                                  //                   "email": "test@test.com",
                                  //                   "phone": {
                                  //                     "country_code": "965",
                                  //                     "number": "50000000"
                                  //                   }
                                  //                 },
                                  //                 // "merchant": {"id": ""},
                                  //                 "source": {"id": "src_card"},
                                  //                 // "destinations": {
                                  //                 //   "destination": [
                                  //                 //     {"id": "480593777", "amount": 2, "currency": "KWD"},
                                  //                 //     {"id": "486374777", "amount": 3, "currency": "KWD"}
                                  //                 //   ]
                                  //                 // }
                                  //               },
                                  //               onSuccess: (Map params) async {
                                  //                 print("onSuccess: $params");
                                  //               },
                                  //               onError: (error) {
                                  //                 print("onError: $error");
                                  //               }),
                                  //         ),
                                  //       )
                                  //     },
                                  // child: const Text("Make Payment")),

                                  state.homeInfo!.categories == null
                                      ? SizedBox()
                                      : state.homeInfo!.categories!.isEmpty
                                          ? SizedBox()
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Sections".tr(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 24.sp),
                                                ),
                                                // Zasin()
                                              ],
                                            ),
                                  SectionsWidget(),
                                  state.homeInfo!.brands == null
                                      ? SizedBox()
                                      : state.homeInfo!.brands!.isEmpty
                                          ? SizedBox()
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                  Text(
                                                    "Brands".tr(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 24.sp),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      AppConstant
                                                          .customNavigation(
                                                              context,
                                                              BrandsScreen(),
                                                              -1,
                                                              0);
                                                    },
                                                    child: Text(
                                                      "See more".tr(),
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .greyColor),
                                                    ),
                                                  )
                                                ]),
                                  state.homeInfo!.brands == null
                                      ? SizedBox()
                                      : state.homeInfo!.brands!.isEmpty
                                          ? SizedBox()
                                          : BrandsSection(),
                                  state.homeInfo!.bestSellingProducts == null
                                      ? SizedBox()
                                      : state.homeInfo!.bestSellingProducts!
                                              .isEmpty
                                          ? SizedBox()
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "We chose for you".tr(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 24.sp),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    AppConstant
                                                        .customNavigation(
                                                            context,
                                                            AllProductsScreen(
                                                              type:
                                                                  "best-selling",
                                                            ),
                                                            -1,
                                                            0);
                                                  },
                                                  child: Text(
                                                    "See more".tr(),
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .greyColor),
                                                  ),
                                                )
                                              ],
                                            ),
                                  state.homeInfo!.bestSellingProducts == null
                                      ? SizedBox()
                                      : state.homeInfo!.bestSellingProducts!
                                              .isEmpty
                                          ? SizedBox()
                                          : MostSellingProduct(),
                                  10.verticalSpace,
                                  state.homeInfo!.discountedProducts == null
                                      ? SizedBox()
                                      : state.homeInfo!.discountedProducts!
                                              .isEmpty
                                          ? SizedBox()
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Trending now".tr(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 24.sp),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    AppConstant
                                                        .customNavigation(
                                                            context,
                                                            AllProductsScreen(
                                                              type:
                                                                  "discounted",
                                                            ),
                                                            -1,
                                                            0);
                                                  },
                                                  child: Text(
                                                    "See more".tr(),
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .greyColor),
                                                  ),
                                                )
                                              ],
                                            ),
                                  state.homeInfo!.discountedProducts == null
                                      ? SizedBox()
                                      : state.homeInfo!.discountedProducts!
                                              .isEmpty
                                          ? SizedBox()
                                          : OffersSection()
                                ],
                              ),
                            ),
                          ],
                        );
            },
          ),
        ),
      ),
    );
  }
}

// class Zasin extends StatefulWidget {
//   const Zasin({super.key});

//   @override
//   State<Zasin> createState() => _ZasinState();
// }

// class _ZasinState extends State<Zasin> {
//   Widget _zaincash = Container();
//   String paymentState = '';

//   final TextEditingController _controller = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     /**
//      * to listen for the state of the transaction, it returns a json objects you can fetch like state['success']
//      */
//     ZaincashService.paymentStateListener.listen((state) {
//       setState(() {
//         paymentState = state.toString();
//       });
//     });
//   }

//   void _triggerPayment() {
//     setState(() {
//       _zaincash = Container(
//           child: new ZainCash(
//               transactionId: _controller.text,
//               production: false,
//               closeOnSuccess: true,
//               closeOnError: true));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Ghaith"),
//       ),
//       body: Center(
//         child: Stack(
//           children: <Widget>[
//             Column(
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   child: TextFormField(
//                     controller: _controller,
//                     decoration: const InputDecoration(
//                         border: UnderlineInputBorder(),
//                         labelText: 'Enter the transaction id'),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Text('Payment listener state ' + paymentState),
//               ],
//             ),
//             _zaincash,
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _triggerPayment,
//         tooltip: 'Pay',
//         child: Icon(Icons.payment),
//       ),
//     );
//     // InkWell(
//     //     onTap: () {
//     //       // ZaincashService.paymentStateListener
//     //       //     .listen((state) {
//     //       //   print("Done");
//     //       // });
//     //       ZainCash(
//     //           transactionId: "61b3976de65fb79d1b5ffc3c",
//     //           production: false,
//     //           closeOnSuccess: true,
//     //           closeOnError: true);
//     //       // showFlexibleBottomSheet(
//     //       //   bottomSheetColor:
//     //       //       AppColors.whiteColor,
//     //       //   barrierColor:
//     //       //       Color.fromARGB(94, 83, 83, 83),
//     //       //   bottomSheetBorderRadius:
//     //       //       BorderRadius.only(
//     //       //           topLeft:
//     //       //               Radius.circular(40.sp),
//     //       //           topRight:
//     //       //               Radius.circular(40.sp)),
//     //       //   minHeight: 0,
//     //       //   initHeight: 0.3,
//     //       //   maxHeight: 0.3,
//     //       //   anchors: [0, 0.3],
//     //       //   isSafeArea: true,
//     //       //   context: context,
//     //       //   builder: sortingSectionsBottomSheet,
//     //       // );
//     //     },
//     //     child: Icon(Icons.filter_list_outlined));
//   }
// }
