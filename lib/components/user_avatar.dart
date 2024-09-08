import 'package:flutter/material.dart';
import '../config/app_icons.dart';

class UserAvatar extends StatelessWidget {
  final double size;
  const UserAvatar({super.key, this.size = 30});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        child: Image.asset(
          AppIcons.ic_avatar,
          width: size,
          height: size,
        )
    );
  }
}