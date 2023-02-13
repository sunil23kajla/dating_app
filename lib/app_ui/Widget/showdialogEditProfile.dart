import 'package:csc_picker/csc_picker.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dating/constant/constant.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constant/dropdownList.dart';

class ShowdialogEditProfile extends StatefulWidget {
  const ShowdialogEditProfile({Key? key}) : super(key: key);

  @override
  State<ShowdialogEditProfile> createState() => _ShowdialogEditProfileState();
}

class _ShowdialogEditProfileState extends State<ShowdialogEditProfile> {
  String? selectedValue;
  String? cityValues;
  String? stateValues;
  String? countryValues;
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    var size = Sizess();
    return SizedBox(
      width: size.width(context) * .7,
      height: size.height(context) * .75,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: size.width(context),
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: const TextField(
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Full Name',
                  hintStyle: TextStyle(
                      color: Color(
                        0xFFB7798B,
                      ),
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: inter),
                  fillColor: Colors.white,
                  focusColor: Colors.green,
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.5, color: Color(0xFF7A112F)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.5, color: Color(0xFF7A112F)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height(context) * .01,
            ),
            InkWell(
              child: Container(
                width: size.width(context),
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: DateTimeField(
                  // controller: dob,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xff7A112F),
                    ),
                    hintText: "D.O.B",
                    hintStyle: TextStyle(
                        color: Color(0xFFB7798B),
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        fontFamily: inter),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.5, color: Color(0xFF7A112F)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.5, color: Color(0xFF7A112F)),
                    ),
                  ),
                  format: format,
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                ),
              ),
            ),
            SizedBox(
              height: size.height(context) * .01,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                buttonElevation: 0,
                hint: const Text(
                  "Gender",
                  style: TextStyle(
                      color: Color(0xFFB7798B),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: inter),
                ),
                iconDisabledColor: Colors.red,
                items: gender
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFB7798B),
                                fontSize: 15,
                                fontFamily: inter),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xff7A112F),
                  size: 25,
                ),
                value: selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                buttonPadding: const EdgeInsets.only(right: 10, left: 2),
                buttonWidth: size.width(context) * .89,
                buttonDecoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1.5, color: Color(0xFF7A112F)))),
              ),
            ),
            SizedBox(
              height: size.height(context) * .015,
            ),
            CSCPicker(
              showStates: true,
              showCities: true,
              flagState: CountryFlag.DISABLE,
              layout: Layout.vertical,
              dropdownDecoration: const BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 1.5, color: Color(0xFF7A112F)))),
              disabledDropdownDecoration: const BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 1.5, color: Color(0xFF7A112F)))),
              countrySearchPlaceholder: "Country",
              stateSearchPlaceholder: "State",
              citySearchPlaceholder: "City",
              countryDropdownLabel: "Country",
              stateDropdownLabel: "State",
              cityDropdownLabel: "City",
              selectedItemStyle: const TextStyle(
                  color: Color(0xFFB7798B),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: inter),
              dropdownHeadingStyle: const TextStyle(
                  color: Color(0xFFB7798B),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: inter),
              dropdownItemStyle: const TextStyle(
                  color: Color(0xFFB7798B),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: inter),
              dropdownDialogRadius: 10.0,
              searchBarRadius: 10.0,
              onCountryChanged: (value) {
                setState(() {
                  countryValues = value;
                });
              },
              onStateChanged: (value) {
                setState(() {
                  stateValues = value;
                });
              },
              onCityChanged: (value) {
                setState(() {
                  cityValues = value;
                });
              },
            ),
            SizedBox(
              height: size.height(context) * .01,
            ),
            Container(
              width: size.width(context),
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: const TextField(
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Zodiac sign',
                  hintStyle: TextStyle(
                      color: Color(
                        0xFFB7798B,
                      ),
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: inter),
                  fillColor: Colors.white,
                  focusColor: Colors.green,
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.5, color: Color(0xFF7A112F)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.5, color: Color(0xFF7A112F)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height(context) * .01,
            ),
            Container(
              width: size.width(context),
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: const TextField(
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Income',
                  hintStyle: TextStyle(
                      color: Color(
                        0xFFB7798B,
                      ),
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: inter),
                  fillColor: Colors.white,
                  focusColor: Colors.green,
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.5, color: Color(0xFF7A112F)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.5, color: Color(0xFF7A112F)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height(context) * .01,
            ),
            Container(
              width: size.width(context),
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: const TextField(
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Occupation',
                  hintStyle: TextStyle(
                      color: Color(
                        0xFFB7798B,
                      ),
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: inter),
                  fillColor: Colors.white,
                  focusColor: Colors.green,
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.5, color: Color(0xFF7A112F)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.5, color: Color(0xFF7A112F)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height(context) * .01,
            ),
            Container(
              width: size.width(context),
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: const TextField(
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Marital Status',
                  hintStyle: TextStyle(
                      color: Color(
                        0xFFB7798B,
                      ),
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: inter),
                  fillColor: Colors.white,
                  focusColor: Colors.green,
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.5, color: Color(0xFF7A112F)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.5, color: Color(0xFF7A112F)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height(context) * .01,
            ),
            Container(
              width: size.width(context),
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: const TextField(
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Child(ren)',
                  hintStyle: TextStyle(
                      color: Color(
                        0xFFB7798B,
                      ),
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: inter),
                  fillColor: Colors.white,
                  focusColor: Colors.green,
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.5, color: Color(0xFF7A112F)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.5, color: Color(0xFF7A112F)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height(context) * .01,
            ),
            Container(
              width: size.width(context),
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: const TextField(
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Sexual orientation',
                  hintStyle: TextStyle(
                      color: Color(
                        0xFFB7798B,
                      ),
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      fontFamily: inter),
                  fillColor: Colors.white,
                  focusColor: Colors.green,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Color(0xFF7A112F)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.5, color: Color(0xFF7A112F)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height(context) * .015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: size.height(context) * .045,
                  width: size.width(context) * .2,
                  margin: EdgeInsets.only(bottom: size.height(context) * .002),
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 2, color: const Color(0xFF7A112F)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                          fontFamily: inter,
                          color: Color(0xFF7A112F),
                          fontWeight: FontWeight.w400,
                          fontSize: 13),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width(context) * .07,
                ),
                Container(
                  alignment: Alignment.center,
                  height: size.height(context) * .045,
                  width: size.width(context) * .2,
                  margin: EdgeInsets.only(bottom: size.height(context) * .002),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF7A112F), Color(0xFFC92564)],
                      ),
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xFFF5F5F5)),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(
                          fontFamily: inter,
                          color: Color(0xFFF5F5F5),
                          fontWeight: FontWeight.w400,
                          fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height(context) * .01,
            ),
          ],
        ),
      ),
    );
  }
}
