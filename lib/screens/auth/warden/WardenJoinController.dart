import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../conts/app_colors.dart';
import '../../../repository/auth_service.dart';
import '../../../repository/share_preferences/sp_controller.dart';

class WardenJoinController extends GetxController{

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

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (!formKey.currentState!.validate()) return;

    // Only allow specific warden email
    if (email != 'warden.admin@quick.com') {
      Get.snackbar(
        'Unauthorized',
        'Only Warden (Admin) can login',
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(Icons.error, size: 30, color: Colors.white),
        ),
      );
      return;
    }

    try {
      loading.value = true;

      final user = await authService.loginUserWithEmailAndPassword(email, password);

      if (user != null) {
        // Save email and login state
        await prefs.setString('email', email);
        await saveWardenLoginStatus(true);

        // Navigate to admin screen
        Get.offAllNamed(adminScreen);

        Get.snackbar(
          'Welcome Warden!',
          'Quick Grievance',
          colorText: Colors.white,
          backgroundColor: secondaryColor,
          icon: const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.celebration, size: 30, color: Colors.white),
          ),
        );
      } else {
        Get.snackbar(
          'Oops!',
          'Something went wrong during login.',
          colorText: Colors.white,
          backgroundColor: Colors.red,
          icon: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.error, size: 30, color: Colors.white),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Login failed';
      if (e.code == 'user-not-found') {
        errorMessage = 'Warden account not found';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Incorrect password';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Invalid email format';
      }

      Get.snackbar(
        'Login Error',
        errorMessage,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        icon: const Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(Icons.error, size: 30, color: Colors.white),
        ),
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'An unexpected error occurred: $e',
        colorText: Colors.white,
        backgroundColor: Colors.red,
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