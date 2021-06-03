//library international_phone_input;

import 'dart:async';
import 'dart:convert';
import 'package:me_talk/src/res/colors.dart';
import 'country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'phone_service.dart';

class InternationalPhoneInput extends StatefulWidget {
  final void Function(String phoneNumber, String internationalizedPhoneNumber,
      String isoCode) onPhoneNumberChange;
  final String initialPhoneNumber;
  final String initialSelection;
  final String errorText;
  final String hintText;
  final TextStyle errorStyle;
  final TextStyle hintStyle;
  final int errorMaxLines;

  InternationalPhoneInput(
      {this.onPhoneNumberChange,
      this.initialPhoneNumber,
      this.initialSelection,
      this.errorText,
      this.hintText,
      this.errorStyle,
      this.hintStyle,
      this.errorMaxLines});

  static Future<String> internationalizeNumber(String number, String iso) {
    return PhoneService.getNormalizedPhoneNumber(number, iso);
  }

  @override
  _InternationalPhoneInputState createState() =>
      _InternationalPhoneInputState();
}

class _InternationalPhoneInputState extends State<InternationalPhoneInput> {
  Country selectedItem;
  List<Country> itemList = [];

  String errorText;
  String hintText;

  TextStyle errorStyle;
  TextStyle hintStyle;

  int errorMaxLines;

  bool hasError = false;

  _InternationalPhoneInputState();

  final phoneTextController = TextEditingController();

  @override
  void initState() {
    errorText = widget.errorText ?? 'Please enter a valid phone number';
    hintText = widget.hintText ?? 'eg. 244056345';
    errorStyle = widget.errorStyle;
    hintStyle = widget.hintStyle;
    errorMaxLines = widget.errorMaxLines;

    //phoneTextController.addListener(_validatePhoneNumber);
    phoneTextController.text = widget.initialPhoneNumber;

    _fetchCountryData().then((list) {
      Country preSelectedItem;

      if (widget.initialSelection != null) {
        preSelectedItem = list.firstWhere(
            (e) =>
                (e.code.toUpperCase() ==
                    widget.initialSelection.toUpperCase()) ||
                (e.dialCode == widget.initialSelection.toString()),
            orElse: () => list[0]);
      } else {
        preSelectedItem = list[0];
      }

      setState(() {
        itemList = list;
        selectedItem = preSelectedItem;
      });
    });

    super.initState();
  }

  _validatePhoneNumber() {
    String phoneText = phoneTextController.text;
    if (phoneText != null && phoneText.isNotEmpty) {
      PhoneService.parsePhoneNumber(phoneText, selectedItem.code)
          .then((isValid) {
        setState(() {
          hasError = !isValid;
        });

        if (widget.onPhoneNumberChange != null) {
          if (isValid) {
            PhoneService.getNormalizedPhoneNumber(phoneText, selectedItem.code)
                .then((number) {
              widget.onPhoneNumberChange(phoneText, number, selectedItem.code);
            });
          } else {
            widget.onPhoneNumberChange('', '', selectedItem.code);
          }
        }
      });
    }
  }

  Future<List<Country>> _fetchCountryData() async {
    var list = await DefaultAssetBundle.of(context)
        .loadString('assets/countries.json');
    var jsonList = json.decode(list);
    List<Country> elements = [];
    jsonList.forEach((s) {
      Map elem = Map.from(s);
      elements.add(Country(
          name: elem['en_short_name'],
          code: elem['alpha_2_code'],
          dialCode: elem['dial_code'],
          flagUri: 'assets/flags/${elem['alpha_2_code'].toLowerCase()}.png'));
    });
    return elements;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        DropdownButtonHideUnderline(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              color: ColorsHelper.whiteColor(),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.18),
                    blurRadius: 30,
                    offset: Offset(0, 3)),
              ],
            ),
            width:68,
            child: DropdownButton<Country>(
              value: selectedItem,
              onChanged: (Country newValue) {
                setState(() {
                  selectedItem = newValue;
                });
                _validatePhoneNumber();
              },
              iconSize: 0,
              items: itemList.map<DropdownMenuItem<Country>>((Country value) {
                return DropdownMenuItem<Country>(
                  value: value,
                  child: Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset(
                          value.flagUri,
                          width: 20.0,
                          package: 'international_phone_input',
                        ),
                        SizedBox(width: 2),
                        Text(
                            value.dialCode,
                            style: TextStyle(
                                fontSize: 13),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
            child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(19.0)),
            color: ColorsHelper.whiteColor(),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.18),
                  blurRadius: 30,
                  offset: Offset(0, 3)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15,bottom: 6),
            child: TextField(
              keyboardType: TextInputType.phone,
              controller: phoneTextController,
              style: TextStyle(color: ColorsHelper.txtEditText(), fontSize: 15.0),
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 0.5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 0.5),
                ),
                //hintText: hintText,
                errorText: hasError ? errorText : null,
                //hintStyle: TextStyle(fontSize: 20, color:  Color(0xffC5C5C5)),
                errorStyle: errorStyle ?? null,
                errorMaxLines: errorMaxLines ?? 3,
              ),
            ),
          ),
        ))
      ],
    );
  }
}
