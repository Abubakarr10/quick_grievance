import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/images/app_images.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';

import '../../conts/app_colors.dart';
import '../../conts/app_height_width.dart';
import '../app_widgets/widgets.dart';
import 'widgets/widgets.dart';

class MessScreen extends StatelessWidget {
  const MessScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Text => Mess
            Stack(
              children: [

                Image.asset(appBarVector),

                // Screen Title => Mess
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: heightX*.06, bottom: heightX*.02),
                    child: AppTextWidget(
                        title: 'Mess',
                        fontSize: heightX*.03,
                        textColor: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),

            // Today's Mess
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  AppTextWidget(title: "Today's Mess",
                  fontSize: heightX*.028, fontWeight: FontWeight.w700,
                  ),

                  SizedBox(height: heightX*.01,),

                  const MessCardWidget(mealTitle: 'Chicken Pulao',
                      description: '1 Plate with Raitha',
                      price: '350', image: chickenPulao, vote: '120',),

                  SizedBox(height: heightX*.03,),

                  const MessCardWidget(mealTitle: 'Mix Vegetable',
                      description: 'With 2 Roti',
                      price: '150', image: mixVegetable, vote: '34',)

                ],
              ),
            ),

            SizedBox(height: heightX*.03,),

            Align(
              alignment: Alignment.center,
              child: ActionButtonWidget(label: 'Vote Meal',
                  onTap: (){
                Get.toNamed(voteScreen);
                  })
            )

          ],
        ),
      ),
    );
  }
}
