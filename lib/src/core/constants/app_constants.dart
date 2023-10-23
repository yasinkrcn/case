import 'package:flutter/material.dart';

class AppConstants {
  static final AppConstants _instance = AppConstants._init();
  AppConstants._init();

  factory AppConstants() {
    return _instance;
  }

  ///Tasarımda bulunan cihazın ekran boyutları

  Size designDeviceSize = const Size(375, 812);

  static const String appName = "voco case";

  ///Request atacağımız baseUrl
  static const String baseUrl = "https://reqres.in/";
}
