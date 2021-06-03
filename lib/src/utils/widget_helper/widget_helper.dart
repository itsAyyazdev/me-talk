import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:me_talk/src/res/colors.dart';
import 'package:me_talk/src/res/fonts.dart';
import 'package:me_talk/src/res/image_assets.dart';
import 'package:me_talk/src/res/strings.dart';
import 'package:me_talk/src/utils/listview_scroll_behavior/listview_scroll_behavior.dart';
import '../smooth_star_rating.dart';

class WidgetHelper {
  static progressBarShow({BuildContext context, bool isDismissible = true}) {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (_) => new WillPopScope(
          child: new SimpleDialog(
            contentPadding: EdgeInsets.all(10.0),
            shape: CircleBorder(),
            backgroundColor: ColorsHelper.themeBlackColor(),
            children: [
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
          onWillPop: () {
            return Future.value(isDismissible);
          }),
    );
  }

  static requestAlert(
      {BuildContext context,
      bool isDismissible = true,
      String str,
      bool tagImage = false,
      onCancelClick,
      onRequestClick}) {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (_) => new SimpleDialog(
        elevation: 2,
        contentPadding: EdgeInsets.all(20.0),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.black26, width: 1)),
        backgroundColor: Colors.white,
        children: [
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              tagImage
                  ? Container(
                      child: Image.asset(ImageAssets.tag_close),
                      margin: EdgeInsets.only(bottom: 30),
                    )
                  : Container(),
              Text(
                str,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.pop(context);

                      onCancelClick();
                    },
                    child: Container(
                      width: 90,
                      height: 35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: ColorsHelper.darkBlackColor(),
                      ),
                      child: Text(
                        StringHelper.str_cancel,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.pop(context);

                      onRequestClick();
                    },
                    child: Container(
                      width: 90,
                      height: 35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: ColorsHelper.darkBlackColor(),
                      ),
                      child: Text(
                        StringHelper.Request,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: FontsHelper.fonts_Nanum_Barun_Gothic),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  static showStarRatingView(
      {BuildContext context,
      double rating,
      double size,
      Color color,
      Color borderColor}) {
    color = color == null ? ColorsHelper.pinkStarFillColor() : color;
    borderColor =
        borderColor == null ? ColorsHelper.pinkStarFillColor() : borderColor;

    return SmoothStarRating(
        allowHalfRating: true,
        onRatingChanged: (v) {},
        starCount: 5,
        rating: rating ?? 5,
        size: size ?? 20.0,
        color: color,
        borderColor: borderColor,
        spacing: size < 20 ? -5 : (size <= 24 ? -7 : -10));
  }

  static setBlurEffect(
      Widget widget) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 13, sigmaY: 13),
        child: Material(
          color: Colors.white.withOpacity(0.85),
          child: widget,
        ),
      ),
    );
  }

  static customBoxDecorationShadow(
      Color bgColor,
      Color borderColor,
      Color shadowColor,
      double borderWidth,
      double radius,
      double spredRadius,
      double blurRadius,
      double x,
      double y) {
    return BoxDecoration(
      color: bgColor,
      border: Border.all(
        width: borderWidth,
        color: borderColor,
      ),
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      boxShadow: [
        BoxShadow(
            color: shadowColor,
            spreadRadius: spredRadius,
            blurRadius: blurRadius,
            offset: Offset(x, y))
      ],
    );
  }

  static customBoxDecorationWithShadow(Color bgColor, Color borderColor,
      Color shadowColor, double borderWidth, double radius) {
    return BoxDecoration(
      color: bgColor,
      border: Border.all(
        width: borderWidth,
        color: borderColor,
      ),
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      boxShadow: [
        BoxShadow(
            color: shadowColor.withOpacity(0.2),
            spreadRadius: 0.5,
            blurRadius: 6,
            offset: Offset(0, 3))
      ],
    );
  }

  static customBoxDecorationWithOutShadow(
      Color bgColor, Color borderColor, double borderWidth, double radius) {
    return BoxDecoration(
      color: bgColor,
      border: Border.all(
        width: borderWidth,
        color: borderColor,
      ),
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  static getMapFromLatLong(double lat, double long, double zoom) {
    CameraPosition cameraPosition;
    final Set<Marker> _markers = Set();

    LatLng latLong;
    latLong = LatLng(lat ?? 23.0225, long ?? 72.5714);

    cameraPosition = CameraPosition(
      target: latLong,
      zoom: zoom ?? 11,
    );
    _markers.add(
      Marker(
        markerId: MarkerId('1'),
        position: latLong,
      ),
    );
    return GoogleMap(
      initialCameraPosition: cameraPosition,
      compassEnabled: false,
      myLocationButtonEnabled: false,
      scrollGesturesEnabled: false,
      rotateGesturesEnabled: false,
      markers: _markers,
    );
  }

  static commentItem(
      {String image, String username, String comment, String commentTime}) {
    return Card(
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  width: 17,
                  height: 17,
                ),
              ),
              SizedBox(width: 10),
              Text(
                username,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 7, bottom: 7, right: 12, left: 12),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          commentTime,
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Text(
            comment,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black45),
          ),
          Divider(
            color: Colors.black26,
          )
        ],
      ),
    );
  }

  static tags({String tags}) {
    return Padding(
      padding: const EdgeInsets.only(left: 17),
      child: Visibility(
        visible: tags.isNotEmpty,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            color: ColorsHelper.themeColor(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                tags,
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static signUpTextFormField(
      {String hint,
      String validation(String val),
      String save(String val),
      TextEditingController controller,
      textInputType = TextInputType.text,
      obscureText = false}) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        maxLines: 1,
        cursorColor: Colors.white,
        obscureText: obscureText,
        style: TextStyle(color: Colors.white),
        validator: validation,
        controller: controller,
        keyboardType: textInputType,
        onSaved: save,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            errorBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white30)),
      ),
    );
  }

  static createTextFormField({
    String hint,
    String validation(String val),
    String save(String val),
    TextEditingController controller,
    textInputType = TextInputType.text,
    int maxLine = 1,
    int height = 5,
    textCapitalization = TextCapitalization.sentences,
    int maxLength = 1000,
    obscureText = false,
    TextStyle style,
    bool enabled = true,
    InputDecoration decoration,
  }) {
    style = style == null ? TextStyle(color: ColorsHelper.themeColor()) : style;
    decoration = decoration == null
        ? InputDecoration(
            hasFloatingPlaceholder: true,
            border: InputBorder.none,
            hintText: hint,
            counterText: '')
        : decoration;
    return Padding(
      padding: EdgeInsets.only(top: 0, left: 5),
      child: TextFormField(
        enabled: enabled,
        maxLength: maxLength,
        maxLines: maxLine,
        minLines: 1,
        cursorColor: ColorsHelper.themeColor(),
        obscureText: obscureText,
        style: style,
        validator: validation,
        textCapitalization: textCapitalization,
        controller: controller,
        keyboardType: textInputType,
        onSaved: save,
        decoration: decoration,
      ),
      /*  enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorsHelper.greyLight(),width: 0.5)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorsHelper.greyLight(),width: 0.5)),
            errorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey)*/
    );
  }

  static commonTextFormField(
      {String hint,
      String imageAssets,
      String validation(String val),
      TextEditingController controller,
      textInputType = TextInputType.text,
      int maxLine = 1,
      FocusNode focusNode,
      int maxLength = 100,
      obscureText = false,
      textCapitalization = TextCapitalization.sentences,
      String save(String val)}) {
    return TextFormField(
      maxLines: maxLine,
//      maxLength: maxLength,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
      ],
      controller: controller,
      keyboardType: textInputType,
      validator: validation,
      cursorColor: ColorsHelper.themeBlackColor(),
      style: TextStyle(color: ColorsHelper.txtEditText(), fontSize: 15.0),
      obscureText: obscureText,
      onSaved: save,
      focusNode: focusNode,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black12, width: 1),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsHelper.themeBlackColor()),
        ),
        //border: InputBorder.none,
        labelText: hint,
        labelStyle: TextStyle(color: ColorsHelper.txtHintEditText()),
        prefixIcon: imageAssets != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 15, right: 5, top: 15),
                child: Image.asset(
                  imageAssets,
                  width: 15,
                  height: 15,
                  color: ColorsHelper.themeBlackColor(),
                ),
              )
            : Offstage(),
      ),
    );
  }

  static commonTextFormFieldPassword(
      {String hint,
      String imageAssets,
      String validation(String val),
      TextEditingController controller,
      textInputType = TextInputType.text,
      int maxLine = 1,
      int maxLength = 100,
      obscureText = false,
      textCapitalization = TextCapitalization.none,
      String save(String val)}) {
    return TextFormField(
      maxLines: maxLine,
//      maxLength: maxLength,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
      ],
      controller: controller,
      keyboardType: textInputType,
      validator: validation,
      cursorColor: ColorsHelper.themeBlackColor(),
      style: TextStyle(color: ColorsHelper.txtEditText(), fontSize: 22.0),
      obscureText: obscureText,
      onSaved: save,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsHelper.themeBlackColor()),
        ),
        labelText: hint,
        labelStyle: TextStyle(color: ColorsHelper.txtHintEditText()),
        prefixIcon: imageAssets != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 15, right: 5, top: 15),
                child: Image.asset(
                  imageAssets,
                  width: 15,
                  height: 15,
                ),
              )
            : Offstage(),
      ),
    );
  }

  static commonTextFormFieldWithoutImage(
      {String hint,
      String validation(String val),
      TextEditingController controller,
      textInputType = TextInputType.text,
      int maxLine = 1,
      int maxLength = 1000,
      obscureText = false,
      textCapitalization = TextCapitalization.sentences,
      String save(String val)}) {
    return TextFormField(
      maxLines: maxLine,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
      ],
      controller: controller,
      keyboardType: textInputType,
      validator: validation,
      cursorColor: ColorsHelper.themeColor(),
      style: TextStyle(color: ColorsHelper.txtEditText(), fontSize: 15.0),
      obscureText: obscureText,
      onSaved: save,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 2, right: 2, top: 5, bottom: 5),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsHelper.themeColor()),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black26, width: 0.5),
        ),
        labelText: hint,
        labelStyle: TextStyle(color: ColorsHelper.txtHintEditText()),
      ),
    );
  }

  static commonTextFormFieldWithoutImageOutLineBorder(
      {String hint,
      String validation(String val),
      TextEditingController controller,
      textInputType = TextInputType.text,
      int maxLine = 1,
      int maxLength = 1000,
      obscureText = false,
      textCapitalization = TextCapitalization.sentences,
      String save(String val)}) {
    return TextFormField(
      maxLines: maxLine,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
      ],
      minLines: 1,
      controller: controller,
      keyboardType: textInputType,
      validator: validation,
      cursorColor: ColorsHelper.themeBlackColor(),
      style: TextStyle(color: ColorsHelper.txtEditText(), fontSize: 15.0),
      obscureText: obscureText,
      onSaved: save,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsHelper.themeBlackColor()),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorsHelper.themeBlackColor(), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26, width: 0.5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26, width: 0.5),
        ),
        labelText: hint,
        labelStyle: TextStyle(color: ColorsHelper.txtHintEditText()),
      ),
    );
  }

  static commonTextFormFieldNotClickable(
      {String hint,
      String validation(String val),
      TextEditingController controller,
      textInputType = TextInputType.text,
      int maxLine = 1,
      int maxLength = 1000,
      obscureText = false,
      textCapitalization = TextCapitalization.none,
      String save(String val)}) {
    return TextFormField(
      controller: new TextEditingController(text: 'Indus'),
      enableInteractiveSelection: false,
      decoration: InputDecoration(hintText: 'Industry', labelText: 'Industry'),
      focusNode: AlwaysDisabledFocusNode(),
    );
  }

  static commonPhoneNumberTextFormField(
      {String hint,
      String imageAssets,
      String validation(String val),
      TextEditingController controller,
      textInputType = TextInputType.text,
      int maxLine = 1,
      obscureText = false,
      textCapitalization = TextCapitalization.none,
      String save(String val)}) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              width: 10.0,
              height: 5.0,
//      child: const Card(child: Text('Hello World!')),
            ),
            Image.asset(
              imageAssets,
              width: 22,
              height: 22,
            ),
            Text(
              ' +1 ',
              style: TextStyle(fontSize: 20.0),
            ),
            Expanded(
              child: TextFormField(
                maxLines: maxLine,
                controller: controller,
                keyboardType: textInputType,
                validator: validation,
                cursorColor: ColorsHelper.themeColor(),
                style: TextStyle(
                    color: ColorsHelper.txtEditText(), fontSize: 15.0),
                obscureText: obscureText,
                onSaved: save,
                textCapitalization: textCapitalization,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  /*focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorsHelper.themeColor()),
                  ),*/
                  labelText: hint,
                  labelStyle: TextStyle(color: ColorsHelper.txtHintEditText()),
                  /*prefixIcon: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, right: 5, top: 15),
                    child: Image.asset(
                      imageAssets,
                      width: 15,
                      height: 15,
                    ),
                  ),*/
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 1,
          color: Colors.black,
        ),
      ],
    );
  }

  static beforeAfterView(
      {String img1,
      String img2,
      double width,
      double height,
      bool isSmallView}) {
    return Stack(
      children: <Widget>[
        Image.asset(
          img1,
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
        ScrollConfiguration(
          behavior: ListViewScrollBehavior(),
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: width - 21,
                    height: height,
                    color: Colors.transparent,
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      width: 1,
                      height: height,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    right: -20,
                    width: 40,
                    child: Container(
                      height: height,
                      alignment: Alignment.center,
                      child: Image.asset(
                        ImageAssets.left_right_arrow,
                        width: isSmallView != null ? 27 : 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Image.asset(
                    img2,
                    width: width - 21,
                    height: height,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 0,
                    child: Container(
                      width: 1,
                      height: height,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    left: -20,
                    width: 40,
                    child: Container(
                      height: height,
                      alignment: Alignment.center,
                      child: Image.asset(
                        ImageAssets.left_right_arrow,
                        width: isSmallView != null ? 27 : 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }

  // static EventListView() {
  //   return Row(
  //     children: <Widget>[
  //       ClipRRect(
  //         borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
  //         child: Image.asset(
  //           ImageAssets.bg1,
  //           fit: BoxFit.cover,
  //           width: 100,
  //           height: 100,
  //         ),
  //       ),
  //       Padding(
  //         padding: const EdgeInsets.only(left: 10.0),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             SizedBox(
  //               height: 3,
  //             ),
  //             Text(
  //               'Location, Hostiptal Name',
  //               textAlign: TextAlign.left,
  //               overflow: TextOverflow.ellipsis,
  //               maxLines: 1,
  //               style: TextStyle(color: Colors.black87, fontSize: 11.0),
  //             ),
  //             SizedBox(
  //               height: 3,
  //             ),
  //             Text(
  //               'Rear Great breast (title)',
  //               textAlign: TextAlign.left,
  //               maxLines: 1,
  //               overflow: TextOverflow.ellipsis,
  //               style: TextStyle(color: Colors.black, fontSize: 13.0),
  //             ),
  //             SizedBox(
  //               height: 2,
  //             ),
  //             Text(
  //               'Will be ok aftre option (subtitle)',
  //               textAlign: TextAlign.left,
  //               overflow: TextOverflow.ellipsis,
  //               maxLines: 1,
  //               style: TextStyle(color: Colors.black, fontSize: 10.0),
  //             ),
  //             SizedBox(
  //               height: 4,
  //             ),
  //             WidgetHelper.showStarRatingView(
  //                 rating: 5,
  //                 size: 15,
  //                 color: ColorsHelper.purpleColor(),
  //                 borderColor: ColorsHelper.purpleColor()),
  //             SizedBox(
  //               height: 4,
  //             ),
  //             Row(
  //               children: <Widget>[
  //                 Text(
  //                   '32%',
  //                   textAlign: TextAlign.left,
  //                   style: TextStyle(
  //                       color: ColorsHelper.blueColor(), fontSize: 12.0),
  //                 ),
  //                 SizedBox(
  //                   width: 5,
  //                 ),
  //                 Text(
  //                   '3200USD',
  //                   textAlign: TextAlign.left,
  //                   style: TextStyle(color: Colors.black, fontSize: 12.0),
  //                 ),
  //                 SizedBox(
  //                   width: 10,
  //                 ),
  //                 Text(
  //                   '5000USD',
  //                   textAlign: TextAlign.left,
  //                   style: TextStyle(color: Colors.black87, fontSize: 10.0),
  //                 ),
  //               ],
  //             )
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
