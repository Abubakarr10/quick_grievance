import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/images/rive_images.dart';
import 'package:quick_grievance/screens/app_widgets/app_text_widget.dart';
import 'package:rive/rive.dart';

class AnimatedButtonWidget extends StatelessWidget {
  const AnimatedButtonWidget({
    super.key,
    required RiveAnimationController btnAnimationController,
    required this.press,
  }) : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 236,
        child: Stack(
          children: [
            RiveAnimation.asset(
              buttonRiveImage,
              controllers: [_btnAnimationController],
            ),
            const Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_right_outlined,size: 40,color: secondaryColor,),
                  SizedBox(width: 4),
                  AppTextWidget(title: 'Join Hostel',
                  fontWeight: FontWeight.bold,
                    fontSize: 18,
                    textColor: secondaryColor,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
