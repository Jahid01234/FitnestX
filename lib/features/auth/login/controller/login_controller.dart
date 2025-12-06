import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();



  RxBool isPasswordHidden = true.obs;


  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }







  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}