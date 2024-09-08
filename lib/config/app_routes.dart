import '../pages/report_page.dart';

import '../pages/login_page.dart';
import '../pages/home_page.dart';
import '../pages/menu_page.dart';
import '../pages/main_page.dart';
import '../pages/edit_profile.dart';

class AppRoutes {

  static final pages = {
         '/':(context) => LoginPage(),
         '/home':(context) => HomePage(),
         '/main':(context) => MainPage(),
         '/edit_profile':(context) => ProfileEdit(),
         '/menuRestaurant':(context) => MenuPage(),
         '/report':(context) => ReportPage()
       };

  static const login = '/';
  static const homePage = '/home';
  static const mainPage = '/main';
  static const profileEdit = '/edit_profile';
  static const menuRestaurant = '/edit_profile';
  static const reportPage = '/report';
}