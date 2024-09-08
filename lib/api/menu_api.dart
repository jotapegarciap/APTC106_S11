import '../models/producto.dart';
import '../models/users.dart';
import '../db/database_helper.dart';

class MenuApi {
  final DatabaseHelper _dbHelper = DatabaseHelper();

// Métodos para productos
  Future<List<Producto>> fetchMenu() async {
    return await _dbHelper.getProductos();
  }

  Future<void> addProducto(Producto producto) async {
    await _dbHelper.insertProducto(producto);
  }

  Future<void> editProducto(Producto producto) async {
    await _dbHelper.updateProducto(producto);
  }

  Future<void> deleteProducto(int id) async {
    await _dbHelper.deleteProducto(id);
  }

  // Métodos para usuarios
  Future<User?> loginUser(String username, String password) async {
    Map<String, dynamic>? userMap = await _dbHelper.getUser(username, password);
    print('ENTRO LOGIN');
    if (userMap != null) {
      return User.fromMap(userMap);
    } else {
      return null;
    }
  }

  Future<void> registerUser(String username, String password, String role) async {
    await _dbHelper.insertUser(username, password, role);
  }
}
