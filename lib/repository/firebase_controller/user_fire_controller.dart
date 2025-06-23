import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../model/user_model.dart';

class UserFireController{

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  // Creating a new user
  Future<void> createUser(UserModel user) async {
    try {
      await userCollection.doc(user.uid).set(user.toJson());
    } catch (e) {
      if (kDebugMode) {
        print('Failed to create user: $e');
      }
    }
  }

}