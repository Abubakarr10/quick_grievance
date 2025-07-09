import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/model/slip_exit_model.dart';
import 'package:quick_grievance/screens/profile/profile_screen/settings/user/UserController.dart';

import '../../conts/routes/screen_names.dart';

class SlipExitController extends GetxController{

  final UserController userAccountController = Get.put(UserController());

  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  RxString formattedDate = DateFormat('dd MMM yyyy hh:mm a').format(DateTime.now()).obs;

  @override
  void onInit() async{
    super.onInit();
    final currentUser = FirebaseAuth.instance.currentUser;
    if (kDebugMode) {
      print(currentUser);
    }
  }

  RxBool isBySelf = false.obs;
  RxBool isDateConfirm = false.obs;

  TextEditingController guardianNameController = TextEditingController();
  TextEditingController relationController = TextEditingController();
  TextEditingController guardianPhoneNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  TextEditingController destinationController = TextEditingController();
  TextEditingController reasonController = TextEditingController();


  // Controllers for input fields
  Rx<BoardDateTimeTextController> fromTextController = BoardDateTimeTextController().obs;
  Rx<BoardDateTimeTextController> toTextController = BoardDateTimeTextController().obs;

  // BoardDateTimeControllers for both fields
  Rx<BoardDateTimeController> fromPickerController = BoardDateTimeController().obs;
  Rx<BoardDateTimeController> toPickerController = BoardDateTimeController().obs;

  // Selected DateTime values
  Rx<String> fromDate = DateFormat('dd MMM yyyy hh:mm a').format(DateTime.now()).obs;
  Rx<String> toDate = (DateFormat('dd MMM yyyy hh:mm a').format(DateTime.now().add(const Duration(days: 10)))).obs;



  // Firebase 🔥
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('request_slip_exit');


  // Submitting Slip Exit
  Future<void> submitSlipExit(SlipExitModel slipExitData) async {
    try {

      isLoading.value = true;

      if(formKey.currentState!.validate()){

        if(isDateConfirm.value == true && fromDate.value != toDate.value){

          await userCollection.doc().set(slipExitData.toJson());

          isLoading.value = false;

          Get.snackbar(
              ' Successfully!', ' Your Exit Slip is submitted to Warden Admin',
              icon: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.done,
                  size: 30,
                  color: accentColor,
                ),
              ),
              colorText: primaryColor,
              backgroundColor: secondaryColor);

          Get.offNamed(entryPointScreen);
        }else{

          isLoading.value = false;
          Get.snackbar(
              ' Missing!', ' Please confirm your dates before submission',
              icon: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.date_range,
                  size: 30,
                  color: secondaryColor,
                ),
              ),
              colorText: Colors.white,
              backgroundColor: Colors.red);

          if (kDebugMode) {
            print('>>>> Please confirm date, same DateTime');
          }

        }

      }else{

        isLoading.value = false;

        Get.snackbar(
            ' Oops!', ' Please fill form.',
            icon: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.error,
                size: 50,
                color: Colors.red,
              ),
            ),
            colorText: primaryColor,
            backgroundColor: secondaryColor
        );
      }

    } catch (e) {
      isLoading.value = false;
      if (kDebugMode) {
        print('Failed to submit slip exit: $e');
      }
    }
  }

}