import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/images/app_images.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';
import 'package:quick_grievance/screens/auth/hostelite/signup/SignUpController.dart';

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
                      child: Container(
                        height: heightX *.99,
                        width: widthX,
                        margin: EdgeInsets.symmetric(
                          horizontal: widthX * .1, vertical: 60,
                        ),
                        decoration: BoxDecoration(
                            color: secondaryColor.withAlpha(440),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                      
                            // ===== Main Content =====
                      
                            SizedBox(height: heightX*.08,),
                      
                            AppTextWidget(title: 'Register as Hostelite',
                            textColor: Colors.white, fontWeight: FontWeight.bold,
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
                                          returnMessage: 'Enter Full Name',
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
                                          returnMessage: 'Enter Email',
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
                                          returnMessage: 'Enter University Reg.Number',
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
                                          returnMessage: 'Enter Phone Number',
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
                                          returnMessage: 'Enter Room Number',
                                          borderRadius: 20,
                                          textColor: accentColor,
                                          showPrefixIcon: true,
                                          prefixIcon: Icons.hotel_sharp,
                                          iconColor: accentColor,
                                        ),

                                        // Batch Year
                                        AppTextFormFieldWidget(
                                          ctrl: controller.departmentNameController,
                                          keyType: TextInputType.text,
                                          mainColor: Colors.black.withAlpha(300),
                                          labelText: 'Batch Year',
                                          returnMessage: 'Enter Batch year (i.e 21-25)',
                                          borderRadius: 20,
                                          textColor: accentColor,
                                          showPrefixIcon: true,
                                          prefixIcon: Icons.school,
                                          iconColor: accentColor,
                                        ),


                                        // Department Name
                                  DropdownButtonFormField<String>(
                                    dropdownColor: secondaryColor,
                                    decoration: InputDecoration(
                                        labelText: 'Select Department',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                            color: Colors.grey, // Default border color
                                            width: 1.5,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.5,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                            color: primaryColor,
                                            width: 2.0,
                                          ),
                                        ),
                                      labelStyle: GoogleFonts.poppins(
                                          fontSize: heightX*.014,
                                          fontWeight: FontWeight.w500,
                                          color: primaryColor,
                                      ),
                                      fillColor: Colors.black.withAlpha(300),
                                      prefixIcon: const Icon(Icons.location_city,
                                      color: accentColor,
                                      ),
                                      suffixIconColor: primaryColor
                                    ),
                                    items: ntuDepartments.map((dept) {
                                      return DropdownMenuItem<String>(
                                        value: dept,
                                        child: Flexible(
                                          child: SizedBox(
                                            width: widthX*.5,
                                            child: AppTextWidget(
                                              title: dept,
                                            overflow: true,
                                            textColor: primaryColor,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                         // handle value
                                    },
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
                                              returnMessage: 'Enter Password',
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
                                    child: ActionButtonWidget(label: 'SignUp',
                                        onTap: (){
                                      controller.signUp();
                                        },
                                      height: heightX*.05,
                                      width: widthX,

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
                            )

                      
                          ],
                        ),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}

