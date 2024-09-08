import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/producto.dart';
import '../models/users.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'foodplease.db');
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 2,
    );
  }

  Future _onCreate(Database db, int version) async {
    // Tabla de productos
    await db.execute('''
      CREATE TABLE productos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre_producto TEXT,
        valor REAL,
        disponibilidad INTEGER
      )
    ''');

  // Tabla de usuarios con roles
  await db.execute('''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      username TEXT NOT NULL,
      password TEXT NOT NULL,
      role TEXT NOT NULL
    )
  ''');
  // Insertar usuarios de ejemplo
  await db.insert('users', {
    'username': 'admin',
    'password': 'admin',
    'role': 'restaurant'
  });

  await db.insert('users', {
    'username': 'cliente',
    'password': 'cliente',
    'role': 'cliente'
  });

  await db.insert('users', {
    'username': 'repartidor',
    'password': 'repartidor',
    'role': 'repartidor'
  });
  }

  Future<int> insertProducto(Producto producto) async {
    Database db = await database;
    return await db.insert('productos', producto.toMap());
  }

  Future<List<Producto>> getProductos() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('productos');
    return List.generate(maps.length, (i) {
      return Producto.fromMap(maps[i]);
    });
  }

  Future<int> updateProducto(Producto producto) async {
    Database db = await database;
    return await db.update(
      'productos',
      producto.toMap(),
      where: 'id = ?',
      whereArgs: [producto.id],
    );
  }

  Future<int> deleteProducto(int id) async {
    Database db = await database;
    return await db.delete(
      'productos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> insertUser(String username, String password, String role) async {
    Database db = await database;
    return await db.insert('users', {
      'username': username,
      'password': password,
      'role': role,
    });
  }

  Future<Map<String, dynamic>?> getUser(String username, String password) async {
    final db = await database;
    final result = await db.query('users',
        where: 'username = ? AND password = ?',
        whereArgs: [username, password]);

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }
}
