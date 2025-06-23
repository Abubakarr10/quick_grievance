// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../model/user_model.dart';
import '../../../../repository/auth_service.dart';
import '../../../../repository/firebase_controller/user_fire_controller.dart';


class SignUpController extends GetxController{

  RxBool loading = false.obs;
  RxBool passwordVisible = true.obs;
  RxBool isChecked = false.obs;

  final formKey = GlobalKey<FormState>();

  final authService = AuthService();
  late SharedPreferences prefs;

  void initSharedPrefs() async{
    prefs = await SharedPreferences.getInstance();
  }

  UserFireController userFireController = UserFireController();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController regNoController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController roomNoController = TextEditingController();
  TextEditingController batchController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxString departmentName = ''.obs;

  void changeVisibility(){
    passwordVisible.value = !passwordVisible.value;
  }

  void signUp()async{
    if (formKey.currentState!.validate()) {
      try {

        loading.value = true;

        final user = await authService.createUserWithEmailAndPassword(
            emailController.text.toString().trim(),
            passwordController.text.toString().trim()
        );

        if (user != null) {
          final currentUser = user;

          UserModel userModel = UserModel(
            uid: currentUser.uid,
            email: emailController.text.toString().trim(),
            fullName: fullNameController.text.toString().trim(),
            password: passwordController.text.toString().trim(),
            regNo: regNoController.text.toString(),
            phoneNo: phoneNoController.text.toString().trim(),
            roomNo: roomNoController.text.toString().trim(),
            departmentName: departmentName.value,
            batch: batchController.text.toString().trim(),
            isAuthorized: false,
            degree: '',
          );

          userFireController.createUser(userModel);

          Get.snackbar(
              'Yahoo!', 'Account Created Successfully',
              icon: const Icon(Icons.celebration_outlined,
                color: secondaryColor,),
              backgroundColor: accentColor
          );


          Get.offAllNamed(entryPointScreen);

        }
      } on FirebaseAuthException catch (error) {

        Get.snackbar(
            'OOPS!', 'Something Went Wrong ${error.toString}',
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
    } else {
      Get.snackbar(
        'OOPS!', 'Something Wrong',
        icon: const Icon(
          Icons.error,
          size: 30,
          color: Colors.white,
        ),
      );

    }
  }


}