import 'package:flutter/material.dart';
import 'config/app_routes.dart';
import 'styles/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Urbanist',
      scaffoldBackgroundColor: AppColors.background,
      brightness: Brightness.dark),
       initialRoute: AppRoutes.login,
       routes: AppRoutes.pages,
    );
  }
}