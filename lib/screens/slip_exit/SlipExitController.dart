import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/model/slip_exit_model.dart';
import 'package:quick_grievance/screens/profile/profile_screen/settings/user_account/UserAccountController.dart';

import '../../conts/routes/screen_names.dart';

class SlipExitController extends GetxController{

  final UserAccountController userAccountController = Get.put(UserAccountController());

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() async{
    super.onInit();
    final currentUser = FirebaseAuth.instance.currentUser;
    userAccountController.fetchUserData(currentUser);
    if (kDebugMode) {
      print(currentUser);
    }
  }

  RxBool isBySelf = false.obs;

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
  Rx<DateTime> fromDate = DateTime.now().obs;
  Rx<DateTime> toDate = (DateTime.now().add(const Duration(days: 10))).obs;



  // Firebase 🔥
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('request_slip_exit');



  // Submitting Slip Exit
  Future<void> submitSlipExit(SlipExitModel slipExitData) async {
    try {

      if(formKey.currentState!.validate()){

        await userCollection.doc().set(slipExitData.toJson());

        Get.snackbar(
            ' Successfully!', ' Your Exit Slip is submitted to Warden Admin',
            icon: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.done,
                size: 50,
                color: accentColor,
              ),
            ),
            colorText: primaryColor,
            backgroundColor: secondaryColor
        );

        Get.offNamed(entryPointScreen);


      }else{
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
      if (kDebugMode) {
        print('Failed to submit slip exit: $e');
      }
    }
  }

}