class ProductModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  ProductModelRating? rating;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    title = json["title"]?.toString();
    price = json["price"]?.toDouble();
    description = json["description"]?.toString();
    category = json["category"]?.toString();
    image = json["image"]?.toString();
    rating = (json["rating"] != null)
        ? ProductModelRating.fromJson(json["rating"])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["price"] = price;
    data["description"] = description;
    data["category"] = category;
    data["image"] = image;
    if (rating != null) {
      data["rating"] = rating!.toJson();
    }
    return data;
  }
}

class ProductModelRating {
  double? rate;
  int? count;

  ProductModelRating({
    this.rate,
    this.count,
  });
  ProductModelRating.fromJson(Map<String, dynamic> json) {
    rate = json["rate"]?.toDouble();
    count = json["count"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["rate"] = rate;
    data["count"] = count;
    return data;
  }
}
