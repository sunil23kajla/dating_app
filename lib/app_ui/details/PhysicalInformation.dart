import 'package:dating/app_ui/details/DetailedExplanation.dart';
import 'package:dating/constant/constant.dart';
import 'package:dating/constant/dropdownList.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class PhysicalInformation extends StatefulWidget {
  const PhysicalInformation({Key? key}) : super(key: key);

  static const String routeName = '/physical-information';

  @override
  State<PhysicalInformation> createState() => _PhysicalInformationState();
}

class _PhysicalInformationState extends State<PhysicalInformation> {
  String? figures;
  String? ethnicitys;
  String? haircolors;
  String? eyecolors;
  String? smokers;
  @override
  Widget build(BuildContext context) {
    var size = Sizess();
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      appBar: AppBar(
        foregroundColor: const Color(0xFF7A112F),
        backgroundColor: const Color(0xFFf5f5f5),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(size.height(context) * 0.10),
          child: Container(
            margin: EdgeInsets.only(bottom: size.height(context) * 0.05),
            child: const Text("Physical Information",
                style: TextStyle(
                    // letterSpacing: 1.5,
                    color: Color(0xFF7A112F),
                    fontFamily: merriweather,
                    fontSize: 24,
                    fontWeight: FontWeight.w700)),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, DetailedExplanation.routeName);
              },
              child: const Text('Skip',
                  style: TextStyle(
                      color: Color(0xFF818181),
                      fontFamily: inter,
                      fontSize: 16,
                      fontWeight: FontWeight.w600))),
        ],
      ),
      body: SizedBox(
        height: size.height(context),
        width: size.width(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width(context),
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                height: size.height(context) * .04,
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
                          bottom: BorderSide(
                              width: 1.5, color: Color(0xFF7A112F)))),
                ),
              ),
              SizedBox(
                height: size.height(context) * .04,
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
                          bottom: BorderSide(
                              width: 1.5, color: Color(0xFF7A112F)))),
                ),
              ),
              SizedBox(
                height: size.height(context) * .04,
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
                          bottom: BorderSide(
                              width: 1.5, color: Color(0xFF7A112F)))),
                ),
              ),
              SizedBox(
                height: size.height(context) * .04,
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
                          bottom: BorderSide(
                              width: 1.5, color: Color(0xFF7A112F)))),
                ),
              ),
              SizedBox(
                height: size.height(context) * .04,
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
                          bottom: BorderSide(
                              width: 1.5, color: Color(0xFF7A112F)))),
                ),
              ),
              SizedBox(
                height: size.height(context) * .065,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, DetailedExplanation.routeName);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    height: size.height(context) * .055,
                    width: size.width(context) * .35,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFFE36B99),
                            Color(0xFF811634),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xFFF5F5F5)),
                    child: const Center(
                        child: Text(
                      'Next',
                      style: TextStyle(
                          fontFamily: inter,
                          color: Color(0xFFF5F5F5),
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
