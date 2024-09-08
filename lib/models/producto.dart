class Producto {
  int? id;
  String nombreProducto;
  double valor;
  bool disponibilidad;

  Producto({
    this.id,
    required this.nombreProducto,
    required this.valor,
    required this.disponibilidad,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre_producto': nombreProducto,
      'valor': valor,
      'disponibilidad': disponibilidad ? 1 : 0,
    };
  }

  factory Producto.fromMap(Map<String, dynamic> map) {
    return Producto(
      id: map['id'],
      nombreProducto: map['nombre_producto'],
      valor: map['valor'],
      disponibilidad: map['disponibilidad'] == 1,
    );
  }
}
