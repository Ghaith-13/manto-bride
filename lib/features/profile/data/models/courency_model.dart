class CourencyModel {
  CurencyData? data;
  bool? errors;

  CourencyModel({this.data, this.errors});

  CourencyModel.fromJson(Map<String, dynamic>? json) {
    data =
        json?['data'] != null ? new CurencyData.fromJson(json?['data']) : null;
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

class CurencyData {
  List<Currnecies>? currnecies;

  CurencyData({this.currnecies});

  CurencyData.fromJson(Map<String, dynamic>? json) {
    if (json?['currnecies'] != null) {
      currnecies = <Currnecies>[];
      json?['currnecies'].forEach((v) {
        currnecies!.add(new Currnecies.fromJson(v));
      });
    }
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    if (this.currnecies != null) {
      data?['currnecies'] = this.currnecies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Currnecies {
  int? id;
  String? name;
  String? symbolAr;
  String? symbolEn;
  String? exchangeRate;
  String? taxPercentage;
  String? isDefault;
  String? createdAt;
  String? updatedAt;

  Currnecies(
      {this.id,
      this.name,
      this.symbolAr,
      this.symbolEn,
      this.exchangeRate,
      this.taxPercentage,
      this.isDefault,
      this.createdAt,
      this.updatedAt});

  Currnecies.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    symbolAr = json?['symbol_ar'];
    symbolEn = json?['symbol_en'];
    exchangeRate = json?['exchange_rate'];
    taxPercentage = json?['tax_percentage'];
    isDefault = json?['is_default'];
    createdAt = json?['created_at'];
    updatedAt = json?['updated_at'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = new Map<String, dynamic>();
    data?['id'] = this.id;
    data?['name'] = this.name;
    data?['symbol_ar'] = this.symbolAr;
    data?['symbol_en'] = this.symbolEn;
    data?['exchange_rate'] = this.exchangeRate;
    data?['tax_percentage'] = this.taxPercentage;
    data?['is_default'] = this.isDefault;
    data?['created_at'] = this.createdAt;
    data?['updated_at'] = this.updatedAt;
    return data;
  }
}
