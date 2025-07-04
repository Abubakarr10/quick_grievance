import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_grievance/screens/complain/ComplainController.dart';
import 'package:quick_grievance/screens/complain/widgets/widgets.dart';
import 'package:quick_grievance/screens/profile/profile_screen/ProfileController.dart';

import '../../../conts/app_height_width.dart';
import '../../../conts/images/app_images.dart';

import '../../conts/app_colors.dart';
import '../../conts/routes/screen_names.dart';
import '../../conts/validator/validator.dart';
import '../../model/slip_exit_model.dart';
import '../app_widgets/widgets.dart';
import '../auth/hostelite/signup/widgets/drop_down_button_ff_widget.dart';
import '../slip_exit/widgets/widgets.dart';

class ComplainScreen extends GetView<ComplainController> {
  const ComplainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ComplainController());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.offNamed(entryPointScreen);
        },
        backgroundColor: accentColor,
        mini: true,
        child: const Icon(Icons.arrow_back_ios_new,color: secondaryColor,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Stack(
              children: [

                Image.asset(appBarVector),

                // Screen Title => Slip Exit
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: widthX*.04),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: heightX*.06, bottom: heightX*.02),
                          child: AppTextWidget(
                              title: 'Complaint',
                              fontSize: heightX*.03,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),

                      Column(
                        children: [

                          Form(
                            key: controller.formKey,
                            child: Column(
                              children: [
                                Card(
                                  elevation: 15,
                                  color: secondaryColor,
                                  shadowColor: secondaryColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        AppTextWidget(title: 'Complaint Type',
                                          fontSize: heightX*.02,
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),

                                        SizedBox(height: heightX*.005,),

                                        DropdownButtonFFWidget(
                                          isFillColor: true,
                                          valueName: 'Complaint-Type',
                                          onChanged: (value){
                                            controller.complaintType.value = value;
                                          },
                                          listName: controller.complaintTypes,
                                          icon: Icons.insert_comment_outlined,
                                        ),


                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(height: heightX*.03,),

                                // Description
                                Card(
                                  elevation: 15,
                                  color: Colors.white,
                                  shadowColor: secondaryColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        AppTextWidget(title: 'Description',
                                          fontSize: heightX*.018,
                                          color: secondaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),

                                        SizedBox(height: heightX*.005,),

                                        // Text Paragraph=>
                                        TextFormField(
                                          maxLines: 3,
                                          controller: controller.descriptionController,
                                          validator: (value){
                                              return emptyValidator(value,
                                                  'Kindly explain your complain!');

                                          },
                                          keyboardType: TextInputType.multiline, // Enables multi-line input from keyboard
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20),
                                                borderSide: const BorderSide(color: secondaryColor,
                                                  width: 2
                                                )
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20),
                                                borderSide: const BorderSide(color: secondaryColor,
                                                width: 2
                                                )
                                            ),
                                            labelText: 'Describe your problem',
                                            labelStyle: GoogleFonts.poppins(
                                              fontSize: heightX*.014,
                                              fontWeight: FontWeight.w500,
                                              color: primaryColor,
                                            ),
                                            alignLabelWithHint: false,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: heightX*.03,),

                          // Priority
                          Card(
                            elevation: 15,
                            color: secondaryColor,
                            shadowColor: secondaryColor,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  AppTextWidget(title: 'Priority (Optional)',
                                    fontSize: heightX*.02,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),

                                  SizedBox(height: heightX*.005,),

                                  DropdownButtonFFWidget(
                                    isFillColor: true,
                                    valueName: 'Priority Level',
                                    onChanged: (value){
                                      controller.priorityLevel.value = value;
                                    },
                                    listName: controller.priorityLevels,
                                    icon: Icons.flag_circle,
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: heightX*.03,),

                      //Upload Image
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          // Text=> Upload Image
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: AppTextWidget(title: 'Upload Image (Optional)',
                                fontSize: heightX*.02,
                                color: secondaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          SizedBox(height: heightX*.03,),

                          Obx((){
                            if(controller.fileX.value != null){
                              // Image: Selected Image
                              return Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    DisplayImageWidget(
                                      radius: .4,
                                      pickedImage: controller.croppedFile.value == null?
                                      controller.fileX.value!.path.toString()
                                          : controller.croppedFile.value!.path.toString(),
                                    ),

                                    SizedBox(height: heightX*.03,),

                                    IconTextButtonWidget(
                                      onTap: (){
                                        controller.cancelImage();
                                      },
                                      text: 'Cancel Image',
                                      icon: Icons.cancel_outlined,
                                    ),
                                  ],
                                ),
                              );
                            }
                            else{
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleButtonWidget(
                                    onTap: () {
                                      controller.cameraCapture();
                                    },
                                    title: 'Click Fresh Photo',
                                    icon: Icons.camera_alt_outlined,
                                  ),

                                  SizedBox(height: heightX*.04,),

                                  CircleButtonWidget(
                                    onTap: () {
                                      controller.galleryImage();
                                    },
                                    title: 'Pick From Gallery',
                                    icon: Icons.image_outlined,
                                  ),
                                ],
                              );
                            }
                          }),

                          SizedBox(height: heightX*.03,),

                        ],
                      ),

                      ActionButtonWidget(label: 'Submit',
                          onTap: (){
                             controller.submitComplain();
                          }),


                      SizedBox(height: heightX*.03,),

                    ],
                  ),
                ),

              ],
            ),

            const SizedBox(height: 30,),

          ],
        ),
      ),
    );
  }
}


