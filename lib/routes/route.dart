import 'package:get/get.dart';
import 'package:mediumm/Home/HOme.dart';
import 'package:mediumm/Saved/Saved.dart';
import 'package:mediumm/Search/Search.dart';
import 'package:mediumm/routes/routenames.dart';

class Routes {
  static final pages = [
    GetPage(name: Routenames.home, page: () => HomeScreen()),
    GetPage(name: Routenames.search, page: () => Search()),
    GetPage(name: Routenames.saved, page: () => Saved()),
    GetPage(name: Routenames.account, page: () => Search()),
  ];
}
