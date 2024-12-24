import 'package:manto_bride/Locale/cubit/locale_cubit.dart';
import 'package:manto_bride/features/home/data/models/sub_categories_model.dart';
import 'package:manto_bride/features/home/presentation/cubit/home_cubit.dart';
import 'package:manto_bride/features/home/presentation/widgets/categories_widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OffersSection extends StatefulWidget {
  const OffersSection({super.key});

  @override
  State<OffersSection> createState() => _SectionsWidgetState();
}

class _SectionsWidgetState extends State<OffersSection> {
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
                  state.homeInfo!.discountedProducts!.length, (index) {
                return FadeInUp(
                    child: ProductCardWidget(
                  fromHome: true,
                  fromSimilarProduct: false,
                  productDetails: Products(
                      symbol_ar:
                          state.homeInfo!.discountedProducts![index].symbol_ar,
                      symbol_en:
                          state.homeInfo!.discountedProducts![index].symbol_en,
                      displayProduct: state
                          .homeInfo!.discountedProducts![index].displayProduct,
                      finalPrice: state
                          .homeInfo!.discountedProducts![index].finalPrice
                          .toString(),
                      discount: state
                          .homeInfo!.discountedProducts![index].discount
                          .toString(),
                      id: state.homeInfo!.discountedProducts![index].id,
                      imageUrl:
                          state.homeInfo!.discountedProducts![index].imageUrl,
                      isDiscount:
                          state.homeInfo!.discountedProducts![index].isDiscount,
                      isFavorite: state
                          .homeInfo!.discountedProducts![index].is_favorite,
                      nameAr: state.homeInfo!.discountedProducts![index].nameAr,
                      nameEn: state.homeInfo!.discountedProducts![index].nameEn,
                      nameKu: state.homeInfo!.discountedProducts![index].nameKu,
                      isFeatured:
                          state.homeInfo!.discountedProducts![index].isFeatured,
                      price: state.homeInfo!.discountedProducts![index].price
                          .toString(),
                      reviewAvg:
                          state.homeInfo!.discountedProducts![index].reviewAvg,
                      reviewCount: state
                          .homeInfo!.discountedProducts![index].reviewCount),
                ));
              }),
            );
          },
        );
      },
    );
  }
}
