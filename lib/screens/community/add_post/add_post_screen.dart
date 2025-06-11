import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/conts/validator/validator.dart';
import 'package:quick_grievance/screens/community/add_post/AddPostController.dart';
import 'package:quick_grievance/screens/complain/ComplainController.dart';

import '../../../conts/app_colors.dart';
import '../../../conts/app_height_width.dart';
import '../../../conts/images/app_images.dart';
import '../../app_widgets/widgets.dart';
import '../../complain/widgets/widgets.dart';
import '../../slip_exit/widgets/widgets.dart';


class AddPostScreen extends GetView<AddPostController> {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddPostController());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.offNamed(communityScreen);
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
                              title: 'Add New Post',
                              fontSize: heightX*.03,
                              textColor: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),

                      Form(
                        key: controller.formKey,
                        child: Column(
                          children: [

                            
                            // Captions
                            Card(
                              elevation: 15,
                              color: Colors.white,
                              shadowColor: secondaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    AppTextWidget(title: 'Captions',
                                      fontSize: heightX*.018,
                                      textColor: secondaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),

                                    SizedBox(height: heightX*.005,),

                                    // Text Paragraph=>
                                    TextFormField(
                                      maxLines: 3,
                                      validator: (value){
                                        return emptyValidator(value,
                                            'Please write captions or status');
                                      },
                                      controller: controller.captionController,
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
                                        labelText: 'Write our captions for post or share your feedback',
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

                      //Upload Image
                      Card(
                        elevation: 15,
                        color: Colors.white,
                        shadowColor: secondaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              // Text=> Upload Image
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: AppTextWidget(title: 'Upload Image (Optional)',
                                    fontSize: heightX*.02,
                                    textColor: secondaryColor,
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
                            ],
                          ),
                        ),
                      ),


                      SizedBox(height: heightX*.05,),

                      ActionButtonWidget(label: 'Post',
                          onTap: (){
                            controller.createPost();
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


