import 'package:flutter/material.dart';
import 'package:readgear/app/atoms/custom_spacers.dart';
import 'package:readgear/app/atoms/text_extension.dart';
import 'package:readgear/app/core/util_functions.dart';

class DiscountPriceWidget extends StatefulWidget {
  double price, discountedPrice, priceSize, discountedPriceSize;
  Color priceColor, discountedPriceColor;
  bool isVertical;

  DiscountPriceWidget(
      {Key? key,
      required this.isVertical,
      required this.price,
      required this.discountedPrice,
      required this.priceColor,
      required this.discountedPriceColor,
      required this.priceSize,
      required this.discountedPriceSize})
      : super(key: key);

  @override
  _DiscountPriceWidgetState createState() => _DiscountPriceWidgetState();
}

class _DiscountPriceWidgetState extends State<DiscountPriceWidget> {
  @override
  Widget build(BuildContext context) => widget.isVertical
      ? _buildVerticalPriceWidget()
      : _buildHorizontalPriceWidget();

  Column _buildVerticalPriceWidget() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getDiscountedWidget(),
          getPriceWidget(),
        ],
      );

  Row _buildHorizontalPriceWidget() => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          getDiscountedWidget(),
          CustomSpacers.width16,
          getPriceWidget(),
        ],
      );

  Text getDiscountedWidget() =>
      getAmountString(widget.discountedPrice).toString().openSansGeneralStyle(
          textColor: widget.priceColor,
          fontSize: widget.priceSize,
          fontWeight: FontWeight.w700);

  Text getPriceWidget() =>
      getAmountString(widget.price).toString().openSansGeneralStyle(
          textColor: widget.discountedPriceColor,
          fontSize: widget.discountedPriceSize,
          decoration: TextDecoration.lineThrough);
}
