class products {
  String productId;
  String productName;
  String productCost;
  String productBrand;
  String productCategory;
  String productColor;
  String productMaterial;
  String productImage;
  String productAvailability;
  String productLaunchDate;
  String productSummary;

  products(
      {this.productId,
      this.productName,
      this.productCost,
      this.productBrand,
      this.productCategory,
      this.productColor,
      this.productMaterial,
      this.productImage,
      this.productAvailability,
      this.productLaunchDate,
      this.productSummary});

  products.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productCost = json['productCost'];
    productBrand = json['productBrand'];
    productCategory = json['productCategory'];
    productColor = json['productColor'];
    productMaterial = json['productMaterial'];
    productImage = json['productImage'];
    productAvailability = json['productAvailability'];
    productLaunchDate = json['productLaunchDate'];
    productSummary = json['productSummary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['productCost'] = this.productCost;
    data['productBrand'] = this.productBrand;
    data['productCategory'] = this.productCategory;
    data['productColor'] = this.productColor;
    data['productMaterial'] = this.productMaterial;
    data['productImage'] = this.productImage;
    data['productAvailability'] = this.productAvailability;
    data['productLaunchDate'] = this.productLaunchDate;
    data['productSummary'] = this.productSummary;
    return data;
  }
}
