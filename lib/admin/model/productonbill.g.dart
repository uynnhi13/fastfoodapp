// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productonbill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductOnBill _$ProductOnBillFromJson(Map<String, dynamic> json) =>
    ProductOnBill(
      productID: (json['productID'] as num).toInt(),
      productName: json['productName'] as String,
      imageURL: json['imageURL'] as String,
      price: (json['price'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$ProductOnBillToJson(ProductOnBill instance) =>
    <String, dynamic>{
      'productID': instance.productID,
      'productName': instance.productName,
      'imageURL': instance.imageURL,
      'price': instance.price,
      'count': instance.count,
      'total': instance.total,
    };
