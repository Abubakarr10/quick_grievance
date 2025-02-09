import 'package:flutter/material.dart';
import 'package:quick_grievance/conts/app_height_width.dart';
import 'package:quick_grievance/conts/images/app_images.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';

import '../../conts/app_colors.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:  Column(
          spacing: heightX*.014,
          children: [

            Stack(
              children: [
                Image.asset(topBarVector),

                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: heightX*.065,),

                          // Text: Welcoming Name
                          Padding(
                            padding: EdgeInsets.only(top: heightX*.025),
                            child: AppTextWidget(title: 'Salam! Hiba 👋🏼',
                              fontSize: 24, fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppTextWidget(title: '14, January 2025', textColor: Colors.white,
                            fontSize: 18,),
                          AppTextWidget(title: 'Tuesday',textColor: Colors.white,
                            fontSize: 22, fontWeight: FontWeight.w600,),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardButtonWidget(label: 'Slip Exit', icon: Icons.exit_to_app_outlined,),
                CardButtonWidget(label: 'Mess Menu', icon: Icons.food_bank_outlined,),
              ],
            ),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardButtonWidget(label: 'Complain', icon: Icons.comment_outlined,),
                CardButtonWidget(label: 'History', icon: Icons.history_outlined,),
              ],
            ),

            Container(
              width: widthX,
              height: 160,
              margin: EdgeInsets.symmetric(vertical: heightX*.010,horizontal: 20),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(25)
              ),
              child: Padding(
                padding:  EdgeInsets.all(heightX*.014),
                child: Column(
                  children: [
                    AppTextWidget(title: 'Track your complain Status'.toUpperCase(),
                    fontWeight: FontWeight.bold, textColor: Colors.white,
                      fontSize: 24,
                    ),

                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.track_changes_outlined,color: Colors.white,
                      size: heightX*.07,),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardButtonWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  const CardButtonWidget({
    super.key, required this.label, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightX*.25,
      width: widthX*.4,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          // Icon
          CircleAvatar(
            radius: 40,
            backgroundColor: secondaryColor,
            child: Icon(icon,
              color: Colors.white,size: 40,),
          ),
          // Text: Label
          AppTextWidget(title: label,
            fontSize: heightX*.02,
            fontWeight: FontWeight.w500, textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
