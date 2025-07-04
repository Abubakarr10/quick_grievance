import 'package:flutter/material.dart';

import '../../../conts/app_colors.dart';
import '../../../conts/app_height_width.dart';
import '../../app_widgets/widgets.dart';

class MessCardWidget extends StatelessWidget {
  final String mealTitle;
  final String description;
  final String price;
  final String vote;
  final String image;
  final VoidCallback onTap;
  const MessCardWidget({
    super.key, required this.mealTitle, required this.description, required this.price, required this.image, required this.vote,
    this.onTap =  _defaultOnTap,
  }
  );

  static void _defaultOnTap() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightX*.32,
      width: widthX,
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
      child: InkWell(
        onTap: onTap,
        child: Column(
          spacing: heightX*.02,
          children: [

            // Image Container
            Container(
              height: heightX*.18,
              width: widthX,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                      color: secondaryColor,
                      blurRadius: 10,offset: Offset(0, heightX*.01)
                  )]
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)
                ),
                child: CachedNetworkImageWidget(networkImage: image,
                    width: widthX, height: heightX*.18),
              ),
            ),

            // Content Container
            Container(
              height: heightX*.12,
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
                      color: Colors.white, fontWeight: FontWeight.bold,
                      fontSize: heightX*.02,
                    ),
                    AppTextWidget(title: description,
                      fontSize: heightX*.014, color: primaryColor,
                    ),
                    SizedBox(height: heightX*.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppTextWidget(title: 'Rs $price',
                          color: primaryColor, fontWeight: FontWeight.bold,
                          fontSize: heightX*.026,
                        ),
                        AppTextWidget(title: '|',
                          color: primaryColor, fontWeight: FontWeight.bold,
                          fontSize: heightX*.026,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.how_to_vote_outlined,color: primaryColor,),
                            AppTextWidget(title: ' $vote Votes',
                              color: primaryColor, fontWeight: FontWeight.bold,
                              fontSize: heightX*.026,
                            ),
                          ],
                        ),
                      ],
                    ),
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