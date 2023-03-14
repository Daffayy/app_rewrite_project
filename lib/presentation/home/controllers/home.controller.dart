

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/core/utils/snackbar.util.dart';
import '../../../domain/model/home_response_model.dart';
import '../../../domain/repository/home_repository.dart';

class HomeController extends GetxController with StateMixin<HomeResponseModel>{
  final HomeRepository _homeRepository;

  HomeController({required HomeRepository homeRepository})
    : _homeRepository = homeRepository;

  @override
  Future<void> onInit () async {
    await getHomeContent();
    super.onInit();
  }

  Future <HomeResponseModel?> getHomeContent() async {
    change(null, status: RxStatus.loading());
    await _homeRepository.getHomeContent().then((value){
     change(value, status: RxStatus.success());
     return value;
    }).catchError((onError){
      change(null,status: RxStatus.error(onError.toString()));
      SnackbarUtil.showError(message: onError.toString());
      return null;
    });
  }

  Future<void> launchBrowser(String value) async{
    final url = Uri.parse(value);
    launchUrl(url,mode: LaunchMode.externalApplication);
  }
}