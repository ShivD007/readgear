import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:nirog_street/app/core/constants/image_constants.dart';
import 'package:nirog_street/app/core/constants/value_constants.dart';

class CustomNetworkImageView extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double? dBorderRadius;
  final ImageShapes shape;
  final VoidCallback clickAction;
  final Widget? errorWidget;
  const CustomNetworkImageView(
      {Key? key,
      required this.imagePath,
      this.height,
      this.width,
      this.shape = ImageShapes.Standard, // Default
      this.dBorderRadius,
      this.clickAction = _defaultFunction,
      this.fit = BoxFit.contain,
      this.errorWidget})
      : super(key: key);

  factory CustomNetworkImageView.square(
      {required String imagePath,
      double? height,
      double? width,
      BoxFit? fit,
      VoidCallback clickAction = _defaultFunction}) {
    return CustomNetworkImageView(
        imagePath: imagePath,
        shape: ImageShapes.Square,
        dBorderRadius: 0,
        fit: fit,
        clickAction: clickAction);
  }

  factory CustomNetworkImageView.circle(
      {required String imagePath,
      double? height,
      double? width,
      BoxFit? fit,
      VoidCallback clickAction = _defaultFunction}) {
    return CustomNetworkImageView(
        imagePath: imagePath,
        shape: ImageShapes.Standard,
        dBorderRadius: 0,
        fit: fit,
        clickAction: clickAction);
  }

  static _defaultFunction() {
    // Does nothing
  }
  @override
  Widget build(BuildContext context) {
    print(imagePath);
    return ClipRRect(
      borderRadius: BorderRadius.circular(
          dBorderRadius ?? VALUE_AVATAR_ICON_CORNER_RADIUS),
      child: CachedNetworkImage(
        imageUrl: imagePath,
        height: height,
        width: width,
        fit: fit,
        placeholder: (context, url) =>
            Container(child: const CircularProgressIndicator()),
        errorWidget: (context, _, s) =>
            errorWidget ?? Image.asset(NIROG_STREET_LOGO),
      ),
    );
  }
}
