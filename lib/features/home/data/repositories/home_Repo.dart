// ignore_for_file: file_names, non_constant_identifier_names

import 'package:manto_bride/features/home/data/datasources/home_ds.dart';
import 'package:manto_bride/features/home/data/models/add_to_cart_model.dart';
import 'package:manto_bride/features/home/data/models/brand_details_model.dart';
import 'package:manto_bride/features/home/data/models/brands_model.dart';
import 'package:manto_bride/features/home/data/models/favorite_model.dart';
import 'package:manto_bride/features/home/data/models/product_model.dart';
import 'package:manto_bride/features/home/data/models/review_model.dart';
import 'package:manto_bride/features/home/data/models/sub_categories_model.dart';

import '../models/get_home_model.dart';

class HomeRepo {
  final HomeDs dataSource;

  HomeRepo({required this.dataSource});

  Future<HomeModel> getHomeInfo() async {
    HomeModel MyOrdersResponse = HomeModel.fromJson(
      await dataSource.getHomeInfo(),
    );
    return MyOrdersResponse;
  }

  Future<ProductModel> getProductDetails(String productid) async {
    ProductModel MyOrdersResponse = ProductModel.fromJson(
      await dataSource.getProductDetails(productid),
    );
    return MyOrdersResponse;
  }

  Future<BrandDetailsModel> getBrandDetails(
      String brandId, int pagenumber) async {
    BrandDetailsModel MyOrdersResponse = BrandDetailsModel.fromJson(
      await dataSource.getBrandDetails(brandId, pagenumber),
    );
    return MyOrdersResponse;
  }

  Future<BrandsModel> getBrands() async {
    BrandsModel MyOrdersResponse = BrandsModel.fromJson(
      await dataSource.getBrands(),
    );
    return MyOrdersResponse;
  }

  Future<SubCategoriesModel> GetSubGategories(
    String categoryID,
    int pageNumber,
    double minPrice,
    double maxPrice,
    List<String> sizes,
    List<String> colors,
    List<String> weights,
    List<String> dimensions,
    List<String> selectedlistbrandId,
    bool filterDiscount,
    bool filterFeature,
    String searchValue,
  ) async {
    SubCategoriesModel MyOrdersResponse = SubCategoriesModel.fromJson(
      await dataSource.getSubGategories(
          categoryID,
          pageNumber,
          minPrice,
          maxPrice,
          sizes,
          colors,
          weights,
          dimensions,
          selectedlistbrandId,
          filterDiscount,
          filterFeature,
          searchValue),
    );
    return MyOrdersResponse;
  }

  Future<FavoriteModel> toggleFavorite(
      {required Map<String, String> body}) async {
    FavoriteModel response = FavoriteModel.fromJson(
      await dataSource.toggleFavorite(body),
    );
    return response;
  }

  Future<ReviewModel> sendReview({required Map<String, String> body}) async {
    ReviewModel response = ReviewModel.fromJson(
      await dataSource.sendReview(body),
    );
    return response;
  }

  Future<AddToCartModel> addToCart({required Map<String, String> body}) async {
    AddToCartModel response = AddToCartModel.fromJson(
      await dataSource.addToCart(body),
    );
    return response;
  }
}
