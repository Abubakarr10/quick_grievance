import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/images/app_images.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';
import 'package:quick_grievance/screens/auth/warden/WardenJoinController.dart';

import '../../../conts/app_height_width.dart';
import '../../../conts/validator/validator.dart';

class WardenJoinScreen extends GetView<WardenJoinController> {
  const WardenJoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WardenJoinController());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.offNamed(onBoardingScreen);
          },
        backgroundColor: accentColor,
        mini: true,
        child: const Icon(Icons.arrow_back_ios_new,color: secondaryColor,),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(wardenBg),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  )),
            ),
          ),
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
          Positioned(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: heightX*.8,
                margin: const EdgeInsets.only(top: 10),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [

                    Card(
                      color: secondaryColor.withAlpha(440),
                      elevation: 0,
                      margin: EdgeInsets.symmetric(
                        horizontal: widthX * .1, vertical: heightX*.06,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          // ===== Main Content =====

                          SizedBox(height: heightX*.08,),

                          AppTextWidget(title: 'Register as Warden',
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
                                  child: Obx(()=>
                                      ActionButtonWidget(label: 'Login',
                                        isLoading: controller.loading.value,
                                        onTap: (){
                                          controller.login();
                                        },
                                        height: heightX*.05,
                                        width: widthX,

                                      )
                                  ),
                                )
                              ],
                            ),
                          ),




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
                                foregroundImage: const AssetImage(wardenIcon),
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
