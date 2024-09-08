import 'package:flutter/material.dart';
import '../config/app_icons.dart';
import '../config/app_routes.dart';
import '../config/app_strings.dart';
import '../models/users.dart'; 
import '../api/menu_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final MenuApi _menuApi = MenuApi(); // Instanciar MenuApi aquí
  String? _errorMessage;

  Future<void> _login() async {
  final username = _usernameController.text;
  final password = _passwordController.text;

  if (username.isEmpty || password.isEmpty) {
    setState(() {
      _errorMessage = 'Por favor, ingresa tu nombre de usuario y contraseña.';
    });
    return;
  }

  User? user = await _menuApi.loginUser(username, password);

  if (user != null) {
    Navigator.of(context).pushNamed(AppRoutes.mainPage, arguments: user);
  } else {
    setState(() {
      _errorMessage = 'Nombre de usuario o contraseña incorrectos.';
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [

              




                Spacer(),
                Image.asset(
                  AppIcons.ic_foodplease,
                  width: 250, 
                  height: 250,
                ),
                Spacer(),
                Text(
                  AppStrings.loginToContinue,
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'Correo electrónico',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    filled: true,
                    fillColor: Colors.blueGrey.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    filled: true,
                    fillColor: Colors.blueGrey.withOpacity(0.5),
                  ),
                ),
                if (_errorMessage != null) 
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      _errorMessage!,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      print('FORGOT');
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                    child: Text(AppStrings.forgotPwd),
                  ),
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                    ),
                    child: Text(AppStrings.logIn),
                  ),
                ),
                
                Row(
                  children: [
                    Text(AppStrings.noAccount, style: TextStyle(color: Colors.white)),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.amber,
                      ),
                      child: Text(
                        AppStrings.register,
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
