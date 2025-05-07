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

  Future<UserModel?> getUserData(String uid) async {
    try {
      final userDataDoc = await userCollection.doc(uid).get();
      if (userDataDoc.exists) {
        UserModel userModel = UserModel.fromJson(userDataDoc.data() as Map<String, dynamic>);
        return userModel;
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching user data: $error');
      }
    }
    return null; // Return an empty map if data is not found or an error occurs.
  }

  // Future<void> fetchUserData() async {
  //   // Get the current user
  //   final user = FirebaseAuth.instance.currentUser;
  //
  //   if (user != null) {
  //     // Reference to the user's document in Firestore
  //     final userDoc = FirebaseFirestore.instance.collection('users').doc(user.uid);
  //
  //     // Fetch data from Firestore and update text controllers
  //     final userData = await userDoc.get();
  //     final data = userData.data(); // Retrieve all fields and values as a Map
  //
  //     if (data != null) {
  //
  //       fullNameController.value.text = data['fullName'] ?? '';
  //       emailController.value.text = data['email'] ?? '';
  //       passwordController.value.text = data['password'] ?? '';
  //       phoneNumberController.value.text = data['phoneNumber'] ?? '';
  //
  //       addressController.value.text = data['address'] ?? '';
  //       cityController.value.text = data['city'] ?? '';
  //       provinceController.value.text = data['province'] ?? '';
  //       postelCodeController.value.text = data['postelCode'] ?? '';
  //     }
  //   }
  // }
}