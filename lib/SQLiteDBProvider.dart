import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'models/Product.dart';

class SQLiteDBProvider{
  SQLiteDBProvider._();
  static final SQLiteDBProvider db = SQLiteDBProvider._();
  static Database _database;

  Future<Database> get database async{
    if (_database != null)
      return _database;

    print("database is ");
    print(_database);
    _database = await initDB();

    print("dbdbdb");
    print(_database);
    return _database;
  }



  initDB() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "ProductDB.db");
    print(path);
    var openDB = openDatabase(path,version: 2, onCreate:populateDb );
    print(openDB.then((data){print("asda");print(data);}));
    openDB.then((bac)async {List<Map> results = await bac.query(
        "Product", columns: Product.columns, orderBy: "id ASC"
    );
    print(results);
    });
    return await openDB;

//    openDatabase(
//      path,version: 1,
//      onOpen: (db){ _database = db;},
//      onCreate: (Database db, int version) async{
//        await db.execute(
//            "CREATE TABLE Product ("
//                "id INTEGER PRIMARY KEY,"
//                "name TEXT,"
//                "description TEXT,"
//                "price INTEGER,"
//                "image TEXT"")"
//        );

//        await db.execute("INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)",[1, "iPhone", "iPhone is the stylist phone ever", 1000, "iphone.png"]);
//        await db.execute("INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)", [2, "Pixel", "Pixel is the most feature phone ever", 800, "pixel.png"]);
//        await db.execute("INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)", [3, "Laptop", "Laptop is most productive development tool", 2000, "laptop.png"]);
//        await db.execute("INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)", [4, "Tablet", "Laptop is most productive development tool", 1500, "tablet.png"]);
//        await db.execute("INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)", [5, "Pendrive", "Pendrive is useful storage medium", 100, "pendrive.png"]);
//        await db.execute("INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)", [6, "Floppy Drive", "Floppy drive is useful rescue storage medium", 20, "floppy.png"]);
//
//       }
//    );
  }

  void populateDb(Database db, int version) async {
    await db.execute( "CREATE TABLE Product ("
        "id INTEGER PRIMARY KEY,"
        "name TEXT,"
        "description TEXT,"
        "price INTEGER,"
        "image TEXT"")");

    await db.execute("INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)",[1, "iPhone", "iPhone is the stylist phone ever", 1000, "iphone.png"]);
    await db.execute("INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)", [2, "Pixel", "Pixel is the most feature phone ever", 800, "pixel.png"]);
    await db.execute("INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)", [3, "Laptop", "Laptop is most productive development tool", 2000, "laptop.png"]);
    await db.execute("INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)", [4, "Tablet", "Laptop is most productive development tool", 1500, "tablet.png"]);
    await db.execute("INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)", [5, "Pendrive", "Pendrive is useful storage medium", 100, "pendrive.png"]);
    await db.execute("INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)", [6, "Floppy Drive", "Floppy drive is useful rescue storage medium", 20, "floppy.png"]);

  }

  Future<List<Product>> getAllProducts()async{
    print('get all product');
    final db = await database;

    print('database');
    print(_database);

    List<Map> results = await db.query(
        "Product", columns: Product.columns, orderBy: "id ASC"
    );

    print('results adalah '+results.toString());
    List<Product> products = new List();
    results.forEach((result) {
      Product product = Product.fromMap(result);
      products.add(product);
    });
    print('produk adalah '+products[0].toString());
    return products;
  }

  Future<Product> getProductById(int id) async {
    final db = await database;
    var result = await db.query("Product", where: "id = ", whereArgs: [id]);
    return result.isNotEmpty ? Product.fromMap(result.first) : Null;
  }

  insert(Product product) async {
    final db = await database;
    var maxIdResult = await db.rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM Product");
    var id = maxIdResult.first["last_inserted_id"];
    var result = await db.rawInsert(
        "INSERT Into Product (id, name, description, price, image)"
            " VALUES (?, ?, ?, ?, ?)",
        [id, product.name, product.description, product.price, product.image]
    );
    return result;
  }
  update(Product product) async {
    final db = await database;
    var result = await db.update(
        "Product", product.toMap(), where: "id = ?", whereArgs: [product.id]
    );
    return result;
  }
  delete(int id) async {
    final db = await database;
    db.delete("Product", where: "id = ?", whereArgs: [id]);
  }


}
