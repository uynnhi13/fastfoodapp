import 'dart:math';

import 'package:fastfoodapp/model/address.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/cart.dart';

class DatabaseHelper {
  // Singleton pattern
  static final DatabaseHelper _databaseService = DatabaseHelper._internal();
  factory DatabaseHelper() => _databaseService;
  DatabaseHelper._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, 'db_cart.db');
    print(
        "Đường dẫn database: $databasePath"); // in đường dẫn chứa file database
    return await openDatabase(path, onCreate: _onCreate, version: 1
        // ,
        // onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
        );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE Cart('
      'productID INTEGER, name TEXT, price FLOAT, img TEXT, des TEXT, count INTEGER)',
    );
    await db.execute(
      'CREATE TABLE Address('
      'addressId INTEGER PRIMARY KEY AUTOINCREMENT,accountId INTEGER, address TEXT,status INTEGER)',
    );
  }

  //XỬ LÝ ĐỊA CHỈ
  Future<void> insertAddress(Address address) async {
    final db = await _databaseService.database;
    await db.insert(
      'Address',
      address.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Address>> getAddresses(String accountId) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'Address',
      where: 'accountId = ?',
      whereArgs: [accountId],
    );
    return List.generate(maps.length, (index) {
      return Address(
        addressId: maps[index]['addressId'],
        accountId: maps[index]['accountId'],
        address: maps[index]['address'],
        status: maps[index]['status'],
      );
    });
  }

  Future<void> deleteAddress(int addressId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String id = pref.getString('accountID').toString();
    final db = await _databaseService.database;
    await db.delete(
      'Address',
      where: 'AccountID = ? AND addressId=?',
      whereArgs: [id, addressId],
    );
  }

  Future<void> updateAllAddressesStatus() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String id = pref.getString('accountID').toString();
    final db = await _databaseService.database;
    await db.update(
      'Address',
      {'status': 2},
      where: 'accountId = ?',
      whereArgs: [id],
    );
  }

  Future<bool> checkAddressStatus(int addressId) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String id = pref.getString('accountID').toString();
  final db = await _databaseService.database;
  final List<Map<String, dynamic>> maps = await db.query(
    'Address',
    columns: ['status'],
    where: 'accountId = ? AND addressId = ?',
    whereArgs: [id, addressId],
  );
  if (maps.isEmpty) {
    // Không tìm thấy địa chỉ với id tương ứng
    return false;
  } else {
    // Tìm thấy địa chỉ, kiểm tra giá trị của status
    return maps[0]['status'] == 1;
  }
}

Future<Address?> findAddressWithStatusOne() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String accountId = pref.getString('accountID').toString();
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query(
      'Address',
      where: 'accountId = ? AND status = ?',
      whereArgs: [accountId, 1],
    );

    // Kiểm tra nếu có ít nhất một bản ghi được tìm thấy
    if (maps.isNotEmpty) {
      // Trả về địa chỉ đầu tiên có status == 1
      return Address(
        addressId: maps[0]['addressId'],
        accountId: maps[0]['accountId'],
        address: maps[0]['address'],
        status: maps[0]['status'],
      );
    } else {
      // Nếu không có bản ghi nào được tìm thấy, trả về null
      return null;
    }
  }

  Future<void> updateAddressStatus(int addressId) async {
    final db = await _databaseService.database;
    await db.update(
      'Address',
      {'status': 1},
      where: 'addressId = ?',
      whereArgs: [addressId],
    );
  }

  Future<void> insertProduct(Cart productModel) async {
    final db = await _databaseService.database;
    await db.insert(
      'Cart',
      productModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> addProduct(Cart productModel) async {
    final db = await _databaseService.database;
    final existProduct = await checkProductExists(productModel.productID);
    if (existProduct) {
      final product = await productExists(productModel.productID);
      await addExishProduct(product, productModel.count);
    } else {
      await insertProduct(productModel);
      print(
          "Không Có sản phẩm tồn tại nha và in ra idproduct ${productModel.productID} và product count nè ${productModel.count}");
    }
  }

  Future<List<Cart>> products() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('Cart');
    return List.generate(maps.length, (index) => Cart.fromMap(maps[index]));
  }

  Future<bool> checkProductExists(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
        await db.query('Cart', where: 'productID = ?', whereArgs: [id]);
    return maps.isNotEmpty; // Trả về true nếu có sản phẩm tồn tại với id đã cho
  }

  Future<Cart> productExists(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
        await db.query('Cart', where: 'productID = ?', whereArgs: [id]);
    return Cart.fromMap(
        maps[0]); // Trả về true nếu có sản phẩm tồn tại với id đã cho
  }

  Future<void> minus(Cart product) async {
    final db = await _databaseService.database;
    if (product.count > 1) product.count--;
    await db.update(
      'Cart',
      product.toMap(),
      where: 'productID = ?',
      whereArgs: [product.productID],
    );
  }

  Future<void> addExishProduct(Cart product, int sl) async {
    final db = await _databaseService.database;
    print(product.count);
    product.count += sl;
    await db.update(
      'Cart',
      product.toMap(),
      where: 'productID = ?',
      whereArgs: [product.productID],
    );
  }

  Future<void> add(Cart product) async {
    final db = await _databaseService.database;
    product.count++;
    await db.update(
      'Cart',
      product.toMap(),
      where: 'productID = ?',
      whereArgs: [product.productID],
    );
  }

  Future<void> deleteProduct(int id) async {
    final db = await _databaseService.database;
    await db.delete(
      'Cart',
      where: 'productID = ?',
      whereArgs: [id],
    );
  }

  Future<void> clear() async {
    final db = await _databaseService.database;
    await db.delete('Cart', where: 'count > 0');
  }

  
}
