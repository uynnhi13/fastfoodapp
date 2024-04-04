import 'package:flutter/services.dart'; // Để sử dụng ByteData

class Product {
  String? productID;
  String? productName;
  int? productPrice;
  String? productDescription;
  int? productCategory;
  String? productStatus;
  ByteData? img;

  // Constructor
  Product({
    this.productID,
    this.productName,
    this.productPrice,
    this.productDescription,
    this.productCategory,
    this.productStatus,
    this.img,
  });
  
  // Factory constructor to create a Product object from a Map
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productID: json['productID'],
      productName: json['productName'],
      productPrice: json['productPrice'],
      productDescription: json['productDescription'],
      productCategory: json['productCategory'],
      productStatus: json['productStatus'],
      // For 'img', you may need to handle ByteData from json data
      // Example: img: ByteData.view(json['img']),
    );
  }

  // Method to convert a Product object to a Map
  Map<String, dynamic> toJson() {
    return {
      'productID': productID,
      'productName': productName,
      'productPrice': productPrice,
      'productDescription': productDescription,
      'productCategory': productCategory,
      'productStatus': productStatus,
      // Similarly, you may need to convert ByteData to storable data (e.g., List<int>)
      // Example: 'img': img?.buffer.asUint8List(),
    };
  }
}
