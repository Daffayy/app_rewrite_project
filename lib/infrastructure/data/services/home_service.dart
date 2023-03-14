

import 'package:get/get.dart';

import '../../../domain/model/home_response_model.dart';

class HomeService {
  final _connect = Get.find<GetConnect>();

  String get _home => 'home';

  Future<HomeResponseModel> fetchHomeContent() async {
    final response = await _connect.get(_home, decoder: (data) =>
    HomeResponseModel.fromJson(data as Map<String, dynamic>));

    if (!response.hasError){
      return response.body!;
    }else{
      return Future.error("An error occurred while fetching data.");
    }
  }
}