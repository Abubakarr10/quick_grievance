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

  void login()async{

    final user = await authService.loginUserWithEmailAndPassword(
        emailController.text.toString(),
        passwordController.text.toString()
    );

    if(formKey.currentState!.validate() && emailController.text.toString() == 'warden.admin@quick.com'){
      try{

        loading.value = true;

        if(user != null) {

          prefs.setString('email', emailController.value.text.toString());
          await saveWardenLoginStatus(true);


          Get.offAllNamed(adminScreen);

          Get.snackbar(
              'Welcome Warden!', 'Quick Grievance',
              icon: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.celebration,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              colorText: Colors.white,
              backgroundColor: secondaryColor
          );

        } else {
          Get.snackbar(
              'OOPS!', 'Something Went Wrong',
              icon: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.error,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              colorText: Colors.white,
              backgroundColor: Colors.red
          );
          loading.value = false;
        }

      } on FirebaseAuthException catch(error){
        Get.snackbar(
            'OOPS!', 'Something Wrong. $error',
            icon: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.error,
                size: 30,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red
        );

        loading.value = false;

      }
    }else{
      Get.snackbar(
          'OOPS!', 'Only Warden (Admin) can login',
          colorText: Colors.white,
          icon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.error,
              size: 30,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.red
      );
    }

  }



}