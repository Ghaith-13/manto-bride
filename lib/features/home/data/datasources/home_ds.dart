import 'package:manto_bride/core/utils/cache_helper.dart';

import '../../../../core/utils/http_helper.dart';

class HomeDs {
  final ApiBaseHelper apiHelper;

  HomeDs({required this.apiHelper});

  Future<Map<String, dynamic>?> getHomeInfo() async {
    String? userID = await CacheHelper.getData(key: "USER_ID");
    String? CURRENCY_ID = await CacheHelper.getData(key: "CURRENCY_ID");
    Map<String, dynamic>? response = await apiHelper.get("/home",
        queryParameters: {
          "user_id": userID,
          "currency_id": userID == null ? CURRENCY_ID : null
        });
    return response;
  }

  Future<Map<String, dynamic>?> getProductDetails(String prouctid) async {
    String? userID = await CacheHelper.getData(key: "USER_ID");
    String? CURRENCY_ID = await CacheHelper.getData(key: "CURRENCY_ID");

    Map<String, String?> body = {};
    body['product_id'] = "$prouctid";
    body['user_id'] = "$userID";
    body['currency_id'] = userID == null ? CURRENCY_ID : null;
    Map<String, dynamic>? response =
        await apiHelper.get("/get-product", queryParameters: body);
    return response;
  }

  Future<Map<String, dynamic>?> getBrandDetails(
      String brandId, int pagenumber) async {
    String? userID = await CacheHelper.getData(key: "USER_ID");

    Map<String, dynamic>? response = await apiHelper.get(
        "/brands/$brandId/products-with-pagination?page=$pagenumber",
        queryParameters: {"user_id": userID});
    return response;
  }

  Future<Map<String, dynamic>?> getBrands() async {
    Map<String, dynamic>? response = await apiHelper.get("/brands");
    return response;
  }

  Future<Map<String, dynamic>?> toggleFavorite(
      Map<String, String>? body) async {
    Map<String, dynamic>? response = await apiHelper.post(
      "/toggle-favorite",
      body: body,
    );
    return response;
  }

  Future<Map<String, dynamic>?> sendReview(Map<String, String>? body) async {
    Map<String, dynamic>? response = await apiHelper.post(
      "/add-review",
      body: body,
    );
    return response;
  }

  Future<Map<String, dynamic>?> addToCart(Map<String, String>? body) async {
    Map<String, dynamic>? response = await apiHelper.post(
      "/add-to-cart",
      body: body,
    );
    return response;
  }

  Future<Map<String, dynamic>?> getSubGategories(
      String category_id,
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
      String searchValue) async {
    String? userID = await CacheHelper.getData(key: "USER_ID");
    String? CURRENCY_ID = await CacheHelper.getData(key: "CURRENCY_ID");

    Map<String, String?> body = {};
    body['page'] = "$pageNumber";
    body['user_id'] = userID;
    body["currency_id"] = userID == null ? CURRENCY_ID : null;
    body['is_feautred'] = "${filterFeature ? "1" : "0"}";
    body['is_discount'] = "${filterDiscount ? "1" : "0"}";
    body['category_id'] = "$category_id";

    if (minPrice != -100) {
      body['min_price'] = "$minPrice";
    }
    if (searchValue.isNotEmpty) {
      body['keyword'] = "$searchValue";
    }
    if (maxPrice != -100) {
      body['max_price'] = "$maxPrice";
    }
    if (sizes.isNotEmpty) {
      for (int i = 0; i < sizes.length; i++) body['sizes[$i]'] = "${sizes[i]}";
    }
    if (colors.isNotEmpty) {
      for (int i = 0; i < colors.length; i++)
        body['colors[$i]'] = "${colors[i]}";
    }
    if (weights.isNotEmpty) {
      for (int i = 0; i < weights.length; i++)
        body['weights[$i]'] = "${weights[i]}";
    }
    if (dimensions.isNotEmpty) {
      for (int i = 0; i < dimensions.length; i++)
        body['dimensions[$i]'] = "${dimensions[i]}";
    }
    if (selectedlistbrandId.isNotEmpty) {
      for (int i = 0; i < selectedlistbrandId.length; i++)
        body['brands[$i]'] = "${selectedlistbrandId[i]}";
    }
    Map<String, dynamic>? response =
        await apiHelper.get("/get-sub-categories", queryParameters: body);
    return response;
  }
}
