import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nirog_street/app/atoms/custom_input.dart';
import 'package:nirog_street/app/atoms/text_extension.dart';
import 'package:nirog_street/app/core/app_colors.dart';
import 'package:nirog_street/app/core/models/list_item_model.dart';
import '../core/constants/value_constants.dart';
import 'dart:ui' as ui;

class CustomDropdown<T> extends StatefulWidget {
  /// the child widget for the button, this will be ignored if text is supplied
  final String hint;
  final String? initialValue;

  /// onChange is called when the selected option is changed.;
  /// It will pass back the value and the index of the option.
  final void Function(String, int) onChange;

  /// list of DropdownItems
  // final List<DropdownItem<T>> items;
  final DropdownStyle dropdownStyle;

  /// dropdownButtonStyles passes styles to OutlineButton.styleFrom()
  final DropdownButtonStyle dropdownButtonStyle;
  final List<ListItemModel> itemList;

  /// dropdown button icon defaults to caret
  final bool hideIcon;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;

  /// if true the dropdown icon will as a leading icon, default to false
  final bool leadingIcon;
  const CustomDropdown(
      {Key? key,
      this.hideIcon = false,
      required this.hint,
      // required this.items,
      required this.itemList,
      this.dropdownStyle = const DropdownStyle(),
      this.dropdownButtonStyle = const DropdownButtonStyle(),
      this.leadingIcon = false,
      required this.onChange,
      this.initialValue,
      this.validator,
      this.autovalidateMode})
      : super(key: key);

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>>
    with TickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  late OverlayEntry _overlayEntry;
  bool _isOpen = false;
  late int _currentIndex;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  late Animation<double> _rotateAnimation;
  late TextEditingController _textController;
  late bool showOnTop;
  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.initialValue);
    _currentIndex = widget.itemList.indexWhere((element) =>
        element.title.toLowerCase().trim() ==
        widget.initialValue?.toLowerCase().trim());
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _rotateAnimation = Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    showOnTop = false;
  }

  @override
  void didUpdateWidget(covariant CustomDropdown<T> oldWidget) {
    if (oldWidget.initialValue != widget.initialValue) {
      setState(() {
        _textController = TextEditingController(text: widget.initialValue);
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // link the overlay to the button
    return CompositedTransformTarget(
      link: _layerLink,
      child: Listener(
        onPointerDown: (PointerDownEvent details) {
          setState(() {
            showOnTop = details.position.dy >
                (ui.window.physicalSize.height / ui.window.devicePixelRatio) /
                    2;
          });
        },
        child: GestureDetector(
          onTap: () => _toggleDropdown,
          child: CustomInput(
            controller: _textController,
            onTapAction: _toggleDropdown,
            isReadOnly: true,
            isdense: true,
            validator: widget.validator,
            autovalidateMode: widget.autovalidateMode,
            horizontalPadding: 12.w,
            suffixIcon: (!widget.hideIcon)
                ? RotationTransition(
                    turns: _rotateAnimation,
                    child: const Icon(
                      FontAwesomeIcons.chevronDown,
                      size: 15,
                      color: AppColors.COLOR_GREY_400,
                    ),
                  )
                : Container(),
            placeholder: widget.hint,
          ),
        ),
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    // find the size and position of the current widget
    final renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var dropdownStyle = DropdownStyle(
      borderRadius: BorderRadius.circular(VALUE_INPUT_BORDER_RADIUS),
      elevation: 6,
    );

    var offset = renderBox.localToGlobal(Offset.zero);
    var topOffset = offset.dy + size.height;
    return OverlayEntry(
      // full screen GestureDetector to register when a
      // user has clicked away from the dropdown
      builder: (context) => GestureDetector(
        onTap: () => _toggleDropdown(close: true),
        behavior: HitTestBehavior.translucent,
        // full screen container to register taps anywhere and close drop down
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                left: offset.dx,
                top: topOffset,
                width: dropdownStyle.width ?? size.width,
                child: CompositedTransformFollower(
                  followerAnchor:
                      showOnTop ? Alignment.bottomLeft : Alignment.topLeft,
                  offset: dropdownStyle.offset ??
                      Offset(0, showOnTop ? -5 : size.height - 2),
                  link: _layerLink,
                  showWhenUnlinked: false,
                  child: Material(
                    // clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: dropdownStyle.elevation ?? 0,
                    borderRadius:
                        dropdownStyle.borderRadius ?? BorderRadius.zero,
                    color: dropdownStyle.color,
                    child: SizeTransition(
                      axisAlignment: 1,
                      sizeFactor: _expandAnimation,
                      child: ConstrainedBox(
                        constraints: dropdownStyle.constraints ??
                            BoxConstraints(
                              maxHeight: showOnTop
                                  ? topOffset -
                                      size.height -
                                      10 -
                                      MediaQuery.of(context).padding.top
                                  : MediaQuery.of(context).size.height -
                                      topOffset -
                                      15,
                            ),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: AppColors.COLOR_GREY_500),
                            borderRadius: BorderRadius.circular(
                                VALUE_INPUT_BORDER_RADIUS),
                            color: AppColors.COLOR_WHITE,
                          ),
                          child: ListView(
                            padding:
                                EdgeInsets.fromLTRB(0.0, 8.0.w, 0.0, 8.0.w),
                            shrinkWrap: true,
                            children:
                                widget.itemList.asMap().entries.map((item) {
                              return InkWell(
                                hoverColor: AppColors.COLOR_GREY_100,
                                onTap: () {
                                  _textController.text = item.value.title;
                                  setState(() => _currentIndex = item.key);
                                  widget.onChange(item.value.title, item.key);
                                  _toggleDropdown();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: _currentIndex == item.key
                                        ? AppColors.COLOR_GREY_100
                                        : null,
                                  ),
                                  padding: EdgeInsets.all(12.0.w),
                                  child: item.value.title.lato14(
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleDropdown({bool close = false}) async {
    if (_isOpen || close) {
      await _animationController.reverse();
      _overlayEntry.remove();
      setState(() {
        _isOpen = false;
      });
    } else {
      FocusScope.of(context).unfocus();
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context)!.insert(_overlayEntry);
      setState(() => _isOpen = true);
      _animationController.forward();
    }
  }
}

class DropdownButtonStyle {
  final MainAxisAlignment? mainAxisAlignment;
  final ShapeBorder? shape;
  final double? elevation;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;
  final double? width;
  final double? height;
  final Color? primaryColor;
  const DropdownButtonStyle({
    this.mainAxisAlignment,
    this.backgroundColor,
    this.primaryColor,
    this.constraints,
    this.height,
    this.width,
    this.elevation,
    this.padding,
    this.shape,
  });
}

class DropdownStyle {
  final BorderRadius? borderRadius;
  final double? elevation;
  final Color? color;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;

  /// position of the top left of the dropdown relative to the top left of the button
  final Offset? offset;

  ///button width must be set for this to take effect
  final double? width;

  const DropdownStyle({
    this.constraints,
    this.offset,
    this.width,
    this.elevation,
    this.color,
    this.padding,
    this.borderRadius,
  });
}
