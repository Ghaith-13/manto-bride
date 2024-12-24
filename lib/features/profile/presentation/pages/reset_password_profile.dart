// import 'package:manto_bride/Locale/app_localization.dart';
// import 'package:manto_bride/core/utils/app_colors.dart';
// import 'package:manto_bride/core/utils/app_constant.dart';
// import 'package:manto_bride/features/auth/presentation/cubit/auth_cubit.dart';
// import 'package:manto_bride/features/auth/presentation/widgets/sign_up_widgets/custom_text_form_field_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ResetPasswordProfile extends StatefulWidget {
//   const ResetPasswordProfile({
//     super.key,
//   });

//   @override
//   State<ResetPasswordProfile> createState() => _ResetPasswordProfileState();
// }

// class _ResetPasswordProfileState extends State<ResetPasswordProfile> {
//   String password = "";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       appBar: AppConstant.customAppBar(context, "", true,
//           backgroundColor: Colors.transparent, IconColor: AppColors.blackColor),
//       body: Padding(
//         padding: EdgeInsets.all(15.sp),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Text(
//                   "Forget Password".tr(),
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 34.sp,
//                       color: AppColors.blackColor),
//                 ),
//               ],
//             ),
//             50.verticalSpace,
//             CustomTextFormFieldWidget(
//               hint: "Enter Your New Password",
//               onChange: (value) {
//                 setState(() {
//                   password = value;
//                 });
//               },
//             ),
//             50.verticalSpace,
//             BlocBuilder<AuthCubit, AuthState>(
//               builder: (context, state) {
//                 return state.loading
//                     ? CircularProgressIndicator(
//                         color: AppColors.primaryColor,
//                       )
//                     : AppConstant.customElvatedButton(context, "Send", () {
//                         if (password.length < 8) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               backgroundColor: Colors.red,
//                               padding: EdgeInsets.only(
//                                   bottom: 30.h,
//                                   top: 30.h,
//                                   left: 50.w,
//                                   right: 50.w),
//                               content: Text(
//                                 "Password not updated".tr(),
//                                 style: const TextStyle(color: Colors.white),
//                               ),
//                               duration: const Duration(seconds: 2),
//                             ),
//                           );
//                         } else {
//                           // context.read<AuthCubit>().resetPassword(
//                           //     widget.phoeNumber, password, context);
//                         }
//                       },
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 14.sp,
//                             fontWeight: FontWeight.bold));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
