// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:manto_bride/features/home/data/models/sub_categories_model.dart';
// import 'package:manto_bride/features/home/presentation/widgets/categories_widgets/product_card_widget.dart';

// class TrendingNowWidget extends StatefulWidget {
//   const TrendingNowWidget({super.key});

//   @override
//   State<TrendingNowWidget> createState() => _TrendingNowWidgetState();
// }

// class _TrendingNowWidgetState extends State<TrendingNowWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 350.h,
//       width: 1.sw,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 10,
//         shrinkWrap: true,
//         itemBuilder: (context, index) {
//           return Container(
//               margin: EdgeInsetsDirectional.only(end: 10.w),
//               child: ProductCardWidget(
//                 fromSimilarProduct: true,
//                 productDetails: Products(
//                     finalPrice: "10000",
//                     discount: "10",
//                     id: "1",
//                     imageUrl:
//                         "https://alkhatuna-boutique.com/Al-khatuna/public/uploads/products/image/1725821326-5281.jpg",
//                     isDiscount: true,
//                     isFavorite: true,
//                     nameAr: "كنزة",
//                     nameEn: "T-Shirt",
//                     nameKu: "T-shirt",
//                     isFeatured: "1",
//                     price: "15000",
//                     reviewAvg: 3,
//                     reviewCount: 2),
//               ));
//         },
//       ),
//     );
//   }
// }
