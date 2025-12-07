import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  var isNewPassword = true.obs;
  var isConfirmPassword = true.obs;

  void toggleNewPassword(){
    isNewPassword.value = !isNewPassword.value;
  }

  void toggleConfirmPassword(){
    isConfirmPassword.value = !isConfirmPassword.value;
  }

}