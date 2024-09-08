import 'package:flutter/material.dart';
import '../components/user_avatar.dart';
import '../styles/app_colors.dart';
import '../components/toolbar.dart';
import '../components/app_text_field.dart';
import '../config/app_strings.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(title: AppStrings.editProfile),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: UserAvatar(
                    size: 120,),
                ),
                Positioned(
                  bottom:4, 
                  right: 4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Icon(Icons.edit, color: Colors.white, size: 20,)))
              ],
            ),
            SizedBox(
              height: 16
              ),
            AppTextField(hint: 'Nombres'),
            SizedBox(
              height: 16
              ),
            AppTextField(hint: 'Apellidos'),
            SizedBox(
              height: 16
              ),
            AppTextField(hint: 'Telefono'),
            SizedBox(
              height: 16
              ),
            AppTextField(hint: 'Ubicacion')
          ],
        ),
      ),
    );
  }
}