import 'package:flutter/material.dart';
import 'package:nirog_street/app/core/app_colors.dart';
class InteractiveNetworkImage extends StatelessWidget {
  final double height;
  final double width;
  final String imageUrl;
  const InteractiveNetworkImage({
    Key? key,
    required this.height,
    required this.width,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      panEnabled: false, // Set it to false
      minScale: 1,
      maxScale: 2,
      onInteractionEnd: (ScaleEndDetails details){
        print("interaction with image done");
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(),
          color: AppColors.COLOR_GREY_100,
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
