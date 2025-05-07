import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../repository/auth_service.dart';
import '../../../../repository/share_preferences/sp_controller.dart';


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

  void login()async{

    final user = await authService.loginUserWithEmailAndPassword(
        emailController.text.toString(),
        passwordController.text.toString()
    );

    if(formKey.currentState!.validate()){
      try{

        loading.value = true;

        if(user != null) {

          prefs.setString('email', emailController.value.text.toString());
          await saveLoginStatus(true);

          Get.offAllNamed(entryPointScreen);

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
                size: 50,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red
        );

        loading.value = false;

      }
    }

  }



}