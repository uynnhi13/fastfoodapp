import 'dart:io';
import 'dart:ui';
import 'package:fastfoodapp/data/model/category.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  //Singleton pattern
  static final DatabaseHelper _databaseService = DatabaseHelper._internal();
  factory DatabaseHelper() => _databaseService;
  DatabaseHelper._internal();

  //Khởi tạo database nếu database không tồn tại.
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    //Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  //In ra đưuòng dẫn chứa db
  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, 'db_product.db');
    print("Đường dẫn database: $databasePath"); //in đường dẫn chứa database
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  //Thực hiện câu lệnh SQL để tạo bảng category trong csdl
  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE category(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT)');
  }

  //Thêm cate vào csdl
  Future<void> insertCategory(CategoryModel categoryModel) async {
    final db = await _databaseService.database;

    await db.insert(
      'category',
      categoryModel
          .toMap(), //chuyển cateModel thành 1 Map trước khi chèn vào csdl
      conflictAlgorithm:
          ConflictAlgorithm.replace, //Xử lý xung đột khi chèn dữ liệu
    );
  }

  //Lấy danh sách cate
  Future<List<CategoryModel>> categories() async {
    final db = await _databaseService.database;
    //truy vấn tất cả các dòng trong bảng cate và lấy kết quả dưới dạng List<Map>
    final List<Map<String, dynamic>> maps = await db.query('category');
    //Tạo danh sách các đối tượng CateModel từ List<Map> đã lấy được
    return List.generate(
        maps.length, (index) => CategoryModel.fromMap(maps[index]));
  }

  //Lấy 1 cate dựa trên id
  Future<CategoryModel> category(int id) async {
    final db = await _databaseService.database;
    //Truy vấn dữ liệu từ bảng cate dựa trên id
    final List<Map<String, dynamic>> maps =
        await db.query('category', where: 'id=?', whereArgs: [id]);
    //Trả về đối tượng cateModel được tạo từ dòng dữ liệu đầu tiên trong kết quả truy vấn
    return CategoryModel.fromMap(maps[0]);
  }

  //Cập nhật một cate trong bảng category
  Future<void> updateCategory(CategoryModel cate) async {
    final db = await _databaseService.database;
    await db.update(
      'category',
      cate.toMap(), //Chuyển đối tượng cateModel thành 1 Map trước khi update
      where: 'id=?', //xác định điều kiện cập nhật dữ liệu dựa trên id
      whereArgs: [cate.id], //Truyền id vào danh sách đối số của câu lệnh SQL
    );
  }

  //Xóa 1 cate dựa trên id
  Future<void> deleteCategory(int id) async {
    final db = await _databaseService.database;
    await db.delete(
      'category',
      where: 'id=?', //xác định điều kiện cập nhật dữ liệu dựa trên id
      whereArgs: [id], //Truyền id vào danh sách đối số của câu lệnh SQL
    );
  }
}
