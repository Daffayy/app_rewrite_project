import 'package:bank_mas_rewrite/infrastructure/navigation/bindings/routes.dart';
import 'package:get/get.dart';

import '../../../presentation/home/home.screen.dart';
import 'controllers/home.controller.binding.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeControllerBinding(),
    ),
  ];
}