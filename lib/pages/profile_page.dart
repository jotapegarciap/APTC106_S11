import 'package:flutter/material.dart';
import '../components/user_avatar.dart';
import '../config/app_routes.dart';
import '../styles/app_text.dart';
import '../models/users.dart';

enum ProfileMenu { edit, logout }

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = ModalRoute.of(context)!.settings.arguments as User?;
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        automaticallyImplyLeading: false,  // Desactiva el botón de retroceso
        actions: [
          PopupMenuButton<ProfileMenu>(
            onSelected: (value) {
              switch (value) {
                case ProfileMenu.edit:
                  Navigator.of(context).pushNamed(AppRoutes.profileEdit);
                  break;
                case ProfileMenu.logout:
                  Navigator.of(context).pushNamed(AppRoutes.login);
                  break;
                default:
              }
            },
            icon: Icon(Icons.more_vert_rounded),
            itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text('Editar'), value: ProfileMenu.edit),
                PopupMenuItem(child: Text('Cerrar Sesión'), value: ProfileMenu.logout),
              ];
            },
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 24),
          UserAvatar(
            size: 120,
          ),
          SizedBox(height: 24),
          Text(
            '${(user?.username ?? 'Invitado').toUpperCase()}',
            style: AppText.header2,
          ),
          Text(
            'Santiago, Chile',
            style: AppText.subtitle3,
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('472', style: AppText.header2),
                  Text('DATA'),
                ],
              ),
              Column(
                children: [
                  Text('119', style: AppText.header2),
                  Text('DATA'),
                ],
              ),
              Column(
                children: [
                  Text('860', style: AppText.header2),
                  Text('DATA'),
                ],
              ),
            ],
          ),
          Divider(thickness: 1, height: 40),
        ],
      ),
    );
  }
}
