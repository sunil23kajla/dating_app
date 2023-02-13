import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/AddAccount.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/Blocklist.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/EmailScreen.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/Help&Support.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/ManagePaymentAccount.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/PushNotification.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/RatingApp.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/Team.dart';
import 'package:flutter/material.dart';

import '../../../../../constant/constant.dart';
import '../../../../Widget/LogOut.dart';
import '../../../../Widget/settingpopupbox.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  static const String routeName = '/setting-screen';

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool myCurrentLocation = false;
  bool addLocation = false;
  bool gender = false;
  double _currentSliderValue = 60;
  String? showApp;
  String? hideProfile;
  RangeValues _currentRangeValues = const RangeValues(10, 60);

  @override
  Widget build(BuildContext context) {
    var size = Sizess();
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      appBar: AppBar(
          backgroundColor: const Color(0xFFf5f5f5),
          foregroundColor: const Color(0xFF7A112F),
          elevation: 0,
          title: const Text(
            'Settings',
            style: TextStyle(
                fontSize: 18.0,
                fontFamily: merriweather,
                color: Color(0xFF7A112F),
                fontWeight: FontWeight.w700),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(size.height(context) * 0.03),
            child: Container(),
          )),
      body: WillPopScope(
        onWillPop: () async {
          if (myCurrentLocation) {
            setState(() {
              myCurrentLocation = !myCurrentLocation;
            });
            return false;
          }
          return true;
        },
        child: Container(
          height: size.height(context),
          width: size.width(context),
          padding: EdgeInsets.symmetric(horizontal: size.width(context) * .05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Account Settings',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: inter,
                          fontWeight: FontWeight.w600),
                    )),
                SizedBox(height: size.height(context) * .01),
                Container(
                  height: size.height(context) * .042,
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width(context) * .02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFFDEDEDE),
                  ),
                  child: InkWell(
                    onTap: (() {
                      SettingPopupWidget(context, size);
                    }),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: size.width(context) * .5,
                            child: const Text(
                              'Phone Number',
                              style: TextStyle(
                                  fontFamily: inter,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )),
                        const Text(
                          '0000000000',
                          style: TextStyle(
                              color: Color(0xFF858585),
                              fontFamily: inter,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const Icon(Icons.navigate_next)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height(context) * .008,
                ),
                const Text(
                  'Verify a Phone Number to help secure your account.',
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: inter,
                      color: Color(0xFF858585),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: size.height(context) * .04,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Discovery Settings',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: inter,
                          fontWeight: FontWeight.w600),
                    )),
                SizedBox(height: size.height(context) * .01),
                InkWell(
                  onTap: (() {
                    setState(() {
                      myCurrentLocation = true;
                    });
                  }),
                  child: myCurrentLocation
                      ? Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width(context) * .03,
                          ),
                          height: size.height(context) * .12,
                          width: size.width(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFFDEDEDE),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Location',
                                style: TextStyle(
                                    fontFamily: inter,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'My Current Location',
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: inter,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Image.asset(
                                    'assets/Vectors (1).png',
                                    height: size.height(context) * .02,
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: (() {
                                  setState(() {
                                    addLocation = true;
                                  });
                                }),
                                child: addLocation
                                    ? Container(
                                        width: size.width(context),
                                        height: size.height(context) * .05,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: const Color(0xFFFFFFFF),
                                        ),
                                        child: const TextField(
                                          showCursor: false,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 4.0,
                                                    horizontal: 5),
                                            // border: OutlineInputBorder(),
                                            border: InputBorder.none,
                                            hintText: 'Location',
                                            suffixIcon: Icon(
                                              Icons.done_outline_rounded,
                                              color: Color(0xFF7A112F),
                                            ),
                                          ),
                                        ),
                                      )
                                    : const Text(
                                        'Add a new location',
                                        style: TextStyle(
                                            color: Color(0xFF0D1EB1),
                                            fontFamily: inter,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          height: size.height(context) * .042,
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width(context) * .02),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFFDEDEDE),
                          ),
                          child: InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  'Location',
                                  style: TextStyle(
                                      fontFamily: inter,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  'My Current Location',
                                  style: TextStyle(
                                      color: Color(0xFF0D1EB1),
                                      fontFamily: inter,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
                SizedBox(
                  height: size.height(context) * .008,
                ),
                const Text(
                  'Verify a Phone Number to help secure your account.',
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: inter,
                      color: Color(0xFF858585),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: size.height(context) * .04,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Show Me',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: inter,
                          fontWeight: FontWeight.w600),
                    )),
                SizedBox(height: size.height(context) * .01),
                WillPopScope(
                  onWillPop: () async {
                    if (gender) {
                      setState(() {
                        gender = !gender;
                      });
                      return false;
                    }
                    return true;
                  },
                  child: InkWell(
                    onTap: (() {
                      setState(() {
                        gender = true;
                      });
                    }),
                    child: gender
                        ? Container(
                            height: size.height(context) * .12,
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width(context) * .02),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFFDEDEDE),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Women',
                                      style: TextStyle(
                                          fontFamily: inter,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Icon(
                                      Icons.done_rounded,
                                      color: Color(0xFF7A112F),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Men',
                                      style: TextStyle(
                                          fontFamily: inter,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    // Icon(
                                    //   Icons.done_rounded,
                                    //   color: Color(0xFF7A112F),
                                    // )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Everyone',
                                      style: TextStyle(
                                          fontFamily: inter,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    // Icon(
                                    //   Icons.done_rounded,
                                    //   color: Color(0xFF7A112F),
                                    // )
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Container(
                            height: size.height(context) * .042,
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width(context) * .02),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFFDEDEDE),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  'Women',
                                  style: TextStyle(
                                      fontFamily: inter,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                Icon(Icons.navigate_next)
                              ],
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: size.height(context) * .04,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Maximum Distance',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: inter,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: size.height(context) * .012,
                ),
                Container(
                  height: size.height(context) * .09,
                  padding: EdgeInsets.symmetric(
                      vertical: size.height(context) * .01,
                      horizontal: size.width(context) * .02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFFDEDEDE),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '20k.m.',
                        style: TextStyle(
                            fontFamily: inter,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Expanded(
                        child: Slider(
                          value: _currentSliderValue,
                          max: 100,
                          divisions: 70,
                          activeColor: const Color(0xFF7A112F),
                          inactiveColor: const Color(0xFF858585),
                          // label: _currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height(context) * .04,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Age Range',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: inter,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: size.height(context) * .012,
                ),
                Container(
                  height: size.height(context) * .09,
                  padding: EdgeInsets.symmetric(
                      vertical: size.height(context) * .01,
                      horizontal: size.width(context) * .02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFFDEDEDE),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '22-33',
                        style: TextStyle(
                            fontFamily: inter,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Expanded(
                          child: RangeSlider(
                        values: _currentRangeValues,
                        max: 100,
                        divisions: 70,
                        activeColor: const Color(0xFF7A112F),
                        inactiveColor: const Color(0xFF858585),
                        // labels: RangeLabels(
                        //   _currentRangeValues.start.round().toString(),
                        //   _currentRangeValues.end.round().toString(),
                        // ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeValues = values;
                          });
                        },
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height(context) * .008,
                ),
                const Text(
                  'These preferences to suggest matches. Some match suggestions may not fallwithin your desired parameters.',
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: inter,
                      color: Color(0xFF858585),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: size.height(context) * .04,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Show me on app',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: inter,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: size.height(context) * .01),
                Container(
                  height: size.height(context) * .042,
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width(context) * .02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFFDEDEDE),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Show me on app',
                        style: TextStyle(
                            fontFamily: inter,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      Radio(
                        focusColor: const Color(0xFF7A112F),
                        activeColor: const Color(0xFF7A112F),
                        hoverColor: const Color(0xFF7A112F),
                        value: "",
                        groupValue: showApp,
                        onChanged: (String? value) {
                          if (showApp != value) {
                            setState(() {
                              showApp = value;
                            });
                          } else {
                            setState(() {
                              showApp = "";
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height(context) * .008,
                ),
                const Text(
                  'Verify a Phone Number to help secure your account.',
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: inter,
                      color: Color(0xFF858585),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: size.height(context) * .04),
                InkWell(
                  onTap: (() {
                    Navigator.pushNamed(context, BlocklistScreen.routeName);
                  }),
                  child: Container(
                    height: size.height(context) * .042,
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width(context) * .02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xFFDEDEDE),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'Blocklist',
                          style: TextStyle(
                              fontFamily: inter,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height(context) * .04,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'App Settings',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: inter,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: size.height(context) * .04),
                Container(
                  height: size.height(context) * .17,
                  width: size.width(context),
                  padding: EdgeInsets.symmetric(
                      vertical: size.height(context) * .005,
                      horizontal: size.width(context) * .02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFFDEDEDE),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Notifications',
                        style: TextStyle(
                            fontFamily: inter,
                            fontSize: 14,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w600),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, EmailScreen.routeName);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Email',
                              style: TextStyle(
                                  fontFamily: inter,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, PushNotification.routeName);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Push Notification',
                              style: TextStyle(
                                  fontFamily: inter,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          Navigator.pushNamed(context, Team.routeName);
                        }),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Team',
                              style: TextStyle(
                                  fontFamily: inter,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height(context) * .04,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Payment Account',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: inter,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: size.height(context) * .04),
                Container(
                  height: size.height(context) * .08,
                  width: size.width(context),
                  padding: EdgeInsets.symmetric(
                      vertical: size.height(context) * .005,
                      horizontal: size.width(context) * .02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFFDEDEDE),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (() {
                          Navigator.pushNamed(
                              context, ManagePaymentAccount.routeName);
                        }),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Manage Payment Account',
                              style: TextStyle(
                                  fontFamily: inter,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (() {
                          Navigator.pushNamed(context, AddAccount.routeName);
                        }),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Add Account',
                              style: TextStyle(
                                  fontFamily: inter,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height(context) * .04,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Hide My Profile',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: inter,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: size.height(context) * .01),
                Container(
                  height: size.height(context) * .042,
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width(context) * .02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFFDEDEDE),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Hide',
                        style: TextStyle(
                            fontFamily: inter,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      Radio(
                        focusColor: const Color(0xFF7A112F),
                        activeColor: const Color(0xFF7A112F),
                        hoverColor: const Color(0xFF7A112F),
                        value: "",
                        groupValue: hideProfile,
                        onChanged: (String? value) {
                          if (hideProfile != value) {
                            setState(() {
                              hideProfile = value;
                            });
                          } else {
                            setState(() {
                              hideProfile = "";
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height(context) * .008,
                ),
                const Text(
                  'Verify a Phone Number to help secure your account.',
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: inter,
                      color: Color(0xFF858585),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: size.height(context) * .04,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Contact Us',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: inter,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: size.height(context) * .01,
                ),
                Container(
                  height: size.height(context) * .05,
                  width: size.width(context),
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width(context) * .02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFFDEDEDE),
                  ),
                  child: InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, HelpSupport.routeName);
                    }),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Help & Support',
                          style: TextStyle(
                              fontFamily: inter,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Icon(Icons.navigate_next)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height(context) * .06,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: size.height(context) * .05,
                  width: size.width(context),
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width(context) * .02),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFFDEDEDE),
                  ),
                  child: InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, RatingAppScreen.routeName);
                    }),
                    child: const Text(
                      'Rating this app',
                      style: TextStyle(
                          fontFamily: inter,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(height: size.height(context) * .06),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return LogoutWidget(context);
                        });
                  },
                  child: Container(
                    height: size.height(context) * .055,
                    width: size.width(context) * .91,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFFC92564),
                            Color(0xFF7A112F),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(7)),
                    child: const Center(
                        child: Text(
                      "Logout",
                      style: TextStyle(
                        fontFamily: inter,
                        color: Color(0xFFF5F5F5),
                        fontSize: 16,
                      ),
                    )),
                  ),
                ),
                SizedBox(height: size.height(context) * .03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height(context) * .002,
                      width: size.width(context) * .35,
                      margin: EdgeInsets.only(left: size.width(context) * .06),
                      color: const Color(0xFF858585),
                    ),
                    const Text(
                      'Or',
                      style: TextStyle(
                        fontFamily: inter,
                        color: Color(0xFF858585),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      height: size.height(context) * .002,
                      width: size.width(context) * .35,
                      margin: EdgeInsets.only(right: size.width(context) * .06),
                      color: const Color(0xFF858585),
                    ),
                  ],
                ),
                SizedBox(height: size.height(context) * .03),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: size.height(context) * .055,
                    width: size.width(context) * .91,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFFC92564),
                            Color(0xFF7A112F),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(7)),
                    child: const Center(
                        child: Text(
                      "Delete Account",
                      style: TextStyle(
                        fontFamily: inter,
                        color: Color(0xFFF5F5F5),
                        fontSize: 16,
                      ),
                    )),
                  ),
                ),
                SizedBox(height: size.height(context) * .04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
