import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/app_height_width.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/screens/admin/mess/AddMessController.dart';
import 'package:quick_grievance/screens/app_widgets/app_text_widget.dart';

import '../../../conts/validator/validator.dart';
import '../../app_widgets/widgets.dart';
import '../../complain/widgets/circle_button_widget.dart';

class AddMessScreen extends GetView<AddMessController> {
  const AddMessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddMessController());
    return Scaffold(
      appBar: AppBar(
         leading: InkWell(
             onTap: (){
               Get.offNamed(adminScreen);
             },
             child: const Icon(Icons.arrow_back_ios_new,color: pureWhite,)),
        title: AppTextWidget(title: 'Add New Mess',color: pureWhite,
        fontWeight: FontWeight.bold, fontSize: heightX*.02,
        ),
        backgroundColor: secondaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              Form(
                key: controller.formKey,
                child: Column(
                  spacing: heightX*.01,
                  children: [

                    // Option A
                    Card(
                      elevation: 15,
                      color: Colors.white,
                      shadowColor: secondaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            AppTextWidget(title: 'Option-A',
                              fontSize: heightX*.018,
                              color: secondaryColor,
                              fontWeight: FontWeight.bold,
                            ),

                            SizedBox(height: heightX*.005,),

                            // Text Option A Title=>
                            Row(
                              children: [
                                Flexible(
                                  flex: 6,
                                  child: AppTextFormFieldWidget(
                                      ctrl: controller.aOptionController,
                                      keyType: TextInputType.name,
                                    mainColor: secondaryColor,
                                    labelText: 'Enter name of Dish-A',
                                    textColor: secondaryColor,
                                    returnMessage: 'Enter Dish Name as Option A',
                                  ),
                                ),

                                const SizedBox(width: 10,),

                                // Text Option A Price=>
                                Flexible(
                                  flex: 3,
                                  child: AppTextFormFieldWidget(
                                    ctrl: controller.aPriceController,
                                    keyType: TextInputType.number,
                                    mainColor: secondaryColor,
                                    labelText: 'Price Dish-A',
                                    textColor: secondaryColor,
                                    returnMessage: 'Price',
                                  ),
                                ),
                              ],
                            ),


                            SizedBox(height: heightX*.005,),

                            AppTextFormFieldWidget(
                              ctrl: controller.aDescriController,
                              keyType: TextInputType.name,
                              mainColor: secondaryColor,
                              labelText: 'Description for Option-A',
                              textColor: secondaryColor,
                              returnMessage: '',
                            ),

                          ],
                        ),
                      ),
                    ),

                    // Option B
                    Card(
                      elevation: 15,
                      color: Colors.white,
                      shadowColor: secondaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            AppTextWidget(title: 'Option-B',
                              fontSize: heightX*.018,
                              color: secondaryColor,
                              fontWeight: FontWeight.bold,
                            ),

                            SizedBox(height: heightX*.005,),

                            // Text Option A Title=>
                            Row(
                              children: [
                                Flexible(
                                  flex: 6,
                                  child: AppTextFormFieldWidget(
                                    ctrl: controller.bOptionController,
                                    keyType: TextInputType.name,
                                    mainColor: secondaryColor,
                                    labelText: 'Enter name of dish',
                                    textColor: secondaryColor,
                                    returnMessage: 'Dish Name as Option B',
                                  ),
                                ),

                                const SizedBox(width: 5,),

                                // Text Option A Price=>
                                Flexible(
                                  flex: 3,
                                  child: AppTextFormFieldWidget(
                                    ctrl: controller.bPriceController,
                                    keyType: TextInputType.number,
                                    mainColor: secondaryColor,
                                    labelText: 'Price Dish-B',
                                    textColor: secondaryColor,
                                    returnMessage: 'Price',
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: heightX*.005,),

                            AppTextFormFieldWidget(
                              ctrl: controller.bDescriController,
                              keyType: TextInputType.name,
                              mainColor: secondaryColor,
                              labelText: 'Description for Option-B',
                              textColor: secondaryColor,
                              returnMessage: '',
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
                          child: AppTextWidget(title: 'Image For A (Optional)',
                            fontSize: heightX*.02,
                            color: secondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      SizedBox(height: heightX*.03,),


                      Obx((){
                        if(controller.fileXa.value != null){
                          // Image: Selected Image
                          return Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                DisplayImageWidget(
                                  radius: .4,
                                  pickedImage: controller.croppedFile.value == null?
                                  controller.fileXa.value!.path.toString()
                                      : controller.croppedFile.value!.path.toString(),
                                ),

                                SizedBox(height: heightX*.03,),

                                IconTextButtonWidget(
                                  onTap: (){
                                    controller.cancelImage(controller.fileXa.value);
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
                                onTap: () async{
                                  controller.fileXa.value = await controller.cameraCapture(controller.fileXa.value);
                                },
                                title: 'Click Fresh Photo',
                                icon: Icons.camera_alt_outlined,
                              ),

                              SizedBox(height: heightX*.04,),

                              CircleButtonWidget(
                                onTap: () async{
                                  controller.fileXa.value = await controller.galleryImage(controller.fileXa.value);
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
              SizedBox(height: heightX*.01,),
              // Image B
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
                          child: AppTextWidget(title: 'Image For B (Optional)',
                            fontSize: heightX*.02,
                            color: secondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      SizedBox(height: heightX*.03,),


                      Obx((){
                        if(controller.fileXb.value != null){
                          // Image: Selected Image
                          return Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                DisplayImageWidget(
                                  radius: .4,
                                  pickedImage: controller.fileXb.value!.path.toString()
                                ),

                                SizedBox(height: heightX*.03,),

                                IconTextButtonWidget(
                                  onTap: (){
                                    controller.cancelImage(controller.fileXb.value);
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
                                onTap: () async{
                                  controller.fileXb.value = await controller.cameraCapture(controller.fileXb.value);
                                },
                                title: 'Click Fresh Photo',
                                icon: Icons.camera_alt_outlined,
                              ),

                              SizedBox(height: heightX*.04,),

                              CircleButtonWidget(
                                onTap: () async{
                                  controller.fileXb.value = await controller.galleryImage(controller.fileXb.value);
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

              const SizedBox(height: 30,),


            ],
          ),
        ),
      ),
    );
  }
}
