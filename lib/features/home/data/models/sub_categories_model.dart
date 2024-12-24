class SubCategoriesModel {
  List<SubCategoryData>? data;
  List<Brands>? brands;
  bool? errors;

  SubCategoriesModel({this.data, this.brands, this.errors});

  SubCategoriesModel.fromJson(Map<String, dynamic>? json) {
    if (json?['data'] != null) {
      data = <SubCategoryData>[];
      json?['data'].forEach((v) {
        data!.add(new SubCategoryData.fromJson(v));
      });
    }
    if (json?['brands'] != null) {
      brands = <Brands>[];
      json?['brands'].forEach((v) {
        brands!.add(new Brands.fromJson(v));
      });
    }
    errors = json?['errors'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.data != null) {
      data?['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.brands != null) {
      data?['brands'] = this.brands!.map((v) => v.toJson()).toList();
    }
    data?['errors'] = this.errors;
    return data;
  }
}

class SubCategoryData {
  var id;
  var nameAr;
  var nameEn;
  var nameKu;
  List<Products>? products;
  Pagination? pagination;
  var minPrice;
  var maxPrice;
  List<String>? uniqueColors;
  List<String>? uniqueSizes;
  List<String>? uniqueWeights;
  List<String>? uniqueDimensions;
  var imageUrl;

  SubCategoryData({
    this.id,
    this.nameAr,
    this.nameEn,
    this.nameKu,
    this.products,
    this.pagination,
    this.minPrice,
    this.maxPrice,
    this.uniqueColors,
    this.uniqueSizes,
    this.uniqueWeights,
    this.uniqueDimensions,
    this.imageUrl,
  });

  SubCategoryData.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    nameKu = json?['name_ku'];
    imageUrl = json?['image_url'];
    if (json?['products'] != null) {
      products = <Products>[];
      json?['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    pagination = json?['pagination'] != null
        ? new Pagination.fromJson(json?['pagination'])
        : null;
    minPrice = json?['min_price'];
    maxPrice = json?['max_price'];
    uniqueColors = json?['unique_colors'].cast<String>();
    uniqueSizes = json?['unique_sizes'].cast<String>();
    uniqueWeights = json?['unique_weights'].cast<String>();
    uniqueDimensions = json?['unique_dimensions'].cast<String>();
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name_ar'] = this.nameAr;
    data?['name_en'] = this.nameEn;
    data?['name_ku'] = this.nameKu;
    if (this.products != null) {
      data?['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data?['pagination'] = this.pagination!.toJson();
    }
    data?['min_price'] = this.minPrice;
    data?['max_price'] = this.maxPrice;
    data?['unique_colors'] = this.uniqueColors;
    data?['unique_sizes'] = this.uniqueSizes;
    data?['unique_weights'] = this.uniqueWeights;
    data?['unique_dimensions'] = this.uniqueDimensions;
    data?['image_url'] = this.imageUrl;
    return data;
  }
}

class Products {
  var id;
  var nameAr;
  var nameEn;
  var nameKu;
  var price;
  bool? isDiscount;
  var discount;
  var priceAfterDiscount;
  var reviewCount;
  var reviewAvg;
  var imageUrl;
  var isFeatured;
  bool? isFavorite;
  var createdAt;
  var finalPrice;
  var minAvailableQuantity;
  var currentQuantity;
  var symbol_ar;
  var symbol_en;
  bool? displayProduct;

  Products({
    this.id,
    this.nameAr,
    this.nameEn,
    this.nameKu,
    this.price,
    this.isDiscount,
    this.discount,
    this.priceAfterDiscount,
    this.reviewCount,
    this.reviewAvg,
    this.imageUrl,
    this.isFeatured,
    this.isFavorite,
    this.createdAt,
    this.finalPrice,
    this.minAvailableQuantity,
    this.currentQuantity,
    this.displayProduct,
    this.symbol_ar,
    this.symbol_en,
  });

  Products.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    nameKu = json?['name_ku'];
    price = json?['price'];
    isDiscount = json?['is_discount'];
    discount = json?['discount'];
    priceAfterDiscount = json?['price_after_discount'];
    reviewCount = json?['review_count'];
    reviewAvg = json?['review_avg'];
    imageUrl = json?['image_url'];
    isFeatured = json?['is_featured'];
    isFavorite = json?['is_favorite'];
    createdAt = json?['created_at'];
    finalPrice = json?['final_price'];
    minAvailableQuantity = json?['min_available_quantity'];
    currentQuantity = json?['current_quantity'];
    displayProduct = json?['display_product'];
    symbol_ar = json?['symbol_ar'];
    symbol_en = json?['symbol_en'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name_ar'] = this.nameAr;
    data?['name_en'] = this.nameEn;
    data?['name_ku'] = this.nameKu;
    data?['price'] = this.price;
    data?['is_discount'] = this.isDiscount;
    data?['discount'] = this.discount;
    data?['price_after_discount'] = this.priceAfterDiscount;
    data?['review_count'] = this.reviewCount;
    data?['review_avg'] = this.reviewAvg;
    data?['image_url'] = this.imageUrl;
    data?['is_featured'] = this.isFeatured;
    data?['is_favorite'] = this.isFavorite;
    data?['created_at'] = this.createdAt;
    data?['final_price'] = this.finalPrice;
    data?['min_available_quantity'] = this.minAvailableQuantity;
    data?['current_quantity'] = this.currentQuantity;
    data?['display_product'] = this.displayProduct;
    data?['symbol_ar'] = this.symbol_ar;
    data?['symbol_en'] = this.symbol_en;
    return data;
  }
}

class Pagination {
  var total;
  var perPage;
  var currentPage;
  var lastPage;
  var from;
  var to;

  Pagination(
      {this.total,
      this.perPage,
      this.currentPage,
      this.lastPage,
      this.from,
      this.to});

  Pagination.fromJson(Map<String, dynamic>? json) {
    total = json?['total'];
    perPage = json?['per_page'];
    currentPage = json?['current_page'];
    lastPage = json?['last_page'];
    from = json?['from'];
    to = json?['to'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['total'] = this.total;
    data?['per_page'] = this.perPage;
    data?['current_page'] = this.currentPage;
    data?['last_page'] = this.lastPage;
    data?['from'] = this.from;
    data?['to'] = this.to;
    return data;
  }
}

class Brands {
  var id;
  var name;
  var logo;

  Brands({this.id, this.name, this.logo});

  Brands.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    logo = json?['logo'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name'] = this.name;
    data?['logo'] = this.logo;
    return data;
  }
}
