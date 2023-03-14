

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'config.dart';

class Initializer {
  static Future <void> init () async {
    try{
      WidgetsFlutterBinding.ensureInitialized();
      _initGetConnect();
      _initScreenPreference();
    }catch (err){
      rethrow;
    }
  }

  static Future <void> _initGetConnect () async {
    final connect = GetConnect();
    final url = ConfigEnvironments.getEnvironments()['url'];
    connect.baseUrl = url;
    Logger ().i('connected to: $url');
    Get.put(connect);
  }
  static void _initScreenPreference (){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}