import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/screens/profile/profile_screen/settings/user_account/widgets/widgets.dart';

import '../../../../../conts/app_colors.dart';
import '../../../../../conts/app_height_width.dart';
import '../../../../../conts/images/app_images.dart';
import '../../../../app_widgets/widgets.dart';

class UserAccountScreen extends StatelessWidget {
  const UserAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.offNamed(profileScreen);
        },
        backgroundColor: accentColor,
        mini: true,
        child: const Icon(Icons.arrow_back_ios_new,color: secondaryColor,),
      ),
      body: Column(
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
                      title: 'User Account',
                      fontSize: heightX*.03,
                      textColor: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: heightX*.16),
                child: Column(
                  children: [

                    // Bio
                    Center(
                      child: Card(
                        elevation: 6,
                        margin: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CircleAvatar(
                                radius: 45,
                                backgroundColor: accentColor,
                                foregroundImage: AssetImage(hosteliteIcon),
                              ),
                              SizedBox(height: heightX*.009),
                              AppTextWidget(title: 'Name',
                              fontSize: heightX*.028, fontWeight: FontWeight.bold,
                              ),

                              SizedBox(height: heightX*.005,),

                              Column(
                                spacing: heightX*.008,
                                children: const [
                                  InfoRowWidget(title: 'Email', icon: Icons.email, info: 'email@gmail.com',),
                                  InfoRowWidget(title: 'Phone', icon: Icons.phone, info: '+92 1234564356',),
                                  InfoRowWidget(title: 'Reg.no', icon: Icons.numbers, info: '21-NTU-CS-1316',),
                                  InfoRowWidget(title: 'Room.no', icon: Icons.meeting_room, info: '60',),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // University Details
                    Center(
                      child: Card(
                        elevation: 6,
                        margin: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppTextWidget(title: 'University Details',
                                fontSize: heightX*.026, fontWeight: FontWeight.bold,
                                textColor: primaryColor,
                              ),

                              SizedBox(height: heightX*.005,),

                              Column(
                                spacing: heightX*.008,
                                children: const [
                                  InfoRowWidget(title: 'Department', icon: Icons.apartment, info: 'DCS',),
                                  InfoRowWidget(title: 'Degree', icon: Icons.school, info: 'Software Engineering',),
                                  InfoRowWidget(title: 'Batch', icon: Icons.batch_prediction, info: '21-25',),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
