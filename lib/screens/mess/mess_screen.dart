import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_grievance/conts/images/app_images.dart';

import '../../conts/app_colors.dart';
import '../../conts/app_height_width.dart';
import '../app_widgets/widgets.dart';
import 'widgets/widgets.dart';

class MessScreen extends StatelessWidget {
  const MessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                AppTextWidget(title: "Today`s Mess",
                fontSize: heightX*.028, fontWeight: FontWeight.w700,
                ),

                SizedBox(height: heightX*.02,),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MessCardWidget(mealTitle: 'Chicken Pulao',
                        description: '1 Plate with Raitha',
                        price: '350', image: chickenPulao),
                    MessCardWidget(mealTitle: 'Mix Vegetable',
                        description: 'With 2 Roti',
                        price: '150', image: mixVegetable),
                  ],
                )

              ],
            ),
          ),

          // Tomorrow
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                AppTextWidget(title: "Tomorrow",
                  fontSize: heightX*.028, fontWeight: FontWeight.w700,
                ),

                SizedBox(height: heightX*.02,),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MessCardWidget(mealTitle: 'Chicken Pulao',
                        description: '1 Plate with Raitha',
                        price: '350', image: chickenPulao),
                    MessCardWidget(mealTitle: 'Mix Vegetable',
                        description: 'With 2 Roti',
                        price: '150', image: mixVegetable),
                  ],
                )

              ],
            ),
          ),


        ],
      ),
    );
  }
}
