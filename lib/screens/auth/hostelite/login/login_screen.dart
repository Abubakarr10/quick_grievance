import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/images/app_images.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';
import 'package:quick_grievance/screens/auth/hostelite/login/LoginController.dart';

import '../../../../conts/app_height_width.dart';
import '../../../../conts/routes/screen_names.dart';
import '../widgets/widgets.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
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
              alignment: Alignment.center,
              child: Container(
                height: heightX*.7,
                margin: EdgeInsets.only(top: heightX*.05),
                child: Stack(
                  alignment: Alignment.center,
                  children: [

                    SingleChildScrollView(
                      child: Container(
                        height: heightX *.6,
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

                            AppTextWidget(title: 'Login as Hostelite',
                              color: Colors.white, fontWeight: FontWeight.bold,
                              fontSize: heightX*.024,
                            ),

                            SizedBox(height: heightX*.02,),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Form(
                                key: controller.formKey,
                                child: Column(
                                  spacing: heightX*.01,
                                  children: [

                                    // Email
                                    AppTextFormFieldWidget(
                                      ctrl: controller.emailController,
                                      keyType: TextInputType.name,
                                      mainColor: Colors.black.withAlpha(300),
                                      labelText: 'Email',
                                      returnMessage: 'Enter correct email',
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

                                    Padding(
                                      padding: EdgeInsets.only(top: heightX*.02),
                                      child: ActionButtonWidget(label: 'Login',
                                        onTap: (){
                                        controller.login();
                                        },
                                        height: heightX*.05,
                                        width: widthX,

                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            const DividerTextWidget(color: accentColor,),



                            DuelText(firstText: "Don't have an account!?",
                                secondText: ' Register',
                                onTap: (){
                              Get.toNamed(signUpScreen);
                                })


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
