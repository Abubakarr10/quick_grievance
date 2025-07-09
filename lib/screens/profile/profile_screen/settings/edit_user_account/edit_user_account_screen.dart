import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/repository/share_preferences/sp_controller.dart';
import 'package:quick_grievance/screens/profile/profile_screen/settings/edit_user_account/EditUserController.dart';

import '../../../../../conts/app_colors.dart';
import '../../../../../conts/app_height_width.dart';
import '../../../../../conts/images/app_images.dart';
import '../../../../../conts/routes/screen_names.dart';
import '../../../../../conts/validator/validator.dart';
import '../../../../app_widgets/widgets.dart';

class EditUserAccountScreen extends GetView<EditUserController> {
  const EditUserAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditUserController());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.offNamed(entryPointScreen,arguments: {
            'index': 4,
          });
        },
        backgroundColor: accentColor,
        mini: true,
        child: const Icon(Icons.arrow_back_ios_new,color: secondaryColor,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// Text => Slip Exit
            Stack(
              children: [

                Image.asset(appBarVector),

                // Screen Title => Slip Exit
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: heightX*.06, bottom: heightX*.02),
                    child: AppTextWidget(
                        title: 'Edit User Account',
                        fontSize: heightX*.03,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),

            Obx(()=> controller.isLoading.value == true?
            const SpinKitWidget()
            :
            Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      spacing: heightX*.01,
                      children: [

                        // Full Name
                        Column(
                          children: [
                            AppTextWidget(title: 'Full Name',color: primaryColor,fontWeight: FontWeight.bold,
                            fontSize: heightX*.02,
                            ),
                            AppTextFormFieldWidget(
                                ctrl: controller.fullNameController,
                                mainColor: secondaryColor,
                                labelText: 'Full Name',
                                customValidator: true,
                                validator: (value){
                                  return nameValidator(value);
                                },
                                keyType: TextInputType.name),
                          ],
                        ),

                        // Room number
                        Column(
                          children: [
                            AppTextWidget(title: 'Room.No',color: primaryColor,fontWeight: FontWeight.bold,
                              fontSize: heightX*.02,
                            ),
                            AppTextFormFieldWidget(
                                ctrl: controller.roomNoController,
                                mainColor: secondaryColor,
                                labelText: 'Room.No',
                                customValidator: true,
                                validator: (value){
                                  return roomNumberValidator(value);
                                },
                                keyType: TextInputType.number),
                          ],
                        ),

                        // Phone Number
                        Column(
                          children: [
                            AppTextWidget(title: 'Phone Number',color: primaryColor,fontWeight: FontWeight.bold,
                              fontSize: heightX*.02,
                            ),
                            AppTextFormFieldWidget(
                                ctrl: controller.phoneNoController,
                                mainColor: secondaryColor,
                                labelText: 'Phone Number',
                                customValidator: true,
                                validator: (value){
                                  if(value == null){
                                    return emptyValidator(value,
                                        'Enter Phone.no');
                                  }
                                  else{
                                    return phoneNumberValidator(value);
                                  }
                                },
                                keyType: TextInputType.number),
                          ],
                        ),

                        // Degree
                        Column(
                          children: [
                            AppTextWidget(title: 'Degree',color: primaryColor,fontWeight: FontWeight.bold,
                              fontSize: heightX*.02,
                            ),
                            AppTextFormFieldWidget(
                                ctrl: controller.degreeController,
                                mainColor: secondaryColor,
                                labelText: 'Degree',
                                returnMessage: 'Enter your degree program.',
                                keyType: TextInputType.text),
                          ],
                        ),

                        // Batch
                        Column(
                          children: [
                            AppTextWidget(title: 'Batch Year',color: primaryColor,fontWeight: FontWeight.bold,
                              fontSize: heightX*.02,
                            ),
                            AppTextFormFieldWidget(
                                ctrl: controller.batchController,
                                mainColor: secondaryColor,
                                labelText: 'Batch Year',
                                customValidator: true,
                                validator: (value){
                                  if(value == null){
                                    return emptyValidator(value,
                                        'Enter Batch Year (i.e 2021-25');
                                  }else{
                                    return batchYearValidator(value);
                                  }
                                },
                                keyType: TextInputType.text),
                          ],
                        ),


                        SizedBox(height: heightX*.03,),

                        Obx(()=>
                            ActionButtonWidget(label: 'Update',
                            isLoading: controller.isLoading.value,
                            onTap: () =>  controller.updateUser(currentUserId)),
                        )
                      ],
                    ),
                  ),
                )

              ],
            )
            ),
          ],
        ),
      ),
    );
  }
}
