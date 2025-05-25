import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/screens/complain/ComplainController.dart';
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

            /// Text => Slip Exit
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
                              textColor: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),

                      Form(
                        key: controller.formKey,
                        child: Column(
                          children: [

                            // Emergency
                            // Card(
                            //   elevation: 15,
                            //   shadowColor: secondaryColor,
                            //   color: Colors.red,
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(10),
                            //     child: Column(
                            //       children: [
                            //
                            //         AppTextWidget(title: 'Emergency',
                            //           fontSize: heightX*.022,
                            //           textColor: pureBlack,
                            //           fontWeight: FontWeight.bold,
                            //         ),
                            //
                            //         // CheckBox => By Self
                            //         Obx(()=>
                            //             CheckboxListTile(
                            //               checkboxScaleFactor: 1.5,
                            //               contentPadding: const EdgeInsets.all(0),
                            //               checkColor: secondaryColor,
                            //               activeColor: accentColor,
                            //               value: controller.isBySelf.value,
                            //               onChanged: (value){
                            //                 controller.isBySelf.value = value ?? false;
                            //               },
                            //               title:  AppTextWidget(title: 'Emergency Case',fontWeight: FontWeight.bold,
                            //                 fontSize: heightX*.018, textColor: secondaryColor,
                            //               ),
                            //             )),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            //
                            // SizedBox(height: heightX*.02,),

                            // Guardian Information Box

                            // Guardian Information Box

                            Card(
                              elevation: 15,
                              color: Colors.white,
                              shadowColor: secondaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    AppTextWidget(title: 'Complaint Type',
                                      fontSize: heightX*.02,
                                      textColor: primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),

                                    SizedBox(height: heightX*.005,),

                                    DropdownButtonFFWidget(
                                      isFillColor: true,
                                      valueName: 'Complaint-Type',
                                      hintText: 'Complaint-Type',
                                      onChanged: (value){
                                        controller.complaintType.value = value;
                                      },
                                      listName: controller.complaintTypes,
                                      icon: Icons.insert_comment_outlined,
                                    ),

                                    // TitleTextFieldWidget(title: 'Name of Person Receiving:',
                                    //   fieldText: 'Name of person',
                                    //   textEditingController: controller.guardianNameController,
                                    //   validator: (value){
                                    //     if(controller.isBySelf.value == true){
                                    //       return null;
                                    //     }else{
                                    //       return emptyValidator(value,'Please mention person name');
                                    //     }
                                    //   },),
                                    //
                                    // SizedBox(height: heightX*.01,),
                                    //
                                    // TitleTextFieldWidget(
                                    //   title: 'Relation with Student:',
                                    //   fieldText: 'Relation',
                                    //   textEditingController: controller.relationController,
                                    //   validator: (value){
                                    //     if(controller.isBySelf.value == true){
                                    //       return null;
                                    //     }else {
                                    //       return emptyValidator(value,
                                    //           'Mention your relation with Him/Her');
                                    //     }
                                    //   },),
                                    //
                                    // SizedBox(height: heightX*.01,),
                                    //
                                    // TitleTextFieldWidget(
                                    //     title: 'Guardian Contact.No:',
                                    //     fieldText: '+92123456789',
                                    //     maxLength: 13,
                                    //     textEditingController: controller.guardianPhoneNoController,
                                    //     keyType: TextInputType.number,
                                    //     validator: (value){
                                    //       if(controller.isBySelf.value == true){
                                    //         return null;
                                    //       }else {
                                    //         if (value!.isEmpty) {
                                    //           return 'Mention Phone number';
                                    //         }
                                    //         return phoneNumberValidator(value);
                                    //       }
                                    //     }),
                                    //
                                    // SizedBox(height: heightX*.01,),
                                    //
                                    // AppTextWidget(title: 'Address:',
                                    //   fontSize: heightX*.014, fontWeight: FontWeight.w500,
                                    // ),
                                    //
                                    // SizedBox(height: heightX*.005,),
                                    //
                                    // // Text => Address Box
                                    // TextFormField(
                                    //   maxLines: 2,
                                    //   controller: controller.addressController,
                                    //   validator: (value){
                                    //     if(controller.isBySelf.value == true){
                                    //       return null;
                                    //     }else {
                                    //       return emptyValidator(value,
                                    //           'Mention Destination (i.e Home,Hospital,Shopping');
                                    //     }
                                    //   },
                                    //   keyboardType: TextInputType.multiline, // Enables multi-line input from keyboard
                                    //   decoration: InputDecoration(
                                    //     border: OutlineInputBorder(
                                    //         borderRadius: BorderRadius.circular(20),
                                    //         borderSide: const BorderSide(color: secondaryColor)
                                    //     ),
                                    //     focusedBorder: OutlineInputBorder(
                                    //         borderRadius: BorderRadius.circular(20),
                                    //         borderSide: const BorderSide(color: secondaryColor)
                                    //     ),
                                    //     labelText: 'Address of destination',
                                    //     labelStyle: const TextStyle(color: secondaryColor),
                                    //     alignLabelWithHint: false,
                                    //   ),
                                    // ),
                                    //
                                    // SizedBox(height: heightX*.01,),
                                    //
                                    // const Row(
                                    //   children: [
                                    //     Flexible(child: Divider()),
                                    //     AppTextWidget(title: '(  OR  )'),
                                    //     Flexible(child: Divider()),
                                    //   ],
                                    // ),
                                    //
                                    // // CheckBox => By Self
                                    // Obx(()=>
                                    //     CheckboxListTile(
                                    //       checkboxScaleFactor: 1.5,
                                    //       contentPadding: const EdgeInsets.all(0),
                                    //       checkColor: secondaryColor,
                                    //       activeColor: accentColor,
                                    //       value: controller.isBySelf.value,
                                    //       onChanged: (value){
                                    //         controller.isBySelf.value = value ?? false;
                                    //       },
                                    //       title:  AppTextWidget(title: 'By Self',fontWeight: FontWeight.bold,
                                    //         fontSize: heightX*.018, textColor: primaryColor,
                                    //       ),
                                    //     )),
                                    //
                                    // TitleTextFieldWidget(
                                    //   title: 'Destination:',
                                    //   fieldText: 'Place, Home or Hospital',
                                    //   textEditingController: controller.destinationController,
                                    //   validator: (value){
                                    //     if(controller.isBySelf.value == false){
                                    //       return null;
                                    //     }
                                    //     return emptyValidator(value, 'Mention Destination (i.e Home,Hospital,Shopping');
                                    //   },),

                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: heightX*.03,),

                            // Purpose of Leave Box
                            Card(
                              elevation: 15,
                              color: Colors.white,
                              shadowColor: secondaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    AppTextWidget(title: 'Purpose of Leave',
                                      fontSize: heightX*.018,
                                      textColor: primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),

                                    TitleTextFieldWidget(title: 'Reason:',
                                      fieldText: 'Give proper reason',
                                      textEditingController: controller.reasonController,
                                      validator: (value){
                                        return  emptyValidator(value, 'Please give proper reason');
                                      },),

                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: heightX*.03,),

                            // Travel Information
                            Card(
                              elevation: 15,
                              shadowColor: secondaryColor,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    AppTextWidget(title: 'Travel Information',
                                      fontSize: heightX*.018,
                                      textColor: primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),

                                    // Card: Travel Information
                                    Column(
                                      children: [
                                        // From DateTime
                                        AppTextWidget(title: 'From',
                                          fontWeight: FontWeight.bold, fontSize: heightX*.016,
                                        ),
                                        BoardDateTimeInputField(
                                          controller: controller.fromTextController.value,
                                          pickerType: DateTimePickerType.datetime,
                                          options: const BoardDateTimeOptions(
                                            languages: BoardPickerLanguages.en(),
                                          ),
                                          onChanged: (date) {
                                            controller.fromDate.value = date;
                                          },
                                          onFocusChange: (val, date, text) {
                                            if (kDebugMode) {
                                              print('From focus changed: $val, $date, $text');
                                            }
                                          },
                                        ),
                                        const SizedBox(height: 10),
                                        Obx(() => AppTextWidget(title: "Selected From: ${BoardDateFormat('dd/MM/yyyy HH:mm').format(controller.fromDate.value)}",
                                          fontWeight: FontWeight.w400,
                                        )),

                                        SizedBox(height: heightX*.01),

                                        // To DateTime
                                        AppTextWidget(title: 'To',
                                          fontWeight: FontWeight.bold, fontSize: heightX*.016,
                                        ),
                                        BoardDateTimeInputField(
                                          controller: controller.toTextController.value,
                                          pickerType: DateTimePickerType.datetime,
                                          options: const BoardDateTimeOptions(
                                            languages: BoardPickerLanguages.en(),
                                          ),
                                          onChanged: (date) {
                                            controller.toDate.value = date;
                                          },
                                          onFocusChange: (val, date, text) {
                                            if (kDebugMode) {
                                              print('To focus changed: $val, $date, $text');
                                            }
                                          },
                                        ),
                                        const SizedBox(height: 10),
                                        Obx(() => AppTextWidget(title: "Selected To: ${BoardDateFormat('dd/MM/yyyy HH:mm').format(controller.toDate.value)}",
                                          fontWeight: FontWeight.w400,
                                        )),

                                        // CheckBox => Confirm Date and Time
                                        Obx(()=>
                                            CheckboxListTile(
                                              checkboxScaleFactor: 1.5,
                                              contentPadding: const EdgeInsets.all(0),
                                              checkColor: secondaryColor,
                                              activeColor: accentColor,
                                              value: controller.isDateConfirm.value,
                                              onChanged: (value){
                                                controller.isDateConfirm.value = value ?? false;
                                              },
                                              title:  AppTextWidget(title: 'Confirm Date and Time',fontWeight: FontWeight.bold,
                                                fontSize: heightX*.018, textColor: primaryColor,
                                              ),
                                            )),
                                      ],
                                    ),


                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: heightX*.03,),

                      ActionButtonWidget(label: 'Submit',
                          onTap: (){
                            SlipExitModel slipExitData = SlipExitModel(
                              uid: controller.userAccountController.user.value!.uid,
                              fullName: controller.userAccountController.user.value!.fullName,
                              regNo: controller.userAccountController.user.value!.regNo,
                              phoneNo: controller.userAccountController.user.value!.phoneNo,
                              roomNo: controller.userAccountController.user.value!.roomNo,
                              departmentName: controller.userAccountController.user.value!.departmentName,
                              batch: 'NULL',
                              guardianName: controller.isBySelf.value? 'none' : controller.guardianNameController.text.trim(),
                              relation: controller.isBySelf.value? 'none' : controller.relationController.text.trim(),
                              guardianPhoneNo: controller.isBySelf.value? 'none' : controller.guardianPhoneNoController.text.trim(),
                              address: controller.isBySelf.value? 'none' : controller.addressController.text.trim(),
                              destination: controller.isBySelf.value? controller.destinationController.text.trim() : 'none',
                              reason: controller.reasonController.text.trim(),
                              fromDate: controller.fromDate.value,
                              toDate: controller.toDate.value,
                            );

                            controller.submitSlipExit(slipExitData);



                          })

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


