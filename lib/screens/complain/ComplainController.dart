import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/model/complaint_model.dart';
import 'package:quick_grievance/model/slip_exit_model.dart';
import 'package:quick_grievance/repository/share_preferences/sp_controller.dart';
import 'package:quick_grievance/screens/community/add_post/AddPostController.dart';
import 'package:quick_grievance/screens/complain/ComplainProvider.dart';

import '../../conts/images/image_picker.dart';
import '../../conts/routes/screen_names.dart';
import '../profile/profile_screen/settings/user/UserController.dart';

class ComplainController extends GetxController{

  final UserController userAccountController = Get.put(UserController());
  ComplainProvider complainProvider = ComplainProvider();

  AddPostController postController = AddPostController();

  final formKey = GlobalKey<FormState>();

  RxString formattedDate = DateFormat('dd MMM yyyy hh:mm a').format(DateTime.now()).obs;


  @override
  void onInit() async{
    super.onInit();
    final currentUser = FirebaseAuth.instance.currentUser;

    if (kDebugMode) {
      print(currentUser);
    }
  }

  TextEditingController descriptionController = TextEditingController();

  RxString complaintType = ''.obs;
  RxString priorityLevel = ''.obs;

  List<String> complaintTypes = [
    'Mess',
    'Room Maintenance',
    'Bathroom',
    'Water Supply',
    'Wi-Fi / Internet',
    'Security',
    'Others',
  ];

  List<String> priorityLevels = [
    'None',
    'Low',
    'Medium',
    'High',
    'Emergency',
  ];

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

  void cancelImage(){
    fileX.value = null;
    croppedFile.value = null;
  }

  // Firebase 🔥
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('complaint');


  // Submitting Complaint to Warden (Admin)
  Future<void> submitComplain() async {
    try {

      if(formKey.currentState!.validate() && complaintType.value != ''){


          String imageUrl = await postController.uploadImageToCloud(fileX.value);

          if (kDebugMode) {
            print('Image Url =====> $imageUrl');
          }


         final response = await complainProvider.submitComplain(
            complaintType.value,
            descriptionController.text.trim(),
            priorityLevel.value,
           imageUrl
            ).timeout(const Duration(seconds: 30));

          if (kDebugMode) {
            print('Response from submitComplain ===> $response');
          }

         if (kDebugMode) {
           print('User ha ===> ${currentUser!.uid}');
           print('User Controller ===> ${userAccountController.user.value!.fullName}');
           print('User ka DATA ===> $currentUser');
         }

         ComplaintModel complaintData = ComplaintModel(
             uid: currentUser!.uid,
             fullName: userAccountController.user.value!.fullName,
             regNo: userAccountController.user.value!.regNo,
             phoneNo: userAccountController.user.value!.phoneNo,
             roomNo: userAccountController.user.value!.roomNo,
             complaintType: complaintType.value,
             description: descriptionController.text.trim(),
             priority: priorityLevel.value,
             assistantMessage: response,
             submitDate: formattedDate.value,
             status: 'Pending',
             image: imageUrl == ''? 'none' : imageUrl
         );


          await userCollection.doc().set(complaintData.toJson());

          Get.snackbar(
              ' Successfully!', ' Your complain is forwarded to Warden Admin',
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
        print('Failed to submit complain: $e');
      }
    }
  }

}