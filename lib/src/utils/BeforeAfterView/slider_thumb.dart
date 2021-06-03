import 'package:flutter/material.dart';

class CustomSlider extends SliderComponentShape {
  final double _thumbRadius;
  final Color _thumbColor;

  CustomSlider(this._thumbRadius, this._thumbColor);

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(_thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {Animation<double> activationAnimation,
      Animation<double> enableAnimation,
      bool isDiscrete,
      TextPainter labelPainter,
      RenderBox parentBox,
      SliderThemeData sliderTheme,
      TextDirection textDirection,
      double value,
      double textScaleFactor,
      Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;

    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 4.0
      ..color = _thumbColor
      ..style = PaintingStyle.fill;

    final Paint _paintArrow = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final Paint paintStroke = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 4.0
      ..color = _thumbColor
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      center,
      _thumbRadius,
      paintStroke,
    );

    var path = Path();
    //right side arrow
    path.moveTo(center.dx + 0.35, center.dy);
    path.lineTo(center.dx + 0.35, center.dy + 5);
    path.lineTo(center.dx + 0.35 + 7, center.dy);
    path.lineTo(center.dx + 0.35, center.dy - 5);
    path.close();
//left side arrow
    path.moveTo(center.dx + 0.35, center.dy);
    path.lineTo(center.dx + 0.35, center.dy + 5);
    path.lineTo(center.dx + 0.35 - 7, center.dy);
    path.lineTo(center.dx + 0.35, center.dy - 5);
    path.close();
//    path.lineTo(center.dx / 2, center.dy / 2);

    canvas.drawPath(path, _paintArrow);
    canvas.drawRect(
        Rect.fromCenter(
            center: center, width: 3.0, height: parentBox.size.height),
        paint);
  }
//
//   @override
//   void paint(PaintingContext context, Offset center,
//       {Animation<double> activationAnimation,
//       Animation<double> enableAnimation,
//       bool isDiscrete,
//       TextPainter labelPainter,
//       RenderBox parentBox,
//       SliderThemeData sliderTheme,
//       TextDirection textDirection,
//       double value}) {
//     final Canvas canvas = context.canvas;
//
//     final Paint paint = Paint()
//       ..isAntiAlias = true
//       ..strokeWidth = 4.0
//       ..color = _thumbColor
//       ..style = PaintingStyle.fill;
//
//     final Paint _paintArrow = Paint()
//       ..color = Colors.black
//       ..style = PaintingStyle.fill;
//
//     final Paint paintStroke = Paint()
//       ..isAntiAlias = true
//       ..strokeWidth = 4.0
//       ..color = _thumbColor
//       ..style = PaintingStyle.fill;
//
//     canvas.drawCircle(
//       center,
//       _thumbRadius,
//       paintStroke,
//     );
//
//     var path = Path();
//     //right side arrow
//     path.moveTo(center.dx + 0.35, center.dy);
//     path.lineTo(center.dx + 0.35, center.dy + 5);
//     path.lineTo(center.dx + 0.35 + 7, center.dy);
//     path.lineTo(center.dx + 0.35, center.dy - 5);
//     path.close();
// //left side arrow
//     path.moveTo(center.dx + 0.35, center.dy);
//     path.lineTo(center.dx + 0.35, center.dy + 5);
//     path.lineTo(center.dx + 0.35 - 7, center.dy);
//     path.lineTo(center.dx + 0.35, center.dy - 5);
//     path.close();
// //    path.lineTo(center.dx / 2, center.dy / 2);
//
//     canvas.drawPath(path, _paintArrow);
//     canvas.drawRect(
//         Rect.fromCenter(
//             center: center, width: 3.0, height: parentBox.size.height),
//         paint);
//   }
}
