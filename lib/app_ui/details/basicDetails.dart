// ignore_for_file: avoid_print

import 'package:csc_picker/csc_picker.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dating/app_ui/details/ChoosePersonality.dart';
import 'package:dating/authentication/auth_service.dart';
import 'package:dating/constant/constant.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../../constant/dropdownList.dart';

class BasicDetail extends StatefulWidget {
  const BasicDetail({Key? key}) : super(key: key);

  static const String routeName = '/basic-detail';

  @override
  State<BasicDetail> createState() => _BasicDetailState();
}

class _BasicDetailState extends State<BasicDetail> {
  String? selectedValue;
  String? cityValues = "";
  String? stateValues = "";
  String? countryValues = "";

  final format = DateFormat("yyyy-MM-dd");

  late TextEditingController _fullName;
  late TextEditingController _zodiacSign;
  late TextEditingController _income;
  late TextEditingController _occupation;
  late TextEditingController _maritalStatus;
  late TextEditingController _children;
  late TextEditingController _sexual;

  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();

    _fullName = TextEditingController();
    _zodiacSign = TextEditingController();
    _income = TextEditingController();
    _occupation = TextEditingController();
    _maritalStatus = TextEditingController();
    _children = TextEditingController();
    _sexual = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _fullName.dispose();
    _zodiacSign.dispose();
    _income.dispose();
    _occupation.dispose();
    _maritalStatus.dispose();
    _children.dispose();
    _sexual.dispose();
  }

  final AuthService basicDetails = AuthService();

  Future<void> basics(
    String fullname,
    String dob,
    String gender,
    String city,
    String state,
    String country,
    String zodiac,
    String income,
    String occupation,
    String maritalStatus,
    String children,
    String sexualOrientation,
  ) async {
    await basicDetails.basics(
        context: context,
        fullname: fullname,
        dob: dob,
        gender: gender,
        city: city,
        state: state,
        country: country,
        zodiac: zodiac,
        income: income,
        occupation: occupation,
        maritalStatus: maritalStatus,
        children: children,
        sexualOrientation: sexualOrientation);
  }

  void showProgressIndicator() {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const CircularProgressIndicator(
                color: Color.fromRGBO(122, 17, 47, 1),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<CSCPickerState> cscPickerKey = GlobalKey();
    var size = Sizess();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xFF7A112F),
        backgroundColor: const Color(0xFFf5f5f5),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(size.height(context) * 0.10),
          child: Container(
            margin: EdgeInsets.only(bottom: size.height(context) * 0.05),
            child: const Text("Basic Details",
                style: TextStyle(
                    letterSpacing: 1.5,
                    color: Color(0xFF7A112F),
                    fontFamily: merriweather,
                    fontSize: 24,
                    fontWeight: FontWeight.w700)),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFf5f5f5),
      body: SizedBox(
        height: size.height(context),
        width: size.width(context),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: size.width(context),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _fullName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Your Name";
                      } else {
                        return null;
                      }
                    },
                    cursorColor: Colors.green,
                    decoration: const InputDecoration(
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
                  height: size.height(context) * .03,
                ),
                InkWell(
                  child: Container(
                    width: size.width(context),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  height: size.height(context) * .03,
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
                            bottom: BorderSide(
                                width: 1.5, color: Color(0xFF7A112F)))),
                  ),
                ),

                // const SizedBox(
                //   height: 30,
                // ),
                // DropdownButtonHideUnderline(
                //   child: DropdownButton2(
                //     buttonElevation: 0,
                //     hint: const Text(
                //       "City",
                //       style: TextStyle(
                //           color: Color(0xFFB7798B),
                //           fontSize: 15,
                //           fontWeight: FontWeight.w500,
                //           fontFamily: inter),
                //     ),
                //     iconDisabledColor: Colors.red,
                //     items: city
                //         .map((item) => DropdownMenuItem<String>(
                //               value: item,
                //               child: Text(
                //                 item,
                //                 style: const TextStyle(
                //                     fontWeight: FontWeight.w500,
                //                     color: Color(0xFFB7798B),
                //                     fontSize: 15,
                //                     fontFamily: inter),
                //                 overflow: TextOverflow.ellipsis,
                //               ),
                //             ))
                //         .toList(),
                //     icon: const Icon(
                //       Icons.keyboard_arrow_down,
                //       color: Color(0xff7A112F),
                //       size: 25,
                //     ),
                //     value: cityValue,
                //     onChanged: (String? value) {
                //       setState(() {
                //         cityValue = value;
                //       });
                //     },
                //     buttonPadding: const EdgeInsets.only(right: 10, left: 2),
                //     buttonWidth: size.width(context) * .89,
                //     buttonDecoration: const BoxDecoration(
                //         border: Border(
                //             bottom: BorderSide(
                //                 width: 1.5, color: Color(0xFF7A112F)))),
                //   ),
                // ),
                // const SizedBox(
                //   height: 30,
                // ),
                // DropdownButtonHideUnderline(
                //   child: DropdownButton2(
                //     buttonElevation: 0,
                //     hint: const Text(
                //       "State",
                //       style: TextStyle(
                //           color: Color(0xFFB7798B),
                //           fontSize: 15,
                //           fontWeight: FontWeight.w500,
                //           fontFamily: inter),
                //     ),
                //     iconDisabledColor: Colors.red,
                //     items: state
                //         .map((item) => DropdownMenuItem<String>(
                //               value: item,
                //               child: Text(
                //                 item,
                //                 style: const TextStyle(
                //                     fontWeight: FontWeight.w500,
                //                     color: Color(0xFFB7798B),
                //                     fontSize: 15,
                //                     fontFamily: inter),
                //                 overflow: TextOverflow.ellipsis,
                //               ),
                //             ))
                //         .toList(),
                //     icon: const Icon(
                //       Icons.keyboard_arrow_down,
                //       color: Color(0xff7A112F),
                //       size: 25,
                //     ),
                //     value: stateValue,
                //     onChanged: (String? value) {
                //       setState(() {
                //         stateValue = value;
                //       });
                //     },
                //     buttonPadding: const EdgeInsets.only(right: 10, left: 2),
                //     buttonWidth: size.width(context) * .89,
                //     buttonDecoration: const BoxDecoration(
                //         border: Border(
                //             bottom: BorderSide(
                //                 width: 1.5, color: Color(0xFF7A112F)))),
                //   ),
                // ),
                // const SizedBox(
                //   height: 30,
                // ),
                // DropdownButtonHideUnderline(
                //   child: DropdownButton2(
                //     buttonElevation: 0,
                //     hint: const Text(
                //       "Country",
                //       style: TextStyle(
                //           color: Color(0xFFB7798B),
                //           fontSize: 15,
                //           fontWeight: FontWeight.w500,
                //           fontFamily: inter),
                //     ),
                //     iconDisabledColor: Colors.red,
                //     items: country
                //         .map((item) => DropdownMenuItem<String>(
                //               value: item,
                //               child: Text(
                //                 item,
                //                 style: const TextStyle(
                //                     fontWeight: FontWeight.w500,
                //                     color: Color(0xFFB7798B),
                //                     fontSize: 15,
                //                     fontFamily: inter),
                //                 overflow: TextOverflow.ellipsis,
                //               ),
                //             ))
                //         .toList(),
                //     icon: const Icon(
                //       Icons.keyboard_arrow_down,
                //       color: Color(0xff7A112F),
                //       size: 25,
                //     ),
                //     value: countryValue,
                //     onChanged: (String? value) {
                //       setState(() {
                //         countryValue = value;
                //       });
                //     },
                //     buttonPadding: const EdgeInsets.only(right: 10, left: 2),
                //     buttonWidth: size.width(context) * .89,
                //     buttonDecoration: const BoxDecoration(
                //         border: Border(
                //             bottom: BorderSide(
                //                 width: 1.5, color: Color(0xFF7A112F)))),
                //   ),
                // ),
                // // Container(
                // //     padding: const EdgeInsets.symmetric(horizontal: 20),
                // //     child: Column(
                // //       children: [
                // //         SelectState(
                // //           onCountryChanged: (value) {
                // //             setState(() {
                // //               countryValues = value;
                // //             });
                // //           },
                // //           onStateChanged: (value) {
                // //             setState(() {
                // //               stateValues = value;
                // //             });
                // //           },
                // //           onCityChanged: (value) {
                // //             setState(() {
                // //               cityValues = value;
                // //             });
                // //           },
                // //         ),
                // //         // InkWell(
                // //         //     onTap: () {
                // //         //       print('country selected is $countryValue');
                // //         //       print('country selected is $stateValue');
                // //         //       print('country selected is $cityValue');
                // //         //     },
                // //         //     child: const Text(' Check'))
                // //       ],
                // //     )),
                SizedBox(
                  height: size.height(context) * .03,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: CSCPicker(
                    showStates: true,
                    showCities: true,
                    flagState: CountryFlag.DISABLE,
                    layout: Layout.vertical,
                    dropdownDecoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1.5, color: Color(0xFF7A112F)))),
                    disabledDropdownDecoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1.5, color: Color(0xFF7A112F)))),
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
                ),

                SizedBox(
                  height: size.height(context) * .03,
                ),
                Container(
                  width: size.width(context),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _zodiacSign,
                    cursorColor: Colors.green,
                    decoration: const InputDecoration(
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
                  height: size.height(context) * .03,
                ),
                Container(
                  width: size.width(context),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _income,
                    cursorColor: Colors.green,
                    decoration: const InputDecoration(
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
                      focusColor: Colors.grey,
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
                  height: size.height(context) * .03,
                ),
                Container(
                  width: size.width(context),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _occupation,
                    cursorColor: Colors.green,
                    decoration: const InputDecoration(
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
                  height: size.height(context) * .03,
                ),
                Container(
                  width: size.width(context),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _maritalStatus,
                    cursorColor: Colors.green,
                    decoration: const InputDecoration(
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
                  height: size.height(context) * .03,
                ),
                Container(
                  width: size.width(context),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _children,
                    cursorColor: Colors.green,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Children',
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
                  height: size.height(context) * .03,
                ),
                Container(
                  width: size.width(context),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _sexual,
                    cursorColor: Colors.green,
                    decoration: const InputDecoration(
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
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        FocusScopeNode currentFocus = FocusScope.of(context);

                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        // showProgressIndicator();

                        // await basics(
                        //     _fullName.text.toString(),
                        //     format.toString(),
                        //     selectedValue.toString(),
                        //     cityValues.toString(),
                        //     stateValues.toString(),
                        //     countryValues.toString(),
                        //     _zodiacSign.text.toString(),
                        //     _income.text.toString(),
                        //     _occupation.text.toString(),
                        //     _maritalStatus.text.toString(),
                        //     _children.text.toString(),
                        //     _sexual.text.toString());
                      }
                      Navigator.pushNamed(context, ChoosePersonality.routeName);
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
                SizedBox(
                  height: size.height(context) * .04,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
