import 'package:manto_bride/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:manto_bride/features/profile/presentation/pages/orders_skeleton.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/extensions/padding_extensions.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/core/utils/app_constant.dart';
import 'package:manto_bride/features/profile/presentation/widgets/orders_widgets/one_order_screen.dart';
import 'package:lottie/lottie.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int indexTab = 0;

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstant.customAppBar(
        context,
        "",
        true,
        withTranslate: false,
        IconColor: AppColors.blackColor,
        backgroundColor: Colors.white,
        elvation: 0,
        // actions: [
        //   Padding(
        //     padding: EdgeInsetsDirectional.only(end: 15.w),
        //     child: Icon(
        //       Icons.search,
        //       size: 24.sp,
        //       color: AppColors.blackColor,
        //     ),
        //   ),
        // ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return state.laodingOrders == true
              ? OrdersSkeleton()
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My Orders".tr(),
                          style: TextStyle(
                              fontSize: 34.sp,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w700),
                        ),
                        10.ph,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    indexTab = 0;
                                  });
                                },
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(29.sp)),
                                  child: Container(
                                    height: 30.h,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    color: indexTab == 0
                                        ? AppColors.buttonColors
                                        : Colors.white,
                                    child: Center(
                                        child: Text("Pending".tr(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                color: indexTab == 0
                                                    ? Colors.white
                                                    : AppColors.blackColor))),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    indexTab = 1;
                                  });
                                },
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(29.sp)),
                                  child: Container(
                                    height: 30.h,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    color: indexTab == 1
                                        ? AppColors.buttonColors
                                        : Colors.white,
                                    child: Center(
                                        child: Text("Confirmed".tr(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                color: indexTab == 1
                                                    ? Colors.white
                                                    : AppColors.blackColor))),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    indexTab = 2;
                                  });
                                },
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(29.sp)),
                                  child: Container(
                                    height: 30.h,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    color: indexTab == 2
                                        ? AppColors.buttonColors
                                        : Colors.white,
                                    child: Center(
                                        child: Text("Ready To Ship".tr(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                color: indexTab == 2
                                                    ? Colors.white
                                                    : AppColors.blackColor))),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    indexTab = 3;
                                  });
                                },
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(29.sp)),
                                  child: Container(
                                    height: 30.h,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    color: indexTab == 3
                                        ? AppColors.buttonColors
                                        : Colors.white,
                                    child: Center(
                                        child: Text("On The Way".tr(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                color: indexTab == 3
                                                    ? Colors.white
                                                    : AppColors.blackColor))),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    indexTab = 4;
                                  });
                                },
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(29.sp)),
                                  child: Container(
                                    height: 30.h,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    color: indexTab == 4
                                        ? AppColors.buttonColors
                                        : Colors.white,
                                    child: Center(
                                        child: Text("it has been delivred".tr(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                color: indexTab == 4
                                                    ? Colors.white
                                                    : AppColors.blackColor))),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    indexTab = 5;
                                  });
                                },
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(29.sp)),
                                  child: Container(
                                    height: 30.h,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    color: indexTab == 5
                                        ? AppColors.buttonColors
                                        : Colors.white,
                                    child: Center(
                                        child: Text("Completed".tr(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                color: indexTab == 5
                                                    ? Colors.white
                                                    : AppColors.blackColor))),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    indexTab = 6;
                                  });
                                },
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(29.sp)),
                                  child: Container(
                                    height: 30.h,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    color: indexTab == 6
                                        ? AppColors.buttonColors
                                        : Colors.white,
                                    child: Center(
                                        child: Text("Canceled".tr(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                color: indexTab == 6
                                                    ? Colors.white
                                                    : AppColors.blackColor))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        30.ph,
                        indexTab == 0
                            ? state.myOrders!.pending == null
                                ? Center(
                                    child: Column(
                                    children: [
                                      Lottie.asset(
                                          'assets/images/empty_data.json'),
                                      Text(
                                        "Sorry, there are no products.".tr(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp),
                                      ),
                                    ],
                                  ))
                                : state.myOrders!.pending!.length == 0
                                    ? Center(
                                        child: Column(
                                        children: [
                                          Lottie.asset(
                                              'assets/images/empty_data.json'),
                                          Text(
                                            "Sorry, there are no Orders.".tr(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.sp),
                                          ),
                                        ],
                                      ))
                                    : ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: state.myOrders!.pending ==
                                                null
                                            ? 0
                                            : state.myOrders!.pending!.length,
                                        itemBuilder: (context, index) {
                                          return index % 2 == 0
                                              ? FadeInLeft(
                                                  child: OneOrderScreen(
                                                    orderDetails: state
                                                        .myOrders!
                                                        .pending![index],
                                                    status: "Pending",
                                                    color: Colors.amber,
                                                  ),
                                                )
                                              : FadeInRight(
                                                  child: OneOrderScreen(
                                                    orderDetails: state
                                                        .myOrders!
                                                        .pending![index],
                                                    status: "Pending",
                                                    color: Colors.amber,
                                                  ),
                                                );
                                        },
                                      )
                            : indexTab == 1
                                ? state.myOrders!.confirmed == null
                                    ? Center(
                                        child: Column(
                                        children: [
                                          Lottie.asset(
                                              'assets/images/empty_data.json'),
                                          Text(
                                            "Sorry, there are no products."
                                                .tr(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.sp),
                                          ),
                                        ],
                                      ))
                                    : state.myOrders!.confirmed!.length == 0
                                        ? Center(
                                            child: Column(
                                            children: [
                                              Lottie.asset(
                                                  'assets/images/empty_data.json'),
                                              Text(
                                                "Sorry, there are no Orders."
                                                    .tr(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20.sp),
                                              ),
                                            ],
                                          ))
                                        : ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount:
                                                state.myOrders!.confirmed ==
                                                        null
                                                    ? 0
                                                    : state.myOrders!.confirmed!
                                                        .length,
                                            itemBuilder: (context, index) {
                                              return index % 2 == 0
                                                  ? FadeInLeft(
                                                      child: OneOrderScreen(
                                                        orderDetails: state
                                                            .myOrders!
                                                            .confirmed![index],
                                                        status: "Confirmed",
                                                        color: Colors.green,
                                                      ),
                                                    )
                                                  : FadeInRight(
                                                      child: OneOrderScreen(
                                                        orderDetails: state
                                                            .myOrders!
                                                            .confirmed![index],
                                                        status: "Confirmed",
                                                        color: Colors.green,
                                                      ),
                                                    );
                                            },
                                          )
                                : indexTab == 2
                                    ? state.myOrders!.readyToShip == null
                                        ? Center(
                                            child: Column(
                                            children: [
                                              Lottie.asset(
                                                  'assets/images/empty_data.json'),
                                              Text(
                                                "Sorry, there are no products."
                                                    .tr(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20.sp),
                                              ),
                                            ],
                                          ))
                                        : state.myOrders!.readyToShip!.length ==
                                                0
                                            ? Center(
                                                child: Column(
                                                children: [
                                                  Lottie.asset(
                                                      'assets/images/empty_data.json'),
                                                  Text(
                                                    "Sorry, there are no Orders."
                                                        .tr(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20.sp),
                                                  ),
                                                ],
                                              ))
                                            : ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: state.myOrders!
                                                            .readyToShip ==
                                                        null
                                                    ? 0
                                                    : state.myOrders!
                                                        .readyToShip!.length,
                                                itemBuilder: (context, index) {
                                                  return index % 2 == 0
                                                      ? FadeInLeft(
                                                          child: OneOrderScreen(
                                                            orderDetails: state
                                                                    .myOrders!
                                                                    .readyToShip![
                                                                index],
                                                            status:
                                                                "Ready To Ship",
                                                            color: Colors.blue,
                                                          ),
                                                        )
                                                      : FadeInRight(
                                                          child: OneOrderScreen(
                                                            orderDetails: state
                                                                    .myOrders!
                                                                    .readyToShip![
                                                                index],
                                                            status:
                                                                "Ready To Ship",
                                                            color: Colors.blue,
                                                          ),
                                                        );
                                                },
                                              )
                                    : indexTab == 3
                                        ? state.myOrders!.onTheWay == null
                                            ? Center(
                                                child: Column(
                                                children: [
                                                  Lottie.asset(
                                                      'assets/images/empty_data.json'),
                                                  Text(
                                                    "Sorry, there are no products."
                                                        .tr(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20.sp),
                                                  ),
                                                ],
                                              ))
                                            : state.myOrders!.onTheWay!
                                                        .length ==
                                                    0
                                                ? Center(
                                                    child: Column(
                                                    children: [
                                                      Lottie.asset(
                                                          'assets/images/empty_data.json'),
                                                      Text(
                                                        "Sorry, there are no Orders."
                                                            .tr(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.sp),
                                                      ),
                                                    ],
                                                  ))
                                                : ListView.builder(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount: state.myOrders!
                                                                .onTheWay ==
                                                            null
                                                        ? 0
                                                        : state.myOrders!
                                                            .onTheWay!.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return index % 2 == 0
                                                          ? FadeInLeft(
                                                              child:
                                                                  OneOrderScreen(
                                                                orderDetails: state
                                                                        .myOrders!
                                                                        .onTheWay![
                                                                    index],
                                                                status:
                                                                    "On The Way",
                                                                color: Colors
                                                                    .deepPurple,
                                                              ),
                                                            )
                                                          : FadeInRight(
                                                              child:
                                                                  OneOrderScreen(
                                                                orderDetails: state
                                                                        .myOrders!
                                                                        .onTheWay![
                                                                    index],
                                                                status:
                                                                    "On The Way",
                                                                color: Colors
                                                                    .deepPurple,
                                                              ),
                                                            );
                                                    },
                                                  )
                                        : indexTab == 4
                                            ? state.myOrders!.delivered == null
                                                ? Center(
                                                    child: Column(
                                                    children: [
                                                      Lottie.asset(
                                                          'assets/images/empty_data.json'),
                                                      Text(
                                                        "Sorry, there are no products."
                                                            .tr(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.sp),
                                                      ),
                                                    ],
                                                  ))
                                                : state.myOrders!.delivered!
                                                            .length ==
                                                        0
                                                    ? Center(
                                                        child: Column(
                                                        children: [
                                                          Lottie.asset(
                                                              'assets/images/empty_data.json'),
                                                          Text(
                                                            "Sorry, there are no Orders."
                                                                .tr(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    20.sp),
                                                          ),
                                                        ],
                                                      ))
                                                    : ListView.builder(
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        itemCount: state
                                                                    .myOrders!
                                                                    .delivered ==
                                                                null
                                                            ? 0
                                                            : state
                                                                .myOrders!
                                                                .delivered!
                                                                .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return index % 2 == 0
                                                              ? FadeInLeft(
                                                                  child:
                                                                      OneOrderScreen(
                                                                    orderDetails: state
                                                                        .myOrders!
                                                                        .delivered![index],
                                                                    status:
                                                                        "it has been delivred",
                                                                    color: Colors
                                                                        .green,
                                                                  ),
                                                                )
                                                              : FadeInRight(
                                                                  child:
                                                                      OneOrderScreen(
                                                                    orderDetails: state
                                                                        .myOrders!
                                                                        .delivered![index],
                                                                    status:
                                                                        "it has been delivred",
                                                                    color: Colors
                                                                        .green,
                                                                  ),
                                                                );
                                                        },
                                                      )
                                            : indexTab == 5
                                                ? state.myOrders!.completed ==
                                                        null
                                                    ? Center(
                                                        child: Column(
                                                        children: [
                                                          Lottie.asset(
                                                              'assets/images/empty_data.json'),
                                                          Text(
                                                            "Sorry, there are no products."
                                                                .tr(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    20.sp),
                                                          ),
                                                        ],
                                                      ))
                                                    : state.myOrders!.completed!
                                                                .length ==
                                                            0
                                                        ? Center(
                                                            child: Column(
                                                            children: [
                                                              Lottie.asset(
                                                                  'assets/images/empty_data.json'),
                                                              Text(
                                                                "Sorry, there are no Orders."
                                                                    .tr(),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        20.sp),
                                                              ),
                                                            ],
                                                          ))
                                                        : ListView.builder(
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            shrinkWrap: true,
                                                            itemCount: state
                                                                        .myOrders!
                                                                        .completed ==
                                                                    null
                                                                ? 0
                                                                : state
                                                                    .myOrders!
                                                                    .completed!
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return index %
                                                                          2 ==
                                                                      0
                                                                  ? FadeInLeft(
                                                                      child:
                                                                          OneOrderScreen(
                                                                        orderDetails: state
                                                                            .myOrders!
                                                                            .completed![index],
                                                                        status:
                                                                            "Completed",
                                                                        color: Colors
                                                                            .green,
                                                                      ),
                                                                    )
                                                                  : FadeInRight(
                                                                      child:
                                                                          OneOrderScreen(
                                                                        orderDetails: state
                                                                            .myOrders!
                                                                            .completed![index],
                                                                        status:
                                                                            "Completed",
                                                                        color: Colors
                                                                            .green,
                                                                      ),
                                                                    );
                                                            },
                                                          )
                                                : state.myOrders!.cancelled ==
                                                        null
                                                    ? Center(
                                                        child: Column(
                                                        children: [
                                                          Lottie.asset(
                                                              'assets/images/empty_data.json'),
                                                          Text(
                                                            "Sorry, there are no products."
                                                                .tr(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    20.sp),
                                                          ),
                                                        ],
                                                      ))
                                                    : state.myOrders!.cancelled!
                                                                .length ==
                                                            0
                                                        ? Center(
                                                            child: Column(
                                                            children: [
                                                              Lottie.asset(
                                                                  'assets/images/empty_data.json'),
                                                              Text(
                                                                "Sorry, there are no Orders."
                                                                    .tr(),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        20.sp),
                                                              ),
                                                            ],
                                                          ))
                                                        : ListView.builder(
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            shrinkWrap: true,
                                                            itemCount: state
                                                                        .myOrders!
                                                                        .cancelled ==
                                                                    null
                                                                ? 0
                                                                : state
                                                                    .myOrders!
                                                                    .cancelled!
                                                                    .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return index %
                                                                          2 ==
                                                                      0
                                                                  ? FadeInLeft(
                                                                      child:
                                                                          OneOrderScreen(
                                                                        orderDetails: state
                                                                            .myOrders!
                                                                            .cancelled![index],
                                                                        status:
                                                                            "Canceled",
                                                                        color: Colors
                                                                            .red,
                                                                      ),
                                                                    )
                                                                  : FadeInRight(
                                                                      child:
                                                                          OneOrderScreen(
                                                                        orderDetails: state
                                                                            .myOrders!
                                                                            .cancelled![index],
                                                                        status:
                                                                            "Canceled",
                                                                        color: Colors
                                                                            .red,
                                                                      ),
                                                                    );
                                                            },
                                                          )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
