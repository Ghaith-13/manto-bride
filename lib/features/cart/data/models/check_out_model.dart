class CheckOutModel {
  CheckOutData? data;
  bool? errors;

  CheckOutModel({this.data, this.errors});

  CheckOutModel.fromJson(Map<String, dynamic>? json) {
    data =
        json?['data'] != null ? new CheckOutData.fromJson(json?['data']) : null;
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

class CheckOutData {
  DefaultAddress? defaultAddress;
  var paymentMethod;
  var delivryFees;
  var total_tax;
  List<Carts>? carts;
  var totalAmount;
  var productsDiscountValue;
  var discountPercentage;
  var totalAmountAfterDiscount;
  var grandTotal;
  var symbol_ar;
  var symbol_en;
  PromoCode? promoCode;
  String? orderConfirmationMessage;

  CheckOutData({
    this.defaultAddress,
    this.paymentMethod,
    this.delivryFees,
    this.carts,
    this.totalAmount,
    this.productsDiscountValue,
    this.discountPercentage,
    this.totalAmountAfterDiscount,
    this.grandTotal,
    this.promoCode,
    this.total_tax,
    this.symbol_ar,
    this.symbol_en,
    this.orderConfirmationMessage,
  });

  CheckOutData.fromJson(Map<String, dynamic>? json) {
    defaultAddress = json?['default_address'] != null
        ? new DefaultAddress.fromJson(json?['default_address'])
        : null;
    paymentMethod = json?['payment_method'];
    symbol_ar = json?['symbol_ar'];
    symbol_en = json?['symbol_en'];
    orderConfirmationMessage = json?['order_confirmation_message'];
    total_tax = json?['total_tax'];
    delivryFees = json?['delivry_fees'];
    if (json?['carts'] != null) {
      carts = <Carts>[];
      json?['carts'].forEach((v) {
        carts!.add(new Carts.fromJson(v));
      });
    }
    totalAmount = json?['total_amount'];
    productsDiscountValue = json?['products_discount_value'];
    discountPercentage = json?['discount_percentage'];
    totalAmountAfterDiscount = json?['total_amount_after_discount'];
    grandTotal = json?['grand_total'];
    promoCode = json?['promo_code'] != null
        ? new PromoCode.fromJson(json?['promo_code'])
        : null;
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.defaultAddress != null) {
      data?['default_address'] = this.defaultAddress!.toJson();
    }
    data?['payment_method'] = this.paymentMethod;
    data?['symbol_ar'] = this.symbol_ar;
    data?['delivry_fees'] = this.delivryFees;
    data?['total_tax'] = this.total_tax;
    data?['symbol_en'] = this.symbol_en;
    data?['order_confirmation_message'] = this.orderConfirmationMessage;
    if (this.carts != null) {
      data?['carts'] = this.carts!.map((v) => v.toJson()).toList();
    }
    data?['total_amount'] = this.totalAmount;
    data?['products_discount_value'] = this.productsDiscountValue;
    data?['discount_percentage'] = this.discountPercentage;
    data?['total_amount_after_discount'] = this.totalAmountAfterDiscount;
    data?['grand_total'] = this.grandTotal;
    if (this.promoCode != null) {
      data?['promo_code'] = this.promoCode!.toJson();
    }
    return data;
  }
}

class DefaultAddress {
  var id;
  var userId;
  var title;
  var phone;
  var countryId;
  var provinceId;
  var areaId;
  var subAreaId;
  var longitude;
  var latitude;
  var notes;
  var isDefault;
  var createdAt;
  var updatedAt;
  Country? country;
  Province? province;
  Province? area;
  Province? subArea;

  DefaultAddress(
      {this.id,
      this.userId,
      this.title,
      this.phone,
      this.countryId,
      this.provinceId,
      this.areaId,
      this.subAreaId,
      this.longitude,
      this.latitude,
      this.notes,
      this.isDefault,
      this.createdAt,
      this.updatedAt,
      this.country,
      this.province,
      this.area,
      this.subArea});

  DefaultAddress.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    userId = json?['user_id'];
    title = json?['title'];
    phone = json?['phone'];
    countryId = json?['country_id'];
    provinceId = json?['province_id'];
    areaId = json?['area_id'];
    subAreaId = json?['sub_area_id'];
    longitude = json?['longitude'];
    latitude = json?['latitude'];
    notes = json?['notes'];
    isDefault = json?['is_default'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    country = json?['country'] != null
        ? new Country.fromJson(json?['country'])
        : null;
    province = json?['province'] != null
        ? new Province.fromJson(json?['province'])
        : null;
    area = json?['area'] != null ? new Province.fromJson(json?['area']) : null;
    subArea = json?['sub_area'] != null
        ? new Province.fromJson(json?['sub_area'])
        : null;
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['user_id'] = this.userId;
    data?['title'] = this.title;
    data?['phone'] = this.phone;
    data?['country_id'] = this.countryId;
    data?['province_id'] = this.provinceId;
    data?['area_id'] = this.areaId;
    data?['sub_area_id'] = this.subAreaId;
    data?['longitude'] = this.longitude;
    data?['latitude'] = this.latitude;
    data?['notes'] = this.notes;
    data?['is_default'] = this.isDefault;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    if (this.country != null) {
      data?['country'] = this.country!.toJson();
    }
    if (this.province != null) {
      data?['province'] = this.province!.toJson();
    }
    if (this.area != null) {
      data?['area'] = this.area!.toJson();
    }
    if (this.subArea != null) {
      data?['sub_area'] = this.subArea!.toJson();
    }
    return data;
  }
}

class Country {
  var id;
  var nameAr;
  var nameEn;
  var nameKu;
  var type;
  var parentId;
  var deliveryFees;
  var createdBy;
  var updatedBy;
  var createdAt;
  var updatedAt;

  Country(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.nameKu,
      this.type,
      this.parentId,
      this.deliveryFees,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  Country.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    nameKu = json?['name_ku'];
    type = json?['type'];
    parentId = json?['parent_id'];
    deliveryFees = json?['delivery_fees'];
    createdBy = json?['created_by'];
    updatedBy = json?['updated_by'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name_ar'] = this.nameAr;
    data?['name_en'] = this.nameEn;
    data?['name_ku'] = this.nameKu;
    data?['type'] = this.type;
    data?['parent_id'] = this.parentId;
    data?['delivery_fees'] = this.deliveryFees;
    data?['created_by'] = this.createdBy;
    data?['updated_by'] = this.updatedBy;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    return data;
  }
}

class Province {
  var id;
  var nameAr;
  var nameEn;
  var nameKu;
  var type;
  var parentId;
  var deliveryFees;
  var createdBy;
  var updatedBy;
  var createdAt;
  var updatedAt;

  Province(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.nameKu,
      this.type,
      this.parentId,
      this.deliveryFees,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  Province.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    nameAr = json?['name_ar'];
    nameEn = json?['name_en'];
    nameKu = json?['name_ku'];
    type = json?['type'];
    parentId = json?['parent_id'];
    deliveryFees = json?['delivery_fees'];
    createdBy = json?['created_by'];
    updatedBy = json?['updated_by'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name_ar'] = this.nameAr;
    data?['name_en'] = this.nameEn;
    data?['name_ku'] = this.nameKu;
    data?['type'] = this.type;
    data?['parent_id'] = this.parentId;
    data?['delivery_fees'] = this.deliveryFees;
    data?['created_by'] = this.createdBy;
    data?['updated_by'] = this.updatedBy;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    return data;
  }
}

class Carts {
  var id;
  var userId;
  var productId;
  var hexColor;
  var size;
  var quantity;
  var createdAt;
  var updatedAt;
  Product? product;

  Carts(
      {this.id,
      this.userId,
      this.productId,
      this.hexColor,
      this.size,
      this.quantity,
      this.createdAt,
      this.updatedAt,
      this.product});

  Carts.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    userId = json?['user_id'];
    productId = json?['product_id'];
    hexColor = json?['hex_color'];
    size = json?['size'];
    quantity = json?['quantity'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
    product = json?['product'] != null
        ? new Product.fromJson(json?['product'])
        : null;
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['user_id'] = this.userId;
    data?['product_id'] = this.productId;
    data?['hex_color'] = this.hexColor;
    data?['size'] = this.size;
    data?['quantity'] = this.quantity;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data?['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  var id;
  var nameAr;
  var nameEn;
  var nameKu;
  var paragraphAr;
  var paragraphEn;
  var paragraphKu;
  var descriptionAr;
  var descriptionEn;
  var descriptionKu;
  var isVisible;
  var isOutOfStock;
  var currentQuantity;
  var minAvailableQuantity;
  var price;
  var finalPrice;
  var points;
  var isFeatured;
  var createdBy;
  var updatedBy;
  var createdAt;
  var updatedAt;
  var brandId;
  var discount;
  var isVisibleBadge;
  var isOutOfStockBadge;
  var isFeaturedBadge;

  Product(
      {this.id,
      this.nameAr,
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
      this.finalPrice,
      this.points,
      this.isFeatured,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.brandId,
      this.discount,
      this.isVisibleBadge,
      this.isOutOfStockBadge,
      this.isFeaturedBadge});

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
    isVisibleBadge = json?['is_visible_badge'];
    isOutOfStockBadge = json?['is_out_of_stock_badge'];
    isFeaturedBadge = json?['is_featured_badge'];
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
    data?['is_visible_badge'] = this.isVisibleBadge;
    data?['is_out_of_stock_badge'] = this.isOutOfStockBadge;
    data?['is_featured_badge'] = this.isFeaturedBadge;
    return data;
  }
}

class PromoCode {
  var id;
  var code;
  var userId;
  var bloggerCommissionPercentage;
  var discountPercentage;
  var expiryAt;
  var type;
  var usageCount;
  var createdAt;
  var updatedAt;

  PromoCode(
      {this.id,
      this.code,
      this.userId,
      this.bloggerCommissionPercentage,
      this.discountPercentage,
      this.expiryAt,
      this.type,
      this.usageCount,
      this.createdAt,
      this.updatedAt});

  PromoCode.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    code = json?['code'];
    userId = json?['user_id'];
    bloggerCommissionPercentage = json?['blogger_commission_percentage'];
    discountPercentage = json?['discount_percentage'];
    expiryAt = json?['expiry_at'];
    type = json?['type'];
    usageCount = json?['usage_count'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['code'] = this.code;
    data?['user_id'] = this.userId;
    data?['blogger_commission_percentage'] = this.bloggerCommissionPercentage;
    data?['discount_percentage'] = this.discountPercentage;
    data?['expiry_at'] = this.expiryAt;
    data?['type'] = this.type;
    data?['usage_count'] = this.usageCount;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    return data;
  }
}
