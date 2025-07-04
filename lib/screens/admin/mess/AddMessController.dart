import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/model/mess_model.dart';

import '../../../conts/app_colors.dart';
import '../../../conts/images/image_picker.dart';
import '../../community/add_post/AddPostProvider.dart';

class AddMessController extends GetxController{



  AddPostProvider addPostProvider = AddPostProvider();

  final formKey = GlobalKey<FormState>();


  RxString formattedDate = DateFormat('dd MMM yyyy hh:mm a').format(DateTime.now()).obs;

  TextEditingController aOptionController = TextEditingController();
  TextEditingController bOptionController = TextEditingController();
  TextEditingController aPriceController = TextEditingController();
  TextEditingController bPriceController = TextEditingController();
  TextEditingController aDescriController = TextEditingController(text: 'Description');
  TextEditingController bDescriController = TextEditingController(text: 'Description');




  // Image Picker Variables 🌄
  final fileXa = Rx<XFile?>(null);
  final fileXb = Rx<XFile?>(null);
  final croppedFile = Rx<CroppedFile?>(null);
  RxString pickImage = ''.obs;
  ImagePickerUtils imagePickerUtils = ImagePickerUtils();

  // Image Picker Functions ⚙️
  Future<XFile> cameraCapture(fileX) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    return fileX = file!;
  }

  Future<XFile> galleryImage(fileX) async {
    XFile? file = await imagePickerUtils.pickImageGallery();
    return fileX = file!;
  }

  // Future<void> cropImage() async {
  //
  //   if (fileX.value != null) {
  //     croppedFile.value = await ImageCropper().cropImage(
  //       sourcePath: fileX.value!.path,
  //       uiSettings: [
  //         AndroidUiSettings(
  //           toolbarTitle: 'Cropper',
  //           toolbarColor: primaryColor,
  //           toolbarWidgetColor: primaryColor,
  //           aspectRatioPresets: [
  //             CropAspectRatioPreset.original,
  //             CropAspectRatioPreset.square,
  //           ],
  //         ),
  //         IOSUiSettings(
  //           title: 'Cropper',
  //           aspectRatioPresets: [
  //             CropAspectRatioPreset.original,
  //             CropAspectRatioPreset.square,
  //           ],
  //         ),
  //       ],
  //     ) ?? CroppedFile(pickImage.value);
  //
  //     if (croppedFile.value!.path == '') {
  //       // Do something with the cropped image
  //       if (kDebugMode) {
  //         print('Cropped file path: ${croppedFile.value!.path}');
  //       }
  //     }
  //   }
  // }

  void cancelImage(fileX){
    fileX = null;
    croppedFile.value = null;
  }

  // Firebase 🔥
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('mess');


  Future<String> uploadImageToCloud(XFile? xFile) async {
    try {

      if(xFile == null){
        return '';
      }else{
        // Assuming `xFile` is your XFile instance
        final File imageFile = File(xFile.path);
        final String imageUrl = await addPostProvider.uploadImage(imageFile);

        return imageUrl;
      }

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


        String imageUrlA = await uploadImageToCloud(fileXa.value);
        String imageUrlB = await uploadImageToCloud(fileXb.value);


        // Prepare mess data
        MessModel messData = MessModel(
          docId: 'messToday', // or any fixed ID
          optionA: aOptionController.text.trim(),
          optionB: bOptionController.text.trim(),
          optionPriceA: aPriceController.text.trim(),
          optionPriceB: bPriceController.text.trim(),
          messDate: formattedDate.value,
          optionImageA: imageUrlA,
          optionImageB: imageUrlB,
          descriptionA: aDescriController.text.trim() == 'Description' ? 'none' : aDescriController.text.trim(),
          descriptionB: bDescriController.text.trim() == 'Description' ? 'none' : bDescriController.text.trim(),
          voteA: [],
          voteB: [],
        );

        // Save or update the document with fixed ID
        await FirebaseFirestore.instance
            .collection('mess')
            .doc('messToday') // fixed doc id
            .set(messData.toJson());

        Get.snackbar(
            ' Successfully!', ' Mess is Updated',
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

        Get.offNamed(adminScreen);

      }else{
        Get.snackbar(
            ' Oops!', ' Please fill required fields.',
            icon: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.error,
                size: 35,
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