import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../../../presentation/home/controllers/home.controller.dart';
import '../domains/home.repository.binding.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    final homeRepositoryBinding = HomeRepositoryBinding();

    Get.lazyPut<HomeController>(
          () => HomeController(homeRepository: homeRepositoryBinding.repository),
    );
  }
}