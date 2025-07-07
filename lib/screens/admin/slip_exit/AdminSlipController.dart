
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/model/slip_exit_model.dart';
import 'dart:math';

class AdminSlipController extends GetxController {

// Generate Token
  String generateRandomToken({int length = 6}) {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random();
    return List.generate(length, (index) => chars[rand.nextInt(chars.length)]).join();
  }


  // Accept and Reject Slip Request
  Future<void> acceptRequestAndDelete(String docId, SlipExitModel slipData,bool reject) async {

    if(reject == false){
      final String token = generateRandomToken();

      SlipExitModel approveSlipData = SlipExitModel(
          uid: slipData.uid,
          fullName: slipData.fullName,
          regNo: slipData.regNo,
          phoneNo: slipData.phoneNo,
          roomNo: slipData.roomNo,
          departmentName: slipData.departmentName,
          token: token,
          batch: slipData.batch,
          guardianName: slipData.guardianName,
          relation: slipData.relation,
          guardianPhoneNo: slipData.guardianPhoneNo,
          address: slipData.address,
          destination: slipData.destination,
          reason: slipData.reason,
          fromDate: slipData.fromDate,
          toDate: slipData.toDate);

      saveSlipExit(approveSlipData);
    }else{

      SlipExitModel rejectSlipData = SlipExitModel(
          uid: slipData.uid,
          fullName: slipData.fullName,
          regNo: slipData.regNo,
          phoneNo: slipData.phoneNo,
          roomNo: slipData.roomNo,
          departmentName: slipData.departmentName,
          token: 'Rejected',
          batch: slipData.batch,
          guardianName: slipData.guardianName,
          relation: slipData.relation,
          guardianPhoneNo: slipData.guardianPhoneNo,
          address: slipData.address,
          destination: slipData.destination,
          reason: slipData.reason,
          fromDate: slipData.fromDate,
          toDate: slipData.toDate);

      saveRejectedSlipExit(rejectSlipData);
    }


    try {
      await FirebaseFirestore.instance
          .collection('request_slip_exit')
          .doc(docId)
          .delete();

      if(reject==false){
        Get.snackbar(
          "Request Accepted",
          "The request has been approved and removed from the list.",
          backgroundColor: primaryColor,
          colorText: secondaryColor,
          snackPosition: SnackPosition.BOTTOM,
        );
      }else{
        Get.snackbar(
          "Request Rejected",
          "The request has been rejected and removed from the list.",
          backgroundColor: primaryColor,
          colorText: secondaryColor,
          snackPosition: SnackPosition.BOTTOM,
        );
      }


    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to delete the request: $e",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Firebase 🔥
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('approve_slip_exit');
  final CollectionReference userCollection2 = FirebaseFirestore.instance.collection('reject_slip_exit');


  // Save Slip Data in Approve Collection
  Future<void> saveSlipExit(SlipExitModel slipExitData) async {
    try {

          await userCollection.doc().set(slipExitData.toJson());

    } catch (e) {
      if (kDebugMode) {
        print('Failed to submit slip exit: $e');
      }
    }
  }

  // Save Slip Data in Reject Collection
  Future<void> saveRejectedSlipExit(SlipExitModel slipExitData) async {
    try {

      await userCollection2.doc().set(slipExitData.toJson());

    } catch (e) {
      if (kDebugMode) {
        print('Failed to submit slip exit: $e');
      }
    }
  }

}