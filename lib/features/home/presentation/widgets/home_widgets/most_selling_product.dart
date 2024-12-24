import 'package:manto_bride/Locale/cubit/locale_cubit.dart';
import 'package:manto_bride/features/home/data/models/sub_categories_model.dart';
import 'package:manto_bride/features/home/presentation/cubit/home_cubit.dart';
import 'package:manto_bride/features/home/presentation/widgets/categories_widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MostSellingProduct extends StatefulWidget {
  const MostSellingProduct({super.key});

  @override
  State<MostSellingProduct> createState() => _SectionsWidgetState();
}

class _SectionsWidgetState extends State<MostSellingProduct> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, locale) {
            return GridView.count(
              padding: EdgeInsets.symmetric(vertical: 10),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: (1 / 2),
              children: List.generate(
                  state.homeInfo!.bestSellingProducts!.length, (index) {
                return FadeInUp(
                    child: ProductCardWidget(
                  fromHome: true,
                  fromSimilarProduct: false,
                  productDetails: Products(
                      symbol_ar:
                          state.homeInfo!.bestSellingProducts![index].symbol_ar,
                      symbol_en:
                          state.homeInfo!.bestSellingProducts![index].symbol_en,
                      displayProduct: state
                          .homeInfo!.bestSellingProducts![index].displayProduct,
                      finalPrice: state
                          .homeInfo!.bestSellingProducts![index].finalPrice
                          .toString(),
                      discount: state
                          .homeInfo!.bestSellingProducts![index].discount
                          .toString(),
                      id: state.homeInfo!.bestSellingProducts![index].id,
                      imageUrl:
                          state.homeInfo!.bestSellingProducts![index].imageUrl,
                      isDiscount: state
                          .homeInfo!.bestSellingProducts![index].isDiscount,
                      isFavorite: state
                          .homeInfo!.bestSellingProducts![index].is_favorite,
                      nameAr:
                          state.homeInfo!.bestSellingProducts![index].nameAr,
                      nameEn:
                          state.homeInfo!.bestSellingProducts![index].nameEn,
                      nameKu:
                          state.homeInfo!.bestSellingProducts![index].nameKu,
                      isFeatured: state
                          .homeInfo!.bestSellingProducts![index].isFeatured,
                      price: state.homeInfo!.bestSellingProducts![index].price
                          .toString(),
                      reviewAvg:
                          state.homeInfo!.bestSellingProducts![index].reviewAvg,
                      reviewCount: state
                          .homeInfo!.bestSellingProducts![index].reviewCount),
                ));
              }),
            );
          },
        );
      },
    );
  }
}
