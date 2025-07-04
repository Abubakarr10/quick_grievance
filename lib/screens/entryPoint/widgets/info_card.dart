import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.name,
    required this.bio,
  });

  final String name, bio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
         const CircleAvatar(
            backgroundColor: Colors.white24,
            child: Icon(
              CupertinoIcons.person,
              color: Colors.white,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              AppTextWidget(title: name,
              fontSize: 16,
                color: pureWhite, fontWeight: FontWeight.w700,
              ),

              AppTextWidget(
                fontSize: 12,
                title: bio,color: midTextColor,
              )
            ],
          ),
        ],
      ),
    );
  }
}
