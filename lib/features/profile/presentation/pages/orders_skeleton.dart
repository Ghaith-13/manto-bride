import 'package:manto_bride/core/extensions/padding_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class OrdersSkeleton extends StatefulWidget {
  const OrdersSkeleton({super.key});

  @override
  State<OrdersSkeleton> createState() => _OrdersSkeletonState();
}

class _OrdersSkeletonState extends State<OrdersSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.sp),
                child: Container(
                  color: Colors.black,
                  width: 120.w,
                  height: 50.h,
                ),
              )),
          10.ph,
          Row(
            children: [
              Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.sp),
                    child: Container(
                      color: Colors.black,
                      width: 75.w,
                      height: 30.h,
                    ),
                  )),
              10.pw,
              Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.sp),
                    child: Container(
                      color: Colors.black,
                      width: 75.w,
                      height: 30.h,
                    ),
                  )),
              10.pw,
              Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.sp),
                    child: Container(
                      color: Colors.black,
                      width: 75.w,
                      height: 30.h,
                    ),
                  )),
              10.pw,
              Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.sp),
                    child: Container(
                      color: Colors.black,
                      width: 75.w,
                      height: 30.h,
                    ),
                  )),
            ],
          ),
          20.ph,
          Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.sp),
                child: Container(
                  color: Colors.black,
                  width: 1.sw,
                  height: 175.h,
                ),
              )),
          20.ph,
          Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.sp),
                child: Container(
                  color: Colors.black,
                  width: 1.sw,
                  height: 175.h,
                ),
              )),
          20.ph,
          Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.sp),
                child: Container(
                  color: Colors.black,
                  width: 1.sw,
                  height: 175.h,
                ),
              )),
        ],
      ),
    );
  }
}
