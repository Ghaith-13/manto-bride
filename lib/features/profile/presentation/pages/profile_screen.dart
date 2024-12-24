import 'package:manto_bride/core/utils/cache_helper.dart';
import 'package:manto_bride/core/utils/http_helper.dart';
import 'package:manto_bride/features/auth/presentation/pages/log_in_screen.dart';
import 'package:manto_bride/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:manto_bride/features/profile/presentation/pages/about_us.dart';
import 'package:manto_bride/features/profile/presentation/pages/contact_us.dart';
import 'package:manto_bride/features/profile/presentation/pages/profile_skeleton.dart';
import 'package:manto_bride/features/profile/presentation/pages/terms_and_conditions_screen.dart';
import 'package:manto_bride/features/profile/presentation/pages/tutorials_screen.dart';
import 'package:manto_bride/features/profile/presentation/pages/wallet_screen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/Locale/app_localization.dart';
import 'package:manto_bride/core/extensions/padding_extensions.dart';
import 'package:manto_bride/core/utils/app_colors.dart';
import 'package:manto_bride/core/utils/app_constant.dart';
import 'package:manto_bride/features/cart/presentation/pages/shipping_addresses_screen.dart';
import 'package:manto_bride/features/profile/presentation/pages/orders_screen.dart';
import 'package:manto_bride/features/profile/presentation/pages/settings_screen.dart';
import 'package:manto_bride/features/profile/presentation/widgets/profile_widgets/on_option_widget.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:manto_bride/features/profile/presentation/widgets/settings_widgets/curencies_widget.dart';
import 'package:manto_bride/features/profile/presentation/widgets/settings_widgets/language_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../injection_container.dart' as di;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "";
  String email = "";
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
    print(token);
    if (token != null) {
      setState(() {
        name = CacheHelper.getData(key: "EMAIL") ?? "";
        email = CacheHelper.getData(key: "NAME") ?? "";
      });
      context.read<ProfileCubit>().getuserInfo();
    } else {
      context.read<ProfileCubit>().getCurrencies();
    }
    setState(() {
      loadingToken = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppConstant.customAppBar(
        context,
        "",
        false,
        withTranslate: false,
        IconColor: AppColors.blackColor,
        backgroundColor: Colors.white,
        elvation: 0,
      ),
      body: loadingToken
          ? SizedBox()
          :
          // token == null
          //     ? Padding(
          //         padding: EdgeInsets.all(12.0.sp),
          //         child: Column(
          //           children: [
          //             Lottie.asset('assets/images/log_in.json'),
          //             Text(
          //               "Log in to enjoy these features.".tr(),
          //               style: TextStyle(
          //                   fontWeight: FontWeight.bold, fontSize: 20.sp),
          //             ),
          //             10.ph,
          //             AppConstant.customElvatedButton(context, "Login", () {
          //               Navigator.of(context).pushAndRemoveUntil(
          //                 MaterialPageRoute(
          //                     builder: (context) => const LogInScreen()),
          //                 (Route route) => false,
          //               );
          //             },
          //                 style: TextStyle(
          //                     color: Colors.white, fontWeight: FontWeight.bold))
          //           ],
          //         ),
          //       )
          // :

          BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return state.loaidngProfile
                    ? ProfileSkeleton()
                    : SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Profile Page".tr(),
                                style: TextStyle(
                                    fontSize: 34.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.blackColor),
                              ),
                              15.ph,
                              token == null
                                  ? SizedBox()
                                  : FadeInDown(
                                      child: Row(
                                        children: [
                                          // ClipOval(
                                          //   child: Image.asset(
                                          //     "assets/images/profile.png",
                                          //     fit: BoxFit.fill,
                                          //     width: 64.sp,
                                          //     height: 64.sp,
                                          //   ),
                                          // ),
                                          // 20.pw,
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "$name",
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        AppColors.blackColor),
                                              ),
                                              Text(
                                                "$email",
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.greyColor),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                              50.ph,
                              token == null
                                  ? SizedBox()
                                  : InkWell(
                                      onTap: () {
                                        AppConstant.customNavigation(
                                            context, OrdersScreen(), -1, 0);
                                      },
                                      child: FadeInLeft(
                                        child: OnOptionWidget(
                                            title: "My Orders",
                                            subTitle:
                                                "${"Already have".tr()} 12 ${"orders".tr()}"),
                                      ),
                                    ),
                              40.ph,
                              token == null
                                  ? SizedBox()
                                  : FadeInRight(
                                      child: InkWell(
                                        onTap: () {
                                          AppConstant.customNavigation(context,
                                              ShippingAddressesScreen(), -1, 0);
                                        },
                                        child: OnOptionWidget(
                                            title: "Shipping addresses",
                                            subTitle: "3 ${"address".tr()}"),
                                      ),
                                    ),
                              // 40.ph,
                              // FadeInLeft(
                              //     child: InkWell(
                              //   onTap: () {
                              //     AppConstant.customNavigation(
                              //         context, PaymentMethods(), -1, 0);
                              //   },
                              //   child: OnOptionWidget(
                              //       title: "payment methods",
                              //       subTitle: "subTitle"),
                              // )),
                              token == null ? SizedBox() : 40.ph,

                              // FadeInRight(
                              //     child: InkWell(
                              //   onTap: () {
                              //     AppConstant.customNavigation(
                              //         context, ArticlesScreen(), -1, 0);
                              //   },
                              //   child: OnOptionWidget(
                              //       title: "Articles", subTitle: ""),
                              // )),
                              // 40.ph,

                              FadeInRight(
                                  child: InkWell(
                                onTap: () {
                                  AppConstant.customNavigation(
                                      context, TutorialsScreen(), -1, 0);
                                },
                                child: OnOptionWidget(
                                    title: "Tutorials videos", subTitle: ""),
                              )),
                              // 40.ph,
                              // FadeInRight(
                              //   child: OnOptionWidget(
                              //       title: "Discount code",
                              //       subTitle: "You have special promocodes"
                              //           .tr()),
                              // ),
                              // 40.ph,
                              // FadeInLeft(
                              //   child: OnOptionWidget(
                              //       title: "Ratings",
                              //       subTitle:
                              //           "${"Reviews for".tr()} 14 ${"items".tr()}"),
                              // ),
                              token == null
                                  ? SizedBox()
                                  : state.userInfo?.isBlogger == "0"
                                      ? SizedBox()
                                      : 40.ph,
                              token == null
                                  ? SizedBox()
                                  : state.userInfo?.isBlogger == "0"
                                      ? SizedBox()
                                      : InkWell(
                                          onTap: () {
                                            AppConstant.customNavigation(
                                                context, WalletScreen(), -1, 0);
                                          },
                                          child: FadeInRight(
                                            child: OnOptionWidget(
                                                title: "Wallet",
                                                subTitle: "Profits".tr()),
                                          ),
                                        ),
                              token == null ? SizedBox() : 40.ph,
                              token == null
                                  ? SizedBox()
                                  : InkWell(
                                      onTap: () {
                                        AppConstant.customNavigation(
                                            context, SettingsScreen(), -1, 0);
                                      },
                                      child: FadeInLeft(
                                        child: OnOptionWidget(
                                            title: "Settings",
                                            subTitle:
                                                "Notifications, password".tr()),
                                      ),
                                    ),
                              40.ph,
                              InkWell(
                                onTap: () {
                                  AppConstant.customNavigation(
                                      context, ContactUsScreen(), -1, 0);
                                },
                                child: FadeInRight(
                                  child: OnOptionWidget(
                                      title: "Contact Us",
                                      subTitle: "Notifications, password".tr()),
                                ),
                              ),
                              40.ph,
                              InkWell(
                                onTap: () {
                                  AppConstant.customNavigation(
                                      context, AboutUsScreen(), -1, 0);
                                },
                                child: FadeInLeft(
                                  child: OnOptionWidget(
                                      title: "About us",
                                      subTitle: "Notifications, password".tr()),
                                ),
                              ),
                              40.ph,
                              InkWell(
                                onTap: () {
                                  AppConstant.customNavigation(context,
                                      TermsAndConditionsScreen(), -1, 0);
                                },
                                child: FadeInLeft(
                                  child: OnOptionWidget(
                                      title: "Terms and conditions",
                                      subTitle: "Notifications, password".tr()),
                                ),
                              ),
                              40.ph,
                              token == null
                                  ? SizedBox()
                                  : InkWell(
                                      onTap: () async {
                                        GoogleSignIn googleSignIn =
                                            GoogleSignIn();
                                        googleSignIn.disconnect();
                                        SharedPreferences preferences =
                                            await SharedPreferences
                                                .getInstance();
                                        await preferences.clear();
                                        di.sl<ApiBaseHelper>().updateHeader();

                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LogInScreen()),
                                          (Route route) => false,
                                        );
                                      },
                                      child: FadeInRight(
                                          child: Container(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Log out".tr(),
                                                      style: TextStyle(
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: AppColors
                                                              .blackColor),
                                                    ),
                                                  ]),
                                              Icon(
                                                Icons.logout_outlined,
                                                color: AppColors.greyColor,
                                                size: 24.sp,
                                              )
                                            ]),
                                      )),
                                    ),
                              token == null ? SizedBox() : 40.ph,
                              token == null
                                  ? SizedBox()
                                  : BlocBuilder<ProfileCubit, ProfileState>(
                                      builder: (context, state) {
                                        return AppConstant.customElvatedButton(
                                            context, "Delete Account",
                                            () async {
                                          if (state.laodingfeedback) {
                                          } else {
                                            bool confirmed =
                                                await showConfirmationDialog(
                                                    context);
                                            if (confirmed) {
                                              // Proceed with the action
                                              context
                                                  .read<ProfileCubit>()
                                                  .deleteAccount();
                                            } else {}
                                          }
                                        },
                                            style:
                                                TextStyle(color: Colors.white),
                                            loading: state.laodingfeedback
                                                ? true
                                                : false);
                                      },
                                    ),
                              token == null
                                  ? FadeInLeft(child: LanguageWidget())
                                  : SizedBox(),
                              10.ph,
                              token == null
                                  ? state.laodingCurrencies
                                      ? Shimmer.fromColors(
                                          baseColor: Colors.grey.shade300,
                                          highlightColor: Colors.grey.shade100,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(18.sp),
                                            child: Container(
                                              color: Colors.black,
                                              width: 1.sw,
                                              height: 50.h,
                                            ),
                                          ))
                                      : FadeInLeft(
                                          child: CurenciesWidget(
                                          fromSplash: true,
                                          curencyData: state.curencyData,
                                        ))
                                  : SizedBox(),
                              10.ph,
                              token == null
                                  ? AppConstant.customElvatedButton(
                                      context, "Login", () {
                                      Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LogInScreen()),
                                        (Route route) => false,
                                      );
                                    },
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))
                                  : SizedBox(),
                              100.verticalSpace
                            ],
                          ),
                        ),
                      );
              },
            ),
    );
  }
}

Future<bool> showConfirmationDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Confirmation'.tr()),
      content: Text('Are you sure you want to proceed?'.tr()),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'.tr(), style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Yes'.tr(), style: TextStyle(color: Colors.black)),
        ),
      ],
    ),
  );
}
