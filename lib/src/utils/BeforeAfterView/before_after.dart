import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'clipper.dart';
import 'slider_thumb.dart';

class BeforeAfter extends StatefulWidget {
  final Widget beforeImage;
  final Widget afterImage;
  final double imageHeight;
  final double imageWidth;
  final double imageCornerRadius;
  final Color thumbColor;
  final double thumbRadius;
  final Color overlayColor;
  final bool isVertical;
  final ValueChanged<bool> onSlideOpenAfterImage;

  const BeforeAfter({
    Key key,
    @required this.beforeImage,
    @required this.afterImage,
    this.imageHeight,
    this.imageWidth,
    this.imageCornerRadius = 7.0,
    this.thumbColor = Colors.white,
    this.thumbRadius = 27.0,
    this.overlayColor,
    this.isVertical = false,
    this.onSlideOpenAfterImage,
  })  : assert(beforeImage != null),
        assert(afterImage != null),
        super(key: key);
  @override
  _BeforeAfterState createState() => _BeforeAfterState();
}

class _BeforeAfterState extends State<BeforeAfter> {
  double _clipFactor = 0.5;
  bool isTap = false;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        SizedImage(
          widget.afterImage,
          widget.imageHeight,
          widget.imageWidth,
          widget.imageCornerRadius,
        ),
        ClipPath(
          clipper: widget.isVertical
              ? RectClipperVertical(_clipFactor)
              : RectClipper(_clipFactor),
          child: SizedImage(
            widget.beforeImage,
            widget.imageHeight,
            widget.imageWidth,
            widget.imageCornerRadius,
          ),
        ),
        Positioned.fill(
          left: 0,
          right: 0,
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: 0.0,
              overlayColor: widget.overlayColor,
              thumbShape: CustomSlider(widget.thumbRadius, widget.thumbColor),
            ),
            child: widget.isVertical
                ? RotatedBox(
                    quarterTurns: 5,
                    child: Slider(
                      value: _clipFactor,
                      onChanged: (double factor) {
                        widget.onSlideOpenAfterImage(
                            factor <= 0.7 ? false : true);
                        setState(() => this._clipFactor = factor);
                      },
                    ),
                  )
                : Slider(
                    value: _clipFactor,
                    onChanged: (double factor) {
                      i++;
                      if(i==1){
                        isTap = true;
                      }else{
                        isTap = false;
                      }
                      setState(() => this._clipFactor = factor);
                    },
                   onChangeEnd: (double factor) {
                      new Future.delayed(Duration(microseconds: 200), () {
                        widget.onSlideOpenAfterImage(isTap);
                        i=0;
                      });
              },
            ),
          ),
        ),
      ],
    );
  }
}

class SizedImage extends StatelessWidget {
  final Widget _image;
  final double _height, _width, _imageCornerRadius;

  const SizedImage(
      this._image, this._height, this._width, this._imageCornerRadius,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      //borderRadius: BorderRadius.circular(_imageCornerRadius),
      child: SizedBox(
        height: _height,
        width: _width,
        child: _image,
      ),
    );
  }
}
