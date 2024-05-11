import 'dart:convert';

class FavoriteProducts {
  final int productId;
  final String accountId;

  FavoriteProducts({required this.productId, required this.accountId});

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'accountId': accountId,
    };
  }

  factory FavoriteProducts.fromMap(Map<String, dynamic> map) {
    return FavoriteProducts(
      productId: map['productId'],
      accountId: map['accountId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteProducts.fromJson(String source) =>
      FavoriteProducts.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FavoriteProduct(productId: $productId, accountId: $accountId)';
  }
}
