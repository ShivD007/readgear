import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/app/core/constants/image_constants.dart';
import '/app/core/constants/value_constants.dart';

class AvatarIcon extends StatelessWidget {
  final AvartarShapes shape;
  final String strPicInfo;
  final double? dBorderRadius;
  final double? dCircleRadius;
  final VoidCallback clickAction;
  final Color borderColor;
  final Color? backGroundColor;
  bool? isAssetImage = false;

  AvatarIcon(
      {Key? key,
      this.shape = AvartarShapes.Standard, // Default
      required this.strPicInfo,
      this.dBorderRadius = 0,
      this.dCircleRadius = 0,
      this.clickAction = _defaultFunction,
      this.borderColor = Colors.white,
      this.backGroundColor = Colors.transparent,
      this.isAssetImage = false})
      : super(key: key);

  static _defaultFunction() {
    // Does nothing
  }

  factory AvatarIcon.circular({
    required String strPicInfo,
    double? dCircleRadius,
    bool? isAssetImage = false,
    Color? borderColor = Colors.white,
    Color? backGroundColor,
    VoidCallback clickAction = _defaultFunction,
  }) {
    return AvatarIcon(
        dCircleRadius: dCircleRadius ?? 20,
        strPicInfo: strPicInfo,
        isAssetImage: isAssetImage,
        shape: AvartarShapes.Circular,
        backGroundColor: backGroundColor,
        borderColor: borderColor!,
        clickAction: clickAction);
  }

  factory AvatarIcon.square(
      {required String strPicInfo,
      bool? isAssetImage,
      VoidCallback clickAction = _defaultFunction}) {
    return AvatarIcon(
        strPicInfo: strPicInfo,
        shape: AvartarShapes.Square,
        dBorderRadius: 0,
        isAssetImage: isAssetImage,
        clickAction: clickAction);
  }

  factory AvatarIcon.profile(
      {required String strPicInfo,
      Color backGroundColor = Colors.transparent,
      VoidCallback clickAction = _defaultFunction}) {
    return AvatarIcon(
        strPicInfo: strPicInfo,
        shape: AvartarShapes.Profile,
        clickAction: clickAction,
        backGroundColor: backGroundColor);
  }

  factory AvatarIcon.file(
      {required String strPath,
      VoidCallback clickAction = _defaultFunction,
      double? dBorderRadius = 0,
      Color? borderColor}) {
    return AvatarIcon(
        dBorderRadius: dBorderRadius,
        strPicInfo: strPath,
        borderColor: borderColor ?? Colors.white,
        shape: AvartarShapes.File,
        clickAction: clickAction);
  }

  @override
  Widget build(BuildContext context) {
    if (shape == AvartarShapes.Standard || shape == AvartarShapes.Square) {
      return createAvatarIconForStandardOrSquareView();
    } else if (shape == AvartarShapes.File) {
      return createAvatarIconForFile();
    }

    return Container(
        color: Colors.transparent,
        child: shape == AvartarShapes.Profile
            ? createAvatarIconForProfileView()
            : createAvatarIconForCircularView());
  }

  Widget createAvatarIconForFile() {
    return InkWell(
      onTap: clickAction,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: strPicInfo.isNotEmpty ? borderColor : Colors.transparent,
            ),
            color: backGroundColor,
            borderRadius: BorderRadius.circular(dBorderRadius ?? 0.0),
            image: DecorationImage(
                image: Image.file(File(strPicInfo)).image, fit: BoxFit.fill)),
      ),
    );
  }

  Widget createAvatarIconForStandardOrSquareView() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(dBorderRadius!),
      child: isAssetImage!
          ? Image.asset(strPicInfo, fit: BoxFit.fill)
          : CachedNetworkImage(
              imageUrl: strPicInfo,
              fit: BoxFit.fill,
              placeholder: (context, url) => Container(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }

  Widget createAvatarIconForProfileView() {
    return InkWell(
      onTap: clickAction,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backGroundColor,
          border: Border.all(
            color: strPicInfo.isNotEmpty ? borderColor : Colors.transparent,
          ),
        ),
        child: Center(
          child: Text(
            strPicInfo,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 44,
                fontStyle: FontStyle.normal),
          ),
        ),
      ),
    );
  }

  Widget createAvatarIconForCircularView() {
    return strPicInfo.isNotEmpty
        ? InkWell(
            onTap: () => clickAction,
            child: CircleAvatar(
                radius: dCircleRadius,
                backgroundColor: backGroundColor,
                backgroundImage: isAssetImage!
                    ? AssetImage(strPicInfo) as ImageProvider
                    : CachedNetworkImageProvider(strPicInfo)),
          )
        : CircleAvatar(
            radius: dCircleRadius,
            backgroundColor: backGroundColor,
            child: Center(
              child: SizedBox(
                height: dCircleRadius,
                width: dCircleRadius,
                child: Image.asset(
                  DEFAULT_PROFILE,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
  }
}
