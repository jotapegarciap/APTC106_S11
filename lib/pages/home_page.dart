import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/post_item.dart';
import '../components/toolbar.dart';
import '../config/app_icons.dart';

class HomePage extends StatelessWidget{
  HomePage({super.key});
  List<String> users = [];

  @override
  Widget build(BuildContext context){
    mockUserFromServer();
    return Scaffold(
      appBar: ToolBar(title: 'Bienvenid@', actions: [
        IconButton(onPressed:() {}, icon: SvgPicture.asset(AppIcons.ic_location))
      ],),
      //body: ListView(children: mockUserFromServer()),
      body: ListView.separated(itemBuilder:(context, index) {
        return PostItem(user: users[index],);
      }, itemCount: users.length, separatorBuilder: (BuildContext context, int index) { 
          return SizedBox(height: 24,);
       },),
    );
  }

  mockUserFromServer(){
      for(var i = 0; i < 25; i++){
      users.add('Usuario $i');
    }
  }

// List<Widget> mockUserFromServer(){
//   List<Widget> users = [];
//   for(var i = 0; i < 20; i++){
//     users.add(PostItem());
//   }
//   return users;
// }

}