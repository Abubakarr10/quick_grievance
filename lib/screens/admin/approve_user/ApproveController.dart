import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ApproveUserController extends GetxController {

  void approveUser(String docId) async {
    await FirebaseFirestore.instance.collection('users').doc(docId).update({
      'isAuthorized': 'true',
    });
  }

  void rejectUser(String docId) async {
    await FirebaseFirestore.instance.collection('users').doc(docId).update({
      'isAuthorized': 'Rejected user',
    });
  }


}