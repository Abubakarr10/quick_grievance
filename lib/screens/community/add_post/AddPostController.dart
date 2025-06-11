

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:quick_grievance/model/post_model.dart';
import 'package:quick_grievance/screens/community/add_post/AddPostProvider.dart';

import '../../../conts/app_colors.dart';
import '../../../conts/images/image_picker.dart';
import '../../../conts/routes/screen_names.dart';
import '../../../repository/share_preferences/sp_controller.dart';
import '../../profile/profile_screen/settings/user_account/UserAccountController.dart';

class AddPostController extends GetxController{


  final UserAccountController userAccountController = Get.put(UserAccountController());
  AddPostProvider addPostProvider = AddPostProvider();

  final formKey = GlobalKey<FormState>();


  RxString formattedDate = DateFormat('dd MMM yyyy hh:mm a').format(DateTime.now()).obs;

  TextEditingController captionController = TextEditingController();


  // Image Picker Variables 🌄
  final fileX = Rx<XFile?>(null);
  final croppedFile = Rx<CroppedFile?>(null);
  RxString pickImage = ''.obs;
  ImagePickerUtils imagePickerUtils = ImagePickerUtils();

  // Image Picker Functions ⚙️
  void cameraCapture() async {
    XFile? file = await imagePickerUtils.cameraCapture();
    fileX.value = file!;
  }

  void galleryImage() async {
    XFile? file = await imagePickerUtils.pickImageGallery();
    fileX.value = file!;
  }

  Future<void> cropImage() async {

    if (fileX.value != null) {
      croppedFile.value = await ImageCropper().cropImage(
        sourcePath: fileX.value!.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: primaryColor,
            toolbarWidgetColor: primaryColor,
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
            ],
          ),
          IOSUiSettings(
            title: 'Cropper',
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
            ],
          ),
        ],
      ) ?? CroppedFile(pickImage.value);

      if (croppedFile.value!.path == '') {
        // Do something with the cropped image
        if (kDebugMode) {
          print('Cropped file path: ${croppedFile.value!.path}');
        }
      }
    }
  }

  void cancelImage(){
    fileX.value = null;
    croppedFile.value = null;
  }

  // Firebase 🔥
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('post');


  Future<String> uploadImageToCloud(XFile xFile) async {
    try {

      // Assuming `xFile` is your XFile instance
      final File imageFile = File(xFile.path);
      final String imageUrl = await addPostProvider.uploadImage(imageFile);

      return imageUrl;
    } catch (e) {
      if (kDebugMode) {
        print("Error uploading image: $e");
      }
      return 'null';
    }
  }

  // posting to firebase 🔥
  Future<void> createPost() async {
    try {

      if(formKey.currentState!.validate()){

        String imageUrl = await uploadImageToCloud(fileX.value!);

        if (kDebugMode) {
          print('User ha ===> ${currentUser!.uid}');
          print('User Controller ===> ${userAccountController.user.value!.fullName}');
          print('User ka DATA ===> $currentUser');
        }

        PostModel postData = PostModel(
            uid: userAccountController.user.value!.uid,
            fullName: userAccountController.user.value!.fullName,
            regNo: userAccountController.user.value!.regNo,
            departmentName: userAccountController.user.value!.departmentName,
            captions: captionController.text.trim(),
            postDate: formattedDate.value,
            postImage: imageUrl
        );


        await userCollection.doc().set(postData.toJson());

        Get.snackbar(
            ' Successfully!', ' Your post is successfully posted',
            icon: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.done,
                size: 50,
                color: accentColor,
              ),
            ),
            colorText: primaryColor,
            backgroundColor: secondaryColor);

        Get.offNamed(entryPointScreen);

      }else{
        Get.snackbar(
            ' Oops!', ' Please fill form.',
            icon: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.error,
                size: 25,
                color: Colors.red,
              ),
            ),
            colorText: primaryColor,
            backgroundColor: secondaryColor
        );
      }

    } catch (e) {
      if (kDebugMode) {
        print('Failed to post: $e');
      }
    }
  }

}