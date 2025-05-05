import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/images/app_images.dart';
import 'package:quick_grievance/conts/images/rive_images.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/screens/entryPoint/EntryPointController.dart';
import 'package:quick_grievance/screens/slip_exit/SlipExitController.dart';
import 'package:quick_grievance/screens/slip_exit/widgets/widgets.dart';

import '../../conts/app_colors.dart';
import '../../conts/app_height_width.dart';
import '../../model/slip_exit_model.dart';
import '../app_widgets/widgets.dart';

class SlipExitScreen extends GetView<SlipExitController> {
  const SlipExitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SlipExitController());
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
                              title: 'Slip Exit',
                              fontSize: heightX*.03,
                              textColor: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),

                      // Guardian Information Box
                      Container(
                        height: heightX*.655,
                        width: widthX,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: secondaryColor,
                                  blurRadius: 10, offset: Offset(0, heightX*.01)
                              )
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              AppTextWidget(title: 'Guardian Information',
                                fontSize: heightX*.018,
                                textColor: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),

                              TitleTextFieldWidget(title: 'Name of Person Visiting/Receiving:',
                                fieldText: 'Name of person',
                                textEditingController: controller.guardianNameController,),

                              SizedBox(height: heightX*.01,),

                              TitleTextFieldWidget(
                                  title: 'Relation with Student:',
                                  fieldText: 'Relation',
                                textEditingController: controller.relationController,),

                              SizedBox(height: heightX*.01,),

                              TitleTextFieldWidget(
                                  title: 'Guardian Contact.No:',
                                  fieldText: '+92 123456789',
                                textEditingController: controller.guardianPhoneNoController,),

                              SizedBox(height: heightX*.01,),

                              AppTextWidget(title: 'Address:',
                                fontSize: heightX*.014, fontWeight: FontWeight.w500,
                              ),

                              SizedBox(height: heightX*.005,),

                              // Text => Address Box
                              TextField(
                                maxLines: 2,
                                controller: controller.addressController,
                                keyboardType: TextInputType.multiline, // Enables multi-line input from keyboard
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(color: secondaryColor)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(color: secondaryColor)
                                  ),
                                  labelText: 'Contact, Address',
                                  labelStyle: const TextStyle(color: secondaryColor),
                                  alignLabelWithHint: false,
                                ),
                              ),

                              SizedBox(height: heightX*.01,),

                              const Row(
                                children: [
                                  Flexible(child: Divider()),
                                  AppTextWidget(title: '(  OR  )'),
                                  Flexible(child: Divider()),
                                ],
                              ),

                              // CheckBox => By Self
                              Obx(()=>
                                  CheckboxListTile(
                                    checkboxScaleFactor: 1.5,
                                contentPadding: const EdgeInsets.all(0),
                                checkColor: secondaryColor,
                                activeColor: accentColor,
                                value: controller.isBySelf.value,
                                onChanged: (value){
                                  controller.isBySelf.value = value ?? false;
                                },
                                title:  AppTextWidget(title: 'By Self',fontWeight: FontWeight.bold,
                                fontSize: heightX*.018, textColor: primaryColor,
                                ),
                              )),

                              TitleTextFieldWidget(
                                  title: 'Destination:',
                                  fieldText: 'Place, Home or Hospital',
                                textEditingController: controller.destinationController,),

                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: heightX*.03,),

                      // Purpose of Leave Box
                      Container(
                        height: heightX*.175,
                        width: widthX,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: secondaryColor,
                                  blurRadius: 10, offset: Offset(0, heightX*.01)
                              )
                            ]
                        ),
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
                                textEditingController: controller.reasonController,),

                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: heightX*.03,),

                      // Travel Information
                      Container(
                        height: heightX*.36,
                        width: widthX,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: secondaryColor,
                                  blurRadius: 10, offset: Offset(0, heightX*.01)
                              )
                            ]
                        ),
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



                              // BoardDateTimeInputField(
                              //   controller: controller.textController.value,
                              //   pickerType: DateTimePickerType.datetime,
                              //   options: const BoardDateTimeOptions(
                              //     languages: BoardPickerLanguages.en(),
                              //   ),
                              //   onChanged: (date) {
                              //     if (kDebugMode) {
                              //       print('onChanged: $date');
                              //     }
                              //   },
                              //   onFocusChange: (val, date, text) {
                              //     if (kDebugMode) {
                              //       print('on focus changed date: $val, $date, $text');
                              //     }
                              //   },
                              // ),
                              //
                              // Obx(()=>
                              //     Flexible(
                              //       child: BoardDateTimeBuilder(
                              //       pickerType: DateTimePickerType.datetime,
                              //       controller: controller.dateTimeController.value,
                              //       builder: (context){
                              //         return Text(BoardDateFormat('dd/MM/yyyy').format(controller.date.value));
                              //       },
                              //       onChange: (val) {
                              //         controller.date.value = val;
                              //         if (kDebugMode) {
                              //           print('Touch hora ha');
                              //         }
                              //       }),
                              //     )
                              // ),

                              Column(
                                children: [
                                  // From DateTime
                                  const Text("From", style: TextStyle(fontWeight: FontWeight.bold)),
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
                                  Obx(() => Text("Selected From: ${BoardDateFormat('dd/MM/yyyy HH:mm').format(controller.fromDate.value)}")),

                                  const SizedBox(height: 30),

                                  // To DateTime
                                  const Text("To", style: TextStyle(fontWeight: FontWeight.bold)),
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
                                  Obx(() => Text("Selected To: ${BoardDateFormat('dd/MM/yyyy HH:mm').format(controller.toDate.value)}")),
                                ],
                              ),


                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: heightX*.03,),

                      ActionButtonWidget(label: 'Submit',
                          onTap: (){
                            SlipExitModel slipExitData = SlipExitModel(
                                uid: 'uid',
                                fullName: 'fullName',
                                regNo: 'regNo',
                                phoneNo: 'phoneNo',
                                roomNo: 'roomNo',
                                departmentName: 'departmentName',
                                guardianName: controller.guardianNameController.text.trim(),
                                relation: controller.relationController.text.trim(),
                                guardianPhoneNo: controller.guardianPhoneNoController.text.trim(),
                                address: controller.addressController.text.trim(),
                                destination: controller.destinationController.text.trim(),
                                reason: controller.reasonController.text.trim(),
                                fromDate: controller.fromDate.value,
                                toDate: controller.toDate.value
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
