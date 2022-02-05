import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readgear/app/atoms/avatar_icon.dart';
import 'package:readgear/app/atoms/custom_bottom_sheet.dart';
import 'package:readgear/app/atoms/custom_spacers.dart';
import 'package:readgear/app/atoms/text_extension.dart';
import 'package:readgear/app/core/app_colors.dart';
import 'package:readgear/app/core/constants/string_constants.dart';
import 'package:readgear/app/core/constants/style_constants.dart';
import 'package:readgear/app/core/constants/value_constants.dart';
import 'package:readgear/app/core/util_functions.dart';
import 'package:readgear/app/routes/custom_navigator.dart';
import 'package:path/path.dart';
import 'Images/custom_asset_image.dart';
import 'package:get/get.dart';

class UploadField extends StatefulWidget {
  final ValueChanged<String?> onUploadCallback;
  final ValueChanged<String?> onRemoveCallBack;

  final String? documentHint;
  final String? validation;
  String? initialDocImage;

  final double? trailingIconHeight;
  final double? trailingIconWidth;
  final double? leadingImageHeight;
  final double? leadingImageWidth;

  UploadField(
      {Key? key,
      required this.onRemoveCallBack,
      required this.onUploadCallback,
      this.initialDocImage,
      this.documentHint = "",
      this.trailingIconHeight,
      this.trailingIconWidth,
      this.leadingImageHeight,
      this.leadingImageWidth,
      this.validation,
      docImage})
      : super(key: key);

  @override
  State<UploadField> createState() => _UploadFieldState();
}

class _UploadFieldState extends State<UploadField> {
  late ValueNotifier<bool> isUploadIcon;
  late ValueNotifier<String?> documentImage;
  @override
  void initState() {
    isUploadIcon = ValueNotifier(true);
    documentImage = ValueNotifier(null);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant UploadField oldWidget) {
    if (oldWidget.initialDocImage != widget.initialDocImage) {
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    bool _isNetworkImage =
        ["https", "http"].contains(widget.initialDocImage?.split(":").first);
    return ValueListenableBuilder(
        valueListenable: isUploadIcon,
        builder: (BuildContext context, bool isUploadIconValue, _) {
          final _verticalPadding = !isUploadIconValue ? 8.h : 12.h;

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: 8.w,
                    right: 8.w,
                    top: _verticalPadding,
                    bottom: _verticalPadding),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.5,
                      color: widget.validation != null
                          ? AppColors.COLOR_RED
                          : AppColors.COLOR_GREY_300),
                  color: AppColors.COLOR_WHITE,
                  borderRadius:
                      BorderRadius.circular(VALUE_INPUT_BORDER_RADIUS),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ValueListenableBuilder(
                              valueListenable: documentImage,
                              builder:
                                  (context, String? documentImageValue, _) {
                                return documentImageValue != null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: widget.leadingImageHeight ??
                                                48.h,
                                            width: widget.leadingImageWidth ??
                                                48.h,
                                            child: widget.initialDocImage !=
                                                        null &&
                                                    documentImage.value == null
                                                ? AvatarIcon(
                                                    isAssetImage: false,
                                                    dBorderRadius:
                                                        VALUE_INPUT_BORDER_RADIUS,
                                                    strPicInfo:
                                                        widget.initialDocImage!)
                                                : ![
                                                    ".png",
                                                    ".jpg",
                                                    ".jpeg",
                                                    ".svg"
                                                  ].contains(extension(
                                                        documentImage.value!))
                                                    ? AvatarIcon(
                                                        dBorderRadius:
                                                            VALUE_INPUT_BORDER_RADIUS,
                                                        isAssetImage: true,
                                                        strPicInfo:
                                                            "assets/images/pdf.png",
                                                      )
                                                    : AvatarIcon.file(
                                                        dBorderRadius:
                                                            VALUE_INPUT_BORDER_RADIUS,
                                                        strPath: documentImage
                                                            .value!,
                                                      ),
                                          ),
                                          CustomSpacers.width8,
                                        ],
                                      )
                                    : _isNetworkImage &&
                                            widget.initialDocImage != null
                                        ? SizedBox(
                                            height: widget.leadingImageHeight ??
                                                48.h,
                                            width: widget.leadingImageWidth ??
                                                48.h,
                                            child: AvatarIcon(
                                                dBorderRadius:
                                                    VALUE_INPUT_BORDER_RADIUS,
                                                isAssetImage: false,
                                                strPicInfo:
                                                    widget.initialDocImage!),
                                          )
                                        : const SizedBox();
                              }),
                          Expanded(
                              child: Text(
                            documentImage.value?.split('/').last ??
                                (_isNetworkImage
                                    ? widget.initialDocImage
                                        ?.split("document")
                                        .last
                                    : widget.initialDocImage) ??
                                widget.documentHint!,
                            maxLines: widget.initialDocImage == null ||
                                    documentImage.value == null
                                ? 1
                                : 2,
                            overflow: TextOverflow.ellipsis,
                            style: widget.initialDocImage != null ||
                                    documentImage.value != null
                                ? Styles_Lato.latoRegularBlue500_16px
                                : Style_OpenSans.bodyRegularGrey400_16px,
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w),
                      child: GestureDetector(
                        onTap: () => _onTap(isUploadIconValue),
                        child: CustomAssetImageView(
                          height: widget.trailingIconHeight ?? 24.h,
                          width: widget.trailingIconWidth ?? 24.h,
                          imagePath: isUploadIconValue
                              ? "assets/images/Upload.png"
                              : "assets/images/Delete.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.validation != null) CustomSpacers.height8,
              if (widget.validation != null)
                widget.validation!.body16(
                    textAlign: TextAlign.start, textColor: AppColors.COLOR_RED)
            ],
          );
        });
  }

  _onTap(isUploadIconValue) {
    if (isUploadIconValue) {
      File? _file;
      Get.bottomSheet(CustomBottomSheet(
        widgets: [
          CHOOSE_UPLOAD_OPTION.body16(
              textColor: AppColors.COLOR_GREY_500,
              textAlign: TextAlign.left,
              fontWeight: FontWeight.w600),
          CustomSpacers.height24,
          GestureDetector(
            onTap: () => _onTrailingIconTap(_file, true),
            child: CAMERA.body16(
                textColor: AppColors.COLOR_GREY_900,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w600),
          ),
          CustomSpacers.height20,
          GestureDetector(
            onTap: () => _onTrailingIconTap(_file, false),
            child: DOCUMENT_WITHOUT_ASTRIK.body16(
                textColor: AppColors.COLOR_GREY_900,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w600),
          ),
          CustomSpacers.height4
        ],
      ));
    } else {
      isUploadIcon.value = true;
      widget.onRemoveCallBack(null);
      documentImage.value = null;
    }
  }

  void _onTrailingIconTap(_file, bool fromCamera) async {
    if (fromCamera) {
      _file = await pickImage(fromCamera: fromCamera);
    } else {
      print("from Document");
      _file = await pickFile();
    }
    widget.onUploadCallback(_file?.path);
    if (_file != null) {
      CustomNavigator.pop();
      isUploadIcon.value = false;
      documentImage.value = _file!.path;
      widget.initialDocImage = null;
    }
  }
}
