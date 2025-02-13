import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/images/app_images.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/screens/mess/vote/widgets/vote_card_widget.dart';

import '../../../conts/app_height_width.dart';
import '../../app_widgets/widgets.dart';

class VoteScreen extends StatelessWidget {
  const VoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.offNamed(messScreen);
        },
        backgroundColor: accentColor,
        mini: true,
        child: const Icon(Icons.arrow_back_ios_new,color: secondaryColor,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      title: 'Vote',
                      fontSize: heightX*.03,
                      textColor: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Header Text: Cast Your Vote
                AppTextWidget(title: 'Cast Your Vote!',fontSize: heightX*.026,
                fontWeight: FontWeight.w700,
                ),

                const SizedBox(height: 20,),

                VoteCardWidget(label: 'Chicken Pulao',
                    onTap: (){},
                    isVote: true,
                    image: chickenPulao),
                SizedBox(height: heightX*.03,),
                VoteCardWidget(label: 'Mix Vegetable',
                    onTap: (){},
                    isVote: false,
                    image: mixVegetable),

                SizedBox(height: heightX*.03,),
                Align(
                    alignment: Alignment.center,
                    child: ActionButtonWidget(label: 'Submit', onTap: (){}))
              ],
            ),
          ),



        ],
      ),
    );
  }
}

