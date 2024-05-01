import 'dart:convert';

class CategoryModel {
  final int? id;
  final String name;
  final String description;

  CategoryModel({
    this.id,
    required this.name,
    required this.description
  });

  //Columns in the databbase
  Map<String,dynamic> toMap(){
    return{
      'id':id,
      'name':name,
      'description':description
    };
  }

  factory CategoryModel.fromMap(Map<String,dynamic> map){
    return CategoryModel(
      id:map['id']?.toInt() ??0,
      name:map['name']??'',
      description:map['description']??'',
    );
  }

  String toJson()=>json.encode(toMap());
  factory CategoryModel.fromJson(String source)=>
      CategoryModel.fromMap(json.decode(source));

  @override
  String toString()=>'Category(id:$id,name:$name,description:$description)';
  
}