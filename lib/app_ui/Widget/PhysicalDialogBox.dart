import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../constant/dropdownList.dart';

class PhysicaldialogBix extends StatefulWidget {
  const PhysicaldialogBix({Key? key}) : super(key: key);

  @override
  State<PhysicaldialogBix> createState() => _PhysicaldialogBixState();
}

class _PhysicaldialogBixState extends State<PhysicaldialogBix> {
  String? figures;
  String? ethnicitys;
  String? haircolors;
  String? eyecolors;
  String? smokers;
  @override
  Widget build(BuildContext context) {
    var size = Sizess();
    return SizedBox(
      height: size.height(context) * .5,
      width: size.width(context),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: size.width(context),
              // padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const TextField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Height',
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
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                buttonElevation: 0,
                hint: const Text(
                  "Figure",
                  style: TextStyle(
                      color: Color(0xFFB7798B),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: inter),
                ),
                iconDisabledColor: Colors.red,
                items: figure
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
                value: figures,
                onChanged: (String? value) {
                  setState(() {
                    figures = value;
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
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                buttonElevation: 0,
                hint: const Text(
                  "Ethnicity",
                  style: TextStyle(
                      color: Color(0xFFB7798B),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: inter),
                ),
                iconDisabledColor: Colors.red,
                items: ethnicity
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
                value: ethnicitys,
                onChanged: (String? value) {
                  setState(() {
                    ethnicitys = value;
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
              height: size.height(context) * .01,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                buttonElevation: 0,
                hint: const Text(
                  "Hair color",
                  style: TextStyle(
                      color: Color(0xFFB7798B),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: inter),
                ),
                iconDisabledColor: Colors.red,
                items: haircolor
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
                value: haircolors,
                onChanged: (String? value) {
                  setState(() {
                    haircolors = value;
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
              height: size.height(context) * .01,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                buttonElevation: 0,
                hint: const Text(
                  "Eye color",
                  style: TextStyle(
                      color: Color(0xFFB7798B),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: inter),
                ),
                iconDisabledColor: Colors.red,
                items: eyecolor
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
                value: eyecolors,
                onChanged: (String? value) {
                  setState(() {
                    eyecolors = value;
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
              height: size.height(context) * .01,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                buttonElevation: 0,
                hint: const Text(
                  "Smoker",
                  style: TextStyle(
                      color: Color(0xFFB7798B),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: inter),
                ),
                iconDisabledColor: Colors.red,
                items: smoker
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
                value: smokers,
                onChanged: (String? value) {
                  setState(() {
                    smokers = value;
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
              height: size.height(context) * .02,
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
          ],
        ),
      ),
    );
  }
}
