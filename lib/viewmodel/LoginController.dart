import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app_getx/view/HomeScreen.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;

  Future<dynamic> login() async {
    Dio dio = Dio();
    var baseUrl = "http://192.168.1.3:80/api";
    var res = await dio.get(
        '$baseUrl/user/email/${emailController.value.text}/${passwordController.value.text}');

    if (res.data.length > 0) {
      Get.offAll(HomeScreen());
    } else {
      Get.snackbar("Login Gagal", "Email atau Password Salah",
          snackPosition: SnackPosition.BOTTOM);
    }

    void cleanController() {
      emailController.value.text = "";
      passwordController.value.text = "";
    }
  }
}
