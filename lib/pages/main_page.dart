import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'report_page.dart';
import '../config/app_icons.dart';
import '../models/users.dart';
import 'add_producto_page.dart';
import 'menu_page.dart';
import 'profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  late User user; 
  late String role;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments as User;
    user = arguments;
    role = user.role; // Obtener el rol del usuario

    // Configura la página inicial según el rol
    if (role == 'cliente' || role == 'repartidor') {
      currentIndex = 1; // Redirigir a la pestaña de Reportes
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.ic_home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.ic_reports),
            label: 'Reportes',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.ic_add),
            label: 'Agregar',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.ic_comment),
            label: 'Mensajes',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.ic_user),
            label: 'Usuario',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          if ((role == 'cliente' || role == 'repartidor') && (index == 0 || index == 2)) {
              ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Opción deshabilitada para tu ROL')),
            );
          } else {
            setState(() {
              currentIndex = index;
            });
          }
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
      ),
    );
  }

  final pages = [
    MenuPage(),
    ReportPage(),
    AddProductoPage(),
    Center(child: Text('Asistencia')),
    ProfilePage(),
  ];
}
