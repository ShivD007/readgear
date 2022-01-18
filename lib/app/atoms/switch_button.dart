import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  late final double width;
  late final double height;
  final double loginAlign;
  final double signInAlign;
  late final Color selectedColor;
  late final Color normalColor;
  late final Color firstTextColor;
  late final Color secondTextColor;
  final String firstTextController;
  final String secondTextController;

  SwitchButton({
    required this.width,
    required this.height,
    required this.selectedColor,
    required this.normalColor,
    required this.firstTextColor,
    required this.secondTextColor,
    this.loginAlign = -0.9,
    this.signInAlign = 1,
    required this.firstTextController,
    required this.secondTextController,
  });

  @override
  SwitchButtonState createState() => SwitchButtonState();
}

class SwitchButtonState extends State<SwitchButton> {
  late final double width;
  late final double height;
  final double loginAlign = -0.9;
  final double signInAlign = 1;
  late final Color selectedColor;
  late final Color normalColor;
  late double xAlign;
  late Color firstTextColor;
  late Color secondTextColor;
  late String firstTextController;
  late String secondTextController;
  late bool isFirstTextTrue = false;
  late bool isSecondTextTrue = false;

  @override
  void initState() {
    super.initState();
    xAlign = widget.loginAlign;
    firstTextColor = widget.selectedColor;
    secondTextColor = widget.normalColor;

    width = widget.width;
    height = widget.height;
    firstTextColor = widget.firstTextColor;
    secondTextColor = widget.secondTextColor;
    selectedColor = widget.selectedColor;
    normalColor = widget.normalColor;
    firstTextColor = widget.firstTextColor;
    secondTextColor = widget.secondTextColor;
    firstTextController = widget.firstTextController;
    secondTextController = widget.secondTextController;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: normalColor,
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: Alignment(xAlign, 0),
              duration: Duration(milliseconds: 300),
              child: Container(
                width: width * 0.3,
                height: width * 0.3,
                decoration: BoxDecoration(
                  color: selectedColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isFirstTextTrue = false;
                  isSecondTextTrue = true;

                  xAlign = loginAlign;
                  firstTextColor = selectedColor;

                  secondTextColor = normalColor;
                  secondTextController = secondTextController;
                });
              },
              child: Align(
                alignment: Alignment(-1, 0),
                child: Container(
                  width: width * 0.5,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: isFirstTextTrue
                      ? Text(
                          firstTextController,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          "",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isFirstTextTrue = true;
                  isSecondTextTrue = false;
                  xAlign = signInAlign - 0.1;
                  secondTextColor = selectedColor;

                  firstTextColor = normalColor;
                  firstTextController = firstTextController;
                });
              },
              child: Align(
                alignment: Alignment(1, 0),
                child: Container(
                    width: width * 0.5,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: isFirstTextTrue
                        ? Text(
                            "",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            secondTextController,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
