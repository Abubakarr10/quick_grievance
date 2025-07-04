import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/model/mess_model.dart';

import '../../../conts/app_colors.dart';

class VoteController extends GetxController{

  RxBool isVoteA = false.obs;
  RxBool isVoteB = false.obs;

 MessModel messModelData = const MessModel();

  RxString messId = 'messToday'.obs;


  void castingVoteA(){
    isVoteA.value = !isVoteA.value;
  }
  void castingVoteB(){
    isVoteB.value = !isVoteB.value;
  }

  Future<void> castVote({
    required String messId,
    required bool voteForA,
    required bool voteForB,
  }) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    final messRef = FirebaseFirestore.instance.collection('mess').doc(messId);

    final messSnap = await messRef.get();
    if (!messSnap.exists) return;

    final messData = messSnap.data();

    // Prevent double voting
    final List<dynamic> existingVoteA = messData?['vote_a'] ?? [];
    final List<dynamic> existingVoteB = messData?['vote_b'] ?? [];

    if (existingVoteA.contains(uid) && existingVoteB.contains(uid)) {
      // You can allow both votes or restrict one vote only
      if (kDebugMode) {
        print('You already voted.');
      }
      Get.offNamed(messScreen);
      Get.snackbar(
          ' OH!', ' You already voted.',
          icon: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.error,
              size: 30,
              color: Colors.red,
            ),
          ),
          colorText: primaryColor,
          backgroundColor: secondaryColor);
      return;
    }

    Map<String, dynamic> updates = {};

    if (voteForA && !existingVoteA.contains(uid)) {
      updates['vote_a'] = FieldValue.arrayUnion([uid]);
    }

    if (voteForB && !existingVoteB.contains(uid)) {
      updates['vote_b'] = FieldValue.arrayUnion([uid]);
    }

    Get.offNamed(messScreen);

    await messRef.update(updates);

    if (kDebugMode) {
      print('Vote casted successfully');
    }
    Get.snackbar(
        ' YAHOOOO!', ' Vote casted successfully',
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
  }



}