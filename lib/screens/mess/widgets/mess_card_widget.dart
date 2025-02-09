import 'package:flutter/material.dart';

import '../../../conts/app_colors.dart';
import '../../../conts/app_height_width.dart';
import '../../app_widgets/widgets.dart';

class MessCardWidget extends StatelessWidget {
  final String mealTitle;
  final String description;
  final String price;
  final String image;
  const MessCardWidget({
    super.key, required this.mealTitle, required this.description, required this.price, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightX*.3,
      width: widthX*.44,
      decoration: BoxDecoration(
        color: primaryColor,
        boxShadow: [BoxShadow(
          color: secondaryColor,
          blurRadius: 10, offset: Offset(0, heightX*.01),
        )],
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          // bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        spacing: heightX*.02,
        children: [
          Container(
            height: heightX*.18,
            width: widthX,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)
                ),
                image:  DecorationImage(image: AssetImage(image),fit: BoxFit.cover),
                boxShadow: [BoxShadow(
                    color: secondaryColor,
                    blurRadius: 10,offset: Offset(0, heightX*.01)
                )]
            ),
          ),
          Container(
            height: heightX*.1,
            width: widthX,
            decoration: const BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100),
                  bottomLeft: Radius.circular(20),
                  //  bottomRight: Radius.circular(20),
                )
            ),
            child: Padding(
              padding:  EdgeInsets.all(heightX*.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  AppTextWidget(title: mealTitle,
                    textColor: Colors.white, fontWeight: FontWeight.bold,
                    fontSize: heightX*.016,
                  ),
                  AppTextWidget(title: description,
                    fontSize: heightX*.010, textColor: primaryColor,
                  ),
                  SizedBox(height: heightX*.004,),
                  AppTextWidget(title: 'Rs $price',
                    textColor: primaryColor, fontWeight: FontWeight.bold,
                    fontSize: heightX*.025,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}