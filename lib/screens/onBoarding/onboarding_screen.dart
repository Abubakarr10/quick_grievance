import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/app_height_width.dart';
import 'package:quick_grievance/conts/images/rive_images.dart';
import 'package:quick_grievance/screens/app_widgets/app_text_widget.dart';
import 'package:rive/rive.dart' hide Image;

import '../../conts/images/app_images.dart';
import 'widgets/widgets.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late RiveAnimationController _btnAnimationController;

  bool isShowSignInDialog = false;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Stack(
        children: [

          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            left: 100,
            bottom: 100,
            child: Image.asset(
              splineImage,
            ),
          ),

          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),

          const RiveAnimation.asset(
            shapesRiveImage,
          ),

          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(),
            ),
          ),

          AnimatedPositioned(
            top: isShowSignInDialog ? -50 : 0,
            height: heightX,
            width: widthX,
            duration: const Duration(milliseconds: 260),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),

                     SizedBox(
                      width: widthX,
                      child: Column(
                        spacing: heightX*.016,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text: Title Text
                          FittedBox(
                            child: AppTextWidget(title: 'Quick\nGrievance',
                            fontSize: heightX*.070,
                              textColor: primaryColor,
                              fontWeight: FontWeight.w700,
                              showShadows: true,
                            ),
                          ),
                          AppTextWidget(
                            title: "Easily manage hostel complaints and permissions with our seamless online system. Submit mess complaints, request exit permissions, and generate exit slips—all in one place.",
                            fontSize: heightX*.018,
                            textColor: Colors.white,
                            showShadows: true,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),

                    AnimatedButtonWidget(
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        _btnAnimationController.isActive = true;

                        Future.delayed(
                          const Duration(milliseconds: 800),
                          () {
                            setState(() {
                              isShowSignInDialog = true;
                            });
                            if (!context.mounted) return;
                            showJoinDialog(
                              context,
                              onValue: (_) {},
                            );
                          },
                        );
                      },
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: AppTextWidget(title: 'Stay connected and resolve issues quickly for a better hostel experience.',
                      textColor: Colors.white, showShadows: true,
                      ),
                    )
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
