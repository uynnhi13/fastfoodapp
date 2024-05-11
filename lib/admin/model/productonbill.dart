import 'package:json_annotation/json_annotation.dart';

part 'productonbill.g.dart';

@JsonSerializable()
class ProductOnBill{
  int productID;
  String productName;
  String imageURL;
  int price;
  int count;
  int total;

  ProductOnBill({required this.productID, required this.productName, required this.imageURL, required this.price, required this.count, required this.total});

  factory ProductOnBill.fromJson(Map<String, dynamic> json) => _$ProductOnBillFromJson(json);

  Map<String, dynamic> toJson() => _$ProductOnBillToJson(this);
}