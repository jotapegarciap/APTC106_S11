class User {
  int? id;
  String username;
  String password;
  String role;

  User({this.id, required this.username, required this.password, required this.role});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'role': role,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      password: map['password'],
      role: map['role'],
    );
  }
}
