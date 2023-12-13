class ProductModel {
  final Meta meta;
  final List<Result> results;

  ProductModel({
    required this.meta,
    required this.results,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        meta: Meta.fromJson(json["meta"]),
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Meta {
  final bool success;
  final String message;

  Meta({
    required this.success,
    required this.message,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}

class Result {
  final int id;
  final ProductType productType;
  final String name;
  final String ingredients;
  final String image;
  final List<ProductDetail> productDetail;

  Result({
    required this.id,
    required this.productType,
    required this.name,
    required this.ingredients,
    required this.image,
    required this.productDetail,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        productType: ProductType.fromJson(json["productType"]),
        name: json["name"],
        ingredients: json["ingredients"],
        image: json["image"],
        productDetail: List<ProductDetail>.from(
            json["productDetail"].map((x) => ProductDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "productType": productType.toJson(),
        "name": name,
        "ingredients": ingredients,
        "image": image,
        "productDetail":
            List<dynamic>.from(productDetail.map((x) => x.toJson())),
      };
}

class ProductDetail {
  final int id;
  final int productId;
  final int price;
  final int totalStock;
  final String size;

  ProductDetail({
    required this.id,
    required this.productId,
    required this.price,
    required this.totalStock,
    required this.size,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        id: json["id"],
        productId: json["productId"],
        price: json["price"],
        totalStock: json["totalStock"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "price": price,
        "totalStock": totalStock,
        "size": size,
      };
}

class ProductType {
  final int id;
  final String typeName;
  final String typeDescription;

  ProductType({
    required this.id,
    required this.typeName,
    required this.typeDescription,
  });

  factory ProductType.fromJson(Map<String, dynamic> json) => ProductType(
        id: json["id"],
        typeName: json["typeName"],
        typeDescription: json["typeDescription"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "typeName": typeName,
        "typeDescription": typeDescription,
      };
}
