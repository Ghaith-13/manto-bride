import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:manto_bride/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SliderForAds extends StatefulWidget {
  const SliderForAds({super.key});

  @override
  State<SliderForAds> createState() => _SliderForAdsState();
}

class _SliderForAdsState extends State<SliderForAds> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.homeInfo!.banners == null
            ? SizedBox()
            : state.homeInfo!.banners!.length == 0
                ? SizedBox()
                : Stack(children: [
                    SizedBox(
                      height: 400.h,
                      width: 1.sw,
                    ),
                    FlutterCarousel(
                      options: FlutterCarouselOptions(
                        floatingIndicator: false,
                        padEnds: false,
                        height: 400.h,
                        initialPage: 0,
                        viewportFraction: 1,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentImageIndex = index;
                          });
                        },
                      ),
                      items: [
                        for (int i = 0;
                            i < state.homeInfo!.banners!.length;
                            i++)
                          CachedNetworkImage(
                            imageUrl:
                                state.homeInfo!.banners![i].imageUrl ?? '',
                            imageBuilder: (context, imageProvider) => Container(
                              width: 1.sw,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(15.r),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                    Positioned(
                      bottom: 5,
                      width: 1.sw,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.sp),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 7.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      width: 1.sw,
                                      child: SingleChildScrollView(
                                        child: Text(
                                          state
                                                  .homeInfo!
                                                  .banners![_currentImageIndex]
                                                  .notes ??
                                              '',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            10.verticalSpace,
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    // color: Colors.black,
                                    // padding: EdgeInsetsDirectional.only(end: 100.w),
                                    // width: 1.sw,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        for (int i = 0;
                                            i < state.homeInfo!.banners!.length;
                                            i++)
                                          Container(
                                            width: 8.0,
                                            height: 8.0,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 4.0),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: _currentImageIndex == i
                                                  ? AppColors.primaryColor
                                                  : Colors.grey,
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]);
      },
    );
  }
}
