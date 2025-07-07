import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quick_grievance/conts/app_colors.dart';
import 'package:quick_grievance/screens/app_widgets/widgets.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.networkImage,
    required this.width,
    required this.height,
    this.fit = BoxFit.cover,
  });

  final String networkImage;
  final double width;
  final double height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: networkImage,
      width: width ,
      height: height,
      imageBuilder: (context, imageProvider) => Container(
        width: width ,
        height: height ,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) =>
      const Center(
        child: SpinKitWidget(),
      ),
      errorWidget: (context, url, error) => const
      Center(
        child: Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 35,
        ),
      ),
    );
  }
}