import 'package:flutter/material.dart';

import '../../../constant/constant.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  static const String routeName = 'change-password';

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    var size = Sizess();
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height(context),
          width: size.width(context),
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  child: Image.asset(
                    'assets/Group25.png',
                    height: size.height(context) * .287,
                    fit: BoxFit.cover,
                    width: size.width(context),
                  )),
              Positioned(
                top: size.height(context) * .07,
                left: size.width(context) * .05,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/Vector2.png',
                      height: size.height(context) * .05,
                      width: size.width(context) * .05,
                    )),
              ),
              Positioned(
                  top: size.height(context) * .15,
                  left: size.width(context) * .05,
                  child: const Text(
                    'Change password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF7A112F),
                        fontFamily: merriweather,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  )),
              Positioned(
                top: size.height(context) * .355,
                child: Container(
                  width: size.width(context),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const TextField(
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'New Password',
                      hintStyle: TextStyle(
                          color: Color(
                            0xFFB7798B,
                          ),
                          fontSize: 15,
                          fontFamily: inter),
                      fillColor: Colors.white,
                      focusColor: Colors.green,
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF7A112F)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF7A112F)),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: size.height(context) * .475,
                child: Container(
                  width: size.width(context),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const TextField(
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(
                          color: Color(
                            0xFFB7798B,
                          ),
                          fontSize: 15,
                          fontFamily: inter),
                      fillColor: Colors.white,
                      focusColor: Colors.green,
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF7A112F)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF7A112F)),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height(context) * .58,
                left: (size.width(context) * .65 - size.width(context) / 2.5),
                child: InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, OtpScreen.routeName);
                  },
                  child: Container(
                    height: size.height(context) * .062,
                    width: size.width(context) * .5,
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
                      'Change Password',
                      style: TextStyle(
                          fontFamily: inter,
                          color: Color(0xFFF5F5F5),
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
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
