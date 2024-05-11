import 'dart:convert';

class CategoryModel {
  final int? id;
  late final String name;
  final String? description;
  final String? imageURL;
  final String? accountID;
  CategoryModel({
    this.id,
    required this.name, 
     this.imageURL,
     this.description,
    this.accountID
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      imageURL: json['imageURL'],
      description: json['description'], 
      //accountID: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageURL': imageURL,
      'descriptionription': description,
      'accountID': accountID,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  static CategoryModel fromJsonString(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return CategoryModel.fromJson(json);
  }
}
