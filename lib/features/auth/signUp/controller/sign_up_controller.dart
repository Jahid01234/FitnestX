import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();



  RxBool isPasswordHidden = true.obs;
  RxBool isChecked = false.obs;

  void toggleCheck() {
    isChecked.value = !isChecked.value;
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }







  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}