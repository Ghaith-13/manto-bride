import 'package:manto_bride/features/home/presentation/pages/categories_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manto_bride/core/utils/app_constant.dart';

class OneSectionWidget extends StatelessWidget {
  final String logo, title, categoryId;
  const OneSectionWidget(
      {super.key,
      required this.logo,
      required this.title,
      required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppConstant.customNavigation(
            context,
            CategoriesScreen(
              title: title,
              categoryId: categoryId,
            ),
            -1,
            0);
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            10.verticalSpace,
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
                    blurRadius: 7.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: CachedNetworkImage(
                width: 90,
                height: 90,
                fit: BoxFit.fill,
                imageUrl: logo,
                errorWidget: (context, name, imageProvider) => Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 2.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/logo.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                imageBuilder: (context, imageProvider) => Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 2.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            5.verticalSpace,
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
