class ProductModel {
  ProductData? data;
  bool? errors;

  ProductModel({this.data, this.errors});

  ProductModel.fromJson(Map<String, dynamic>? json) {
    data =
        json?['data'] != null ? new ProductData.fromJson(json?['data']) : null;
    errors = json?['errors'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.data != null) {
      data?['data'] = this.data!.toJson();
    }
    data?['errors'] = this.errors;
    return data;
  }
}

class ProductData {
  Product? product;
  List<RelatedProducts>? relatedProducts;

  ProductData({this.product, this.relatedProducts});

  ProductData.fromJson(Map<String, dynamic>? json) {
    product = json?['product'] != null
        ? new Product.fromJson(json?['product'])
        : null;
    if (json?['relatedProducts'] != null) {
      relatedProducts = <RelatedProducts>[];
      json?['relatedProducts'].forEach((v) {
        relatedProducts!.add(new RelatedProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.product != null) {
      data?['product'] = this.product!.toJson();
    }
    if (this.relatedProducts != null) {
      data?['relatedProducts'] =
          this.relatedProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  var id;
  String? nameAr;
  String? nameEn;
  String? nameKu;
  String? paragraphAr;
  String? paragraphEn;
  String? paragraphKu;
  String? descriptionAr;
  String? descriptionEn;
  String? descriptionKu;
  String? isVisible;
  String? isOutOfStock;
  String? currentQuantity;
  String? minAvailableQuantity;
  String? price;
  String? finalPrice;
  String? points;
  String? isFeatured;
  var createdBy;
  var updatedBy;
  String? createdAt;
  String? updatedAt;
  String? brandId;
  String? discount;
  var reviewCount;
  var reviewAvg;
  bool? isDiscount;
  bool? isFavorite;
  var priceAfterDiscount;
  String? isVisibleBadge;
  String? isOutOfStockBadge;
  String? isFeaturedBadge;
  List<Attachments>? attachments;
  List<Reviews>? reviews;
  List<ProductColors>? colors;
  List<Sizes>? sizes;
  List<Sizes>? weights;
  List<Sizes>? dimensions;
  Brand? brand;
  List<Categories>? categories;
  var symbol_en;
  var symbol_ar;
  Product(
      {this.id,
      this.nameAr,
      this.weights,
      this.dimensions,
      this.nameEn,
      this.nameKu,
      this.paragraphAr,
      this.paragraphEn,
      this.paragraphKu,
      this.descriptionAr,
      this.descriptionEn,
      this.descriptionKu,
      this.isVisible,
      this.isOutOfStock,
      this.currentQuantity,
      this.minAvailableQuantity,
      this.price,
      this.isFavorite,
      this.finalPrice,
      this.points,
      this.isFeatured,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.brandId,
      this.discount,
      this.reviewCount,
      this.reviewAvg,
      this.isDiscount,
      this.priceAfterDiscount,
      this.isVisibleBadge,
      this.isOutOfStockBadge,
      this.isFeaturedBadge,
      this.attachments,
      this.reviews,
      this.colors,
      this.sizes,
      this.brand,
      this.symbol_en,
      this.symbol_ar,
      this.categories});

  Product.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    nameKu = json?['name_ku'];
    paragraphAr = json?['paragraph_ar'];
    paragraphEn = json?['paragraph_en'];
    paragraphKu = json?['paragraph_ku'];
    descriptionAr = json?['description_ar'];
    descriptionEn = json?['description_en'];
    descriptionKu = json?['description_ku'];
    isVisible = json?['is_visible'];
    isOutOfStock = json?['is_out_of_stock'];
    currentQuantity = json?['current_quantity'];
    minAvailableQuantity = json?['min_available_quantity'];
    price = json?['price'];
    finalPrice = json?['final_price'];
    points = json?['points'];
    isFeatured = json?['is_featured'];
    createdBy = json?['created_by'];
    updatedBy = json?['updated_by'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    brandId = json?['brand_id'];
    discount = json?['discount'];
    reviewCount = json?['review_count'];
    reviewAvg = json?['review_avg'];
    isDiscount = json?['is_discount'];
    priceAfterDiscount = json?['price_after_discount'];
    isVisibleBadge = json?['is_visible_badge'];
    isOutOfStockBadge = json?['is_out_of_stock_badge'];
    isFeaturedBadge = json?['is_featured_badge'];
    isFavorite = json?['is_favorite'];
    symbol_en = json?['symbol_en'];
    symbol_ar = json?['symbol_ar'];
    if (json?['attachments'] != null) {
      attachments = <Attachments>[];
      json?['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
    if (json?['reviews'] != null) {
      reviews = <Reviews>[];
      json?['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    if (json?['colors'] != null) {
      colors = <ProductColors>[];
      json?['colors'].forEach((v) {
        colors!.add(new ProductColors.fromJson(v));
      });
    }
    if (json?['sizes'] != null) {
      sizes = <Sizes>[];
      json?['sizes'].forEach((v) {
        sizes!.add(new Sizes.fromJson(v));
      });
    }
    if (json?['weights'] != null) {
      weights = <Sizes>[];
      json?['weights'].forEach((v) {
        weights!.add(new Sizes.fromJson(v));
      });
    }
    if (json?['dimensions'] != null) {
      dimensions = <Sizes>[];
      json?['dimensions'].forEach((v) {
        dimensions!.add(new Sizes.fromJson(v));
      });
    }
    brand = json?['brand'] != null ? new Brand.fromJson(json?['brand']) : null;
    if (json?['categories'] != null) {
      categories = <Categories>[];
      json?['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name_ar'] = this.nameAr;
    data?['name_en'] = this.nameEn;
    data?['name_ku'] = this.nameKu;
    data?['paragraph_ar'] = this.paragraphAr;
    data?['paragraph_en'] = this.paragraphEn;
    data?['paragraph_ku'] = this.paragraphKu;
    data?['description_ar'] = this.descriptionAr;
    data?['description_en'] = this.descriptionEn;
    data?['description_ku'] = this.descriptionKu;
    data?['is_visible'] = this.isVisible;
    data?['is_out_of_stock'] = this.isOutOfStock;
    data?['current_quantity'] = this.currentQuantity;
    data?['min_available_quantity'] = this.minAvailableQuantity;
    data?['price'] = this.price;
    data?['final_price'] = this.finalPrice;
    data?['points'] = this.points;
    data?['is_featured'] = this.isFeatured;
    data?['created_by'] = this.createdBy;
    data?['updated_by'] = this.updatedBy;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    data?['brand_id'] = this.brandId;
    data?['discount'] = this.discount;
    data?['review_count'] = this.reviewCount;
    data?['review_avg'] = this.reviewAvg;
    data?['is_discount'] = this.isDiscount;
    data?['price_after_discount'] = this.priceAfterDiscount;
    data?['is_visible_badge'] = this.isVisibleBadge;
    data?['is_out_of_stock_badge'] = this.isOutOfStockBadge;
    data?['is_featured_badge'] = this.isFeaturedBadge;
    data?['is_favorite'] = this.isFavorite;
    data?['symbol_en'] = this.symbol_en;
    data?['symbol_ar'] = this.symbol_ar;
    if (this.attachments != null) {
      data?['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    if (this.reviews != null) {
      data?['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    if (this.colors != null) {
      data?['colors'] = this.colors!.map((v) => v.toJson()).toList();
    }
    if (this.sizes != null) {
      data?['sizes'] = this.sizes!.map((v) => v.toJson()).toList();
    }
    if (this.weights != null) {
      data?['weights'] = this.weights!.map((v) => v.toJson()).toList();
    }
    if (this.dimensions != null) {
      data?['dimensions'] = this.dimensions!.map((v) => v.toJson()).toList();
    }
    if (this.brand != null) {
      data?['brand'] = this.brand!.toJson();
    }
    if (this.categories != null) {
      data?['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attachments {
  var id;
  String? productId;
  String? type;
  String? attachment;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  Attachments(
      {this.id,
      this.productId,
      this.type,
      this.attachment,
      this.createdAt,
      this.updatedAt,
      this.imageUrl});

  Attachments.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    productId = json?['product_id'];
    type = json?['type'];
    attachment = json?['attachment'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    imageUrl = json?['image_url'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['product_id'] = this.productId;
    data?['type'] = this.type;
    data?['attachment'] = this.attachment;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    data?['image_url'] = this.imageUrl;
    return data;
  }
}

class Reviews {
  var id;
  String? productId;
  String? userId;
  String? review;
  String? rate;
  String? createdAt;
  String? updatedAt;

  Reviews(
      {this.id,
      this.productId,
      this.userId,
      this.review,
      this.rate,
      this.createdAt,
      this.updatedAt});

  Reviews.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    productId = json?['product_id'];
    userId = json?['user_id'];
    review = json?['review'];
    rate = json?['rate'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['product_id'] = this.productId;
    data?['user_id'] = this.userId;
    data?['review'] = this.review;
    data?['rate'] = this.rate;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    return data;
  }
}

class ProductColors {
  var id;
  String? colorHex;
  String? productId;
  String? createdAt;
  String? updatedAt;

  ProductColors(
      {this.id, this.colorHex, this.productId, this.createdAt, this.updatedAt});

  ProductColors.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    colorHex = json?['color_hex'];
    productId = json?['product_id'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['color_hex'] = this.colorHex;
    data?['product_id'] = this.productId;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    return data;
  }
}

class Sizes {
  var id;
  String? productId;
  String? name;
  String? createdAt;
  String? updatedAt;

  Sizes({this.id, this.productId, this.name, this.createdAt, this.updatedAt});

  Sizes.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    productId = json?['product_id'];
    name = json?['name'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['product_id'] = this.productId;
    data?['name'] = this.name;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    return data;
  }
}

class Brand {
  var id;
  String? name;
  String? logo;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? updatedBy;

  Brand(
      {this.id,
      this.name,
      this.logo,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy});

  Brand.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    logo = json?['logo'];
    status = json?['status'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    createdBy = json?['created_by'];
    updatedBy = json?['updated_by'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name'] = this.name;
    data?['logo'] = this.logo;
    data?['status'] = this.status;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    data?['created_by'] = this.createdBy;
    data?['updated_by'] = this.updatedBy;
    return data;
  }
}

class Categories {
  var id;
  String? type;
  String? nameAr;
  String? nameEn;
  String? nameKu;
  String? image;
  String? isVisible;
  String? parentId;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Categories(
      {this.id,
      this.type,
      this.nameAr,
      this.nameEn,
      this.nameKu,
      this.image,
      this.isVisible,
      this.parentId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Categories.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    type = json?['type'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    nameKu = json?['name_ku'];
    image = json?['image'];
    isVisible = json?['is_visible'];
    parentId = json?['parent_id'];
    createdBy = json?['created_by'];
    updatedBy = json?['updated_by'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    pivot = json?['pivot'] != null ? new Pivot.fromJson(json?['pivot']) : null;
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['type'] = this.type;
    data?['name_ar'] = this.nameAr;
    data?['name_en'] = this.nameEn;
    data?['name_ku'] = this.nameKu;
    data?['image'] = this.image;
    data?['is_visible'] = this.isVisible;
    data?['parent_id'] = this.parentId;
    data?['created_by'] = this.createdBy;
    data?['updated_by'] = this.updatedBy;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data?['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  String? productId;
  String? categoryId;

  Pivot({this.productId, this.categoryId});

  Pivot.fromJson(Map<String, dynamic>? json) {
    productId = json?['product_id'];
    categoryId = json?['category_id'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['product_id'] = this.productId;
    data?['category_id'] = this.categoryId;
    return data;
  }
}

class RelatedProducts {
  var id;
  bool? isFavorite;
  String? nameAr;
  String? nameEn;
  String? nameKu;
  String? paragraphAr;
  String? paragraphEn;
  String? paragraphKu;
  String? descriptionAr;
  String? descriptionEn;
  String? descriptionKu;
  String? isVisible;
  String? isOutOfStock;
  String? currentQuantity;
  String? minAvailableQuantity;
  String? price;
  String? finalPrice;
  String? points;
  String? isFeatured;
  var createdBy;
  var updatedBy;
  String? createdAt;
  String? updatedAt;
  String? brandId;
  String? discount;
  var reviewCount;
  var reviewAvg;
  String? isVisibleBadge;
  String? isOutOfStockBadge;
  String? isFeaturedBadge;
  List<Attachments>? attachments;
  List<Reviews>? reviews;
  List<ProductColors>? colors;
  List<Sizes>? sizes;
  Brand? brand;
  List<Categories>? categories;
  var symbol_ar;
  var symbol_en;
  RelatedProducts(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.nameKu,
      this.paragraphAr,
      this.paragraphEn,
      this.paragraphKu,
      this.isFavorite,
      this.descriptionAr,
      this.descriptionEn,
      this.descriptionKu,
      this.isVisible,
      this.isOutOfStock,
      this.currentQuantity,
      this.minAvailableQuantity,
      this.price,
      this.finalPrice,
      this.points,
      this.isFeatured,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.brandId,
      this.discount,
      this.reviewCount,
      this.symbol_ar,
      this.reviewAvg,
      this.isVisibleBadge,
      this.isOutOfStockBadge,
      this.isFeaturedBadge,
      this.attachments,
      this.reviews,
      this.colors,
      this.symbol_en,
      this.sizes,
      this.brand,
      this.categories});

  RelatedProducts.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    nameKu = json?['name_ku'];
    paragraphAr = json?['paragraph_ar'];
    isFavorite = json?['is_favorite'];
    paragraphEn = json?['paragraph_en'];
    paragraphKu = json?['paragraph_ku'];
    descriptionAr = json?['description_ar'];
    descriptionEn = json?['description_en'];
    descriptionKu = json?['description_ku'];
    isVisible = json?['is_visible'];
    isOutOfStock = json?['is_out_of_stock'];
    currentQuantity = json?['current_quantity'];
    minAvailableQuantity = json?['min_available_quantity'];
    price = json?['price'];
    finalPrice = json?['final_price'];
    points = json?['points'];
    isFeatured = json?['is_featured'];
    createdBy = json?['created_by'];
    updatedBy = json?['updated_by'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    brandId = json?['brand_id'];
    discount = json?['discount'];
    symbol_en = json?['symbol_en'];
    reviewCount = json?['review_count'];
    reviewAvg = json?['review_avg'];
    isVisibleBadge = json?['is_visible_badge'];
    isOutOfStockBadge = json?['is_out_of_stock_badge'];
    isFeaturedBadge = json?['is_featured_badge'];
    symbol_ar = json?['symbol_ar'];
    if (json?['attachments'] != null) {
      attachments = <Attachments>[];
      json?['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
    if (json?['reviews'] != null) {
      reviews = <Reviews>[];
      json?['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    if (json?['colors'] != null) {
      colors = <ProductColors>[];
      json?['colors'].forEach((v) {
        colors!.add(new ProductColors.fromJson(v));
      });
    }
    if (json?['sizes'] != null) {
      sizes = <Sizes>[];
      json?['sizes'].forEach((v) {
        sizes!.add(new Sizes.fromJson(v));
      });
    }
    brand = json?['brand'] != null ? new Brand.fromJson(json?['brand']) : null;
    if (json?['categories'] != null) {
      categories = <Categories>[];
      json?['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name_ar'] = this.nameAr;
    data?['name_en'] = this.nameEn;
    data?['name_ku'] = this.nameKu;
    data?['paragraph_ar'] = this.paragraphAr;
    data?['paragraph_en'] = this.paragraphEn;
    data?['paragraph_ku'] = this.paragraphKu;
    data?['description_ar'] = this.descriptionAr;
    data?['description_en'] = this.descriptionEn;
    data?['description_ku'] = this.descriptionKu;
    data?['is_visible'] = this.isVisible;
    data?['is_out_of_stock'] = this.isOutOfStock;
    data?['current_quantity'] = this.currentQuantity;
    data?['symbol_en'] = this.symbol_en;
    data?['min_available_quantity'] = this.minAvailableQuantity;
    data?['price'] = this.price;
    data?['symbol_ar'] = this.symbol_ar;
    data?['final_price'] = this.finalPrice;
    data?['points'] = this.points;
    data?['is_featured'] = this.isFeatured;
    data?['created_by'] = this.createdBy;
    data?['updated_by'] = this.updatedBy;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    data?['brand_id'] = this.brandId;
    data?['discount'] = this.discount;
    data?['is_favorite'] = this.isFavorite;
    data?['review_count'] = this.reviewCount;
    data?['review_avg'] = this.reviewAvg;
    data?['is_visible_badge'] = this.isVisibleBadge;
    data?['is_out_of_stock_badge'] = this.isOutOfStockBadge;
    data?['is_featured_badge'] = this.isFeaturedBadge;
    if (this.attachments != null) {
      data?['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    if (this.reviews != null) {
      data?['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    if (this.colors != null) {
      data?['colors'] = this.colors!.map((v) => v.toJson()).toList();
    }
    if (this.sizes != null) {
      data?['sizes'] = this.sizes!.map((v) => v.toJson()).toList();
    }
    if (this.brand != null) {
      data?['brand'] = this.brand!.toJson();
    }
    if (this.categories != null) {
      data?['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
