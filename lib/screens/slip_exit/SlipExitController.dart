import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/model/slip_exit_model.dart';

import '../../conts/routes/screen_names.dart';

class SlipExitController extends GetxController{

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
  Rx<DateTime> toDate = DateTime.now().obs;


  // Firebase 🔥
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('request_slip_exit');



  // Submitting Slip Exit
  Future<void> submitSlipExit(SlipExitModel slipExitData) async {
    try {
      await userCollection.doc().set(slipExitData.toJson());

      Get.offNamed(entryPointScreen);

    } catch (e) {
      if (kDebugMode) {
        print('Failed to submit slip exit: $e');
      }
    }
  }

}