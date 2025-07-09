import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../repository/auth_service.dart';
import '../../../../repository/share_preferences/sp_controller.dart';
import '../../../profile/profile_screen/settings/user/UserController.dart';


class LoginController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    initSharedPrefs();
  }


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  RxBool loading = false.obs;
  RxBool passwordVisible = true.obs;


  final authService = AuthService();
  late SharedPreferences prefs;

  void initSharedPrefs() async{
    prefs = await SharedPreferences.getInstance();
  }

  void changeVisibility(){
    passwordVisible.value = !passwordVisible.value;
  }



  Future<void> loginHandler() async {
    final email = emailController.text.toString().toLowerCase().trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Email and password are required',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // if (!formKey.currentState!.validate()) return;

    try {
      loading.value = true;

      final user = await authService.loginUserWithEmailAndPassword(email, password);

      if (user != null) {
        await prefs.setString('email', email);
        await saveLoginStatus(true);


        Get.offAllNamed(initialScreen);

        Get.snackbar(
          'Welcome Back!',
          'Quick Grievance',
          icon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.celebration, size: 30, color: Colors.white),
          ),
          backgroundColor: secondaryColor,
          colorText: Colors.white,
        );

      } else {
        Get.snackbar(
          'Oops!',
          'Something went wrong during login.',
          icon: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.error, size: 30, color: Colors.white),
          ),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }

    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Login failed';
      if (e.code == 'user-not-found') {
        errorMessage = 'User not found';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Incorrect password';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Invalid email format';
      }


      Get.snackbar(
        'Login Error',
        errorMessage,
        icon: const Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(Icons.error, size: 30, color: Colors.white),
        ),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'An unexpected error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      loading.value = false;
    }
  }

@override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

}