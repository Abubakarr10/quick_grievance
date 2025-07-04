import 'package:flutter/material.dart';

import '../../../../conts/app_colors.dart';
import '../../../../conts/app_height_width.dart';
import '../../../../conts/images/app_images.dart';
import '../../../app_widgets/widgets.dart';

class VoteCardWidget extends StatelessWidget {
  final String label;
  final String image;
  final VoidCallback onTap;
  final bool isVote;
  const VoteCardWidget({
    super.key, required this.label, required this.onTap,this.isVote = false, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightX*.28,
      width: widthX,
      padding: EdgeInsets.all(heightX*.01),
      decoration: BoxDecoration(
        gradient:  LinearGradient(
            colors: isVote == true?
            [secondaryColor,accentColor,secondaryColor]
                : [secondaryColor,Colors.black],
            begin: Alignment.topLeft, end: Alignment.centerRight
        ),
        boxShadow: [BoxShadow(
          color: isVote == true? secondaryColor : Colors.black,
          blurRadius: isVote == true? 20 : 10, offset: Offset(0, heightX*.01),
        )],
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: heightX*.2,
              width: widthX,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                      color: secondaryColor,
                      blurRadius: 10, offset: Offset(0, heightX*.01)
                  )],
              ),
              child: Stack(
                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImageWidget(
                        networkImage: image,
                        width: widthX,
                        height: heightX*.2),
                  ),

                  Visibility(
                    visible: isVote == true? true:false,
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        shadows: const [BoxShadow(color: Colors.black,blurRadius: 30,spreadRadius: 26)],
                        Icons.verified_outlined,color: Colors.white,size: heightX*.14,),
                    ),
                  ),
                ],
              ),
            ),
            AppTextWidget(title: label,color: Colors.white,
              showShadows: true,
              fontWeight: FontWeight.bold,
              fontSize: isVote == true? heightX*.03 :  heightX*.028,
            ),
          ],
        ),
      ),
    );
  }
}