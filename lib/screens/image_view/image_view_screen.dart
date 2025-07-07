import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/conts/routes/screen_names.dart';
import 'package:quick_grievance/model/complaint_model.dart';

import '../../conts/app_height_width.dart';
import '../app_widgets/widgets.dart';

class ImageViewScreen extends StatelessWidget {
  const ImageViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ComplaintModel arguments = Get.arguments;
    return Scaffold(
      backgroundColor: secondaryColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.back();
        },
        backgroundColor: accentColor,
        mini: true,
        child: const Icon(Icons.arrow_back_ios_new,color: secondaryColor,),
      ),
      body: Center(
        child: CachedNetworkImageWidget(
            networkImage: arguments.image,
            fit: BoxFit.fitWidth,
            width: widthX, height: heightX),
      ),
    );
  }
}
