
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/images/app_images.dart';
import 'package:quick_grievance/conts/validator/validator.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';
import 'package:quick_grievance/screens/auth/hostelite/signup/SignUpController.dart';
import 'package:quick_grievance/screens/auth/hostelite/signup/widgets/widgets.dart';

import '../../../../conts/app_height_width.dart';
import '../../../../conts/app_lists/department_name_list.dart';
import '../../../../conts/routes/screen_names.dart';
import '../widgets/widgets.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.offNamed(loginScreen);
        },
        backgroundColor: accentColor,
        mini: true,
        child: const Icon(Icons.arrow_back_ios_new,color: secondaryColor,),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [

          // Background Image
          Positioned(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(hostelBg),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  )),
            ),
          ),

          // Gradient Colors top of the Background Image Layer
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        primaryColor.withAlpha(450),
                        secondaryColor,
                      ],
                      begin: FractionalOffset.topLeft,
                      end: Alignment.bottomCenter)),
            ),
          ),

          // Middle Box => Main Content
          Positioned(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: heightX*.95,
                margin: EdgeInsets.only(top: heightX*.05),
                child: Stack(
                  alignment: Alignment.center,
                  children: [

                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            children: [

                              Card(
                                color: secondaryColor.withAlpha(420),
                                margin: EdgeInsets.symmetric(
                                  horizontal: widthX * .1, vertical: 60,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    // ===== Main Content =====

                                    SizedBox(height: heightX*.08,),

                                    AppTextWidget(title: 'Register as Hostelite',
                                      color: Colors.white, fontWeight: FontWeight.bold,
                                      fontSize: heightX*.024,
                                    ),

                                    SizedBox(height: heightX*.02,),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      child: Column(
                                        spacing: heightX*.01,
                                        children: [

                                          Form(
                                            key: controller.formKey,
                                            child: Column(
                                              spacing: heightX*.01,
                                              children: [

                                                // Full Name
                                                AppTextFormFieldWidget(
                                                  ctrl: controller.fullNameController,
                                                  keyType: TextInputType.name,
                                                  mainColor: Colors.black.withAlpha(300),
                                                  labelText: 'Full Name',
                                                  customValidator: true,
                                                  validator: (value){
                                                    return nameValidator(value);
                                                  },
                                                  borderRadius: 20,
                                                  textColor: accentColor,
                                                  showPrefixIcon: true,
                                                  prefixIcon: Icons.person,
                                                  iconColor: accentColor,
                                                ),

                                                // Email
                                                AppTextFormFieldWidget(
                                                  ctrl: controller.emailController,
                                                  keyType: TextInputType.emailAddress,
                                                  mainColor: Colors.black.withAlpha(300),
                                                  labelText: 'Email',
                                                  customValidator: true,
                                                  validator: (value){
                                                    return  emailValidator(value);
                                                  },
                                                  borderRadius: 20,
                                                  textColor: accentColor,
                                                  showPrefixIcon: true,
                                                  prefixIcon: Icons.email,
                                                  iconColor: accentColor,
                                                ),

                                                // Reg.no
                                                AppTextFormFieldWidget(
                                                  ctrl: controller.regNoController,
                                                  keyType: TextInputType.text,
                                                  mainColor: Colors.black.withAlpha(300),
                                                  labelText: 'Reg.no',
                                                  customValidator: true,
                                                  validator: (value){
                                                    return  regNumberValidator(value);
                                                  },
                                                  borderRadius: 20,
                                                  textColor: accentColor,
                                                  showPrefixIcon: true,
                                                  prefixIcon: CupertinoIcons.number_circle_fill,
                                                  iconColor: accentColor,
                                                ),

                                                // Phone Number
                                                AppTextFormFieldWidget(
                                                  ctrl: controller.phoneNoController,
                                                  keyType: TextInputType.phone,
                                                  mainColor: Colors.black.withAlpha(300),
                                                  labelText: 'Phone.no',
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
                                                  borderRadius: 20,
                                                  textColor: accentColor,
                                                  showPrefixIcon: true,
                                                  prefixIcon: CupertinoIcons.phone_fill,
                                                  iconColor: accentColor,
                                                ),

                                                // Room Number
                                                AppTextFormFieldWidget(
                                                  ctrl: controller.roomNoController,
                                                  keyType: TextInputType.number,
                                                  mainColor: Colors.black.withAlpha(300),
                                                  labelText: 'Room.no',
                                                  customValidator: true,
                                                  validator: (value){
                                                    return roomNumberValidator(value);
                                                  },
                                                  borderRadius: 20,
                                                  textColor: accentColor,
                                                  showPrefixIcon: true,
                                                  prefixIcon: Icons.hotel_sharp,
                                                  iconColor: accentColor,
                                                ),

                                                // Batch Year
                                                AppTextFormFieldWidget(
                                                  ctrl: controller.batchController,
                                                  keyType: TextInputType.text,
                                                  mainColor: Colors.black.withAlpha(300),
                                                  labelText: 'Batch Year (i.e 2021-25)',
                                                  customValidator: true,
                                                  validator: (value){
                                                    if(value == null){
                                                      return emptyValidator(value,
                                                          'Enter Batch Year (i.e 2021-25');
                                                    }else{
                                                      return batchYearValidator(value);
                                                    }
                                                  },
                                                  borderRadius: 20,
                                                  textColor: accentColor,
                                                  showPrefixIcon: true,
                                                  prefixIcon: Icons.school,
                                                  iconColor: accentColor,
                                                ),


                                                // Department Name
                                                DropdownButtonFFWidget(
                                                  onChanged: (value){
                                                    controller.departmentName.value = value;
                                                  }, listName: ntuDepartments,
                                                  icon: Icons.location_city_outlined,
                                                ),



                                                // Password
                                                Obx(()=>
                                                    AppTextFormFieldWidget(
                                                      onTap: (){
                                                        controller.changeVisibility();
                                                      },
                                                      ctrl: controller.passwordController,
                                                      keyType: TextInputType.visiblePassword,
                                                      mainColor: Colors.black.withAlpha(300),
                                                      labelText: 'Password',
                                                      customValidator: true,
                                                      validator: (value){
                                                        if(value == null){
                                                          return emptyValidator(value,
                                                              'Please set your password');
                                                        }else{
                                                          return passwordValidator(value);
                                                        }
                                                      },
                                                      borderRadius: 20,
                                                      showSuffixIcon: true,
                                                      textColor: accentColor,
                                                      showPrefixIcon: true,
                                                      prefixIcon: Icons.lock,
                                                      iconColor: accentColor,
                                                      visiblePassword: controller.passwordVisible.value,
                                                    )
                                                ),
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(top: heightX*.02),
                                            child: Obx(()=>
                                                ActionButtonWidget(label: 'SignUp',
                                                  onTap: (){
                                                    controller.signUp();
                                                  },
                                                  isLoading: controller.loading.value,
                                                  height: heightX*.05,
                                                  width: widthX,

                                                )
                                            ),
                                          )
                                        ],
                                      ),
                                    ),

                                    const DividerTextWidget(color: accentColor,),



                                    DuelText(firstText: 'Already have an account?',
                                      secondText: ' Login',
                                      onTap: () {
                                        Get.offNamed(loginScreen);
                                      },
                                    ),

                                    SizedBox(height: heightX*.1,),

                                  ],
                                ),
                              ),

                              Positioned(
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: heightX*.012),
                                      child: CircleAvatar(
                                        radius: heightX*.06,
                                        backgroundColor: secondaryColor,
                                        child: CircleAvatar(
                                          radius: heightX*.055,
                                          backgroundColor: primaryColor,
                                          foregroundImage: const AssetImage(hosteliteIcon),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
