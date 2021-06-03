import 'package:flutter/material.dart';
import 'package:me_talk/src/res/colors.dart';

class ButtonColor extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final Function onPressed;
  final Color color;
  final double radius;
  final double blurRadius;

  const ButtonColor(
      {Key key,
      @required this.child,
      this.width = double.infinity,
      this.height = 50.0,
      this.onPressed,
      this.color,
      this.radius = 7.0,
      this.blurRadius = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(blurRadius==0?0:0.3),
                blurRadius: blurRadius,
                offset: Offset(0, 3)),
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.circular(radius),
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}

class ButtonBlackBroder extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final Function onPressed;
  final double radius;
  final Color broderColor;
  final double broderWidth;
  final double blurRadius;

  const ButtonBlackBroder(
      {Key key,
      @required this.child,
      this.width = double.infinity,
      this.height = 50.0,
      this.onPressed,
      this.broderColor,
      this.radius = 7.0,
      this.broderWidth = 2,
      this.blurRadius = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(
              width: broderWidth,
              color: broderColor ?? ColorsHelper.themeBlackColor()),
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: blurRadius,
            ),
          ]),
      child: Material(
        borderRadius: BorderRadius.circular(radius),
        color: ColorsHelper.whiteColor(),
        child: InkWell(
            borderRadius: BorderRadius.circular(radius),
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
