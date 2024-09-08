import 'package:flutter/material.dart';
import '../styles/app_text.dart';

class PostItem extends StatelessWidget {
  final String user;
  const PostItem({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Row(
            children: [
              Image.asset('assets/temp/user.png',
                width: 40,
                height: 40,
              ),
              SizedBox(width: 12),
              Text(user, style: AppText.subtitle3,),
            ],
            ),
            SizedBox(height: 12,),
            Image.asset('assets/temp/post1.jpeg'),
            SizedBox(height: 12,),
            Text('Lorem ipsum dolor sit amet consectetur adipiscing, elit massa sociosqu consequat mus.', style: AppText.subtitle3)
          ],
        ),
      );
  }
}