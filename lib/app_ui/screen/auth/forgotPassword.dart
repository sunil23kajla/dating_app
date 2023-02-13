import 'package:dating/app_ui/screen/auth/otpScreen.dart';
import 'package:flutter/material.dart';

import '../../../constant/constant.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  static const String routeName = '/forgot-password';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late TextEditingController _phone;

  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();

    _phone = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _phone.dispose();
  }

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
                  left: size.width(context) * .15,
                  child: const Text(
                    'Forgot Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Color(0xFF7A112F),
                        fontFamily: merriweather,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  )),
              Positioned(
                  top: size.height(context) * .206,
                  left: size.width(context) * .14,
                  child: Container(
                    padding: const EdgeInsets.only(right: 22),
                    width: size.width(context) * .8,
                    child: const Text(
                      'Enter your mobile number to receive an OTP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          // letterSpacing: 1.5,
                          color: Color(0xFF7A112F),
                          fontFamily: inter,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
              Positioned(
                top: size.height(context) * .375,
                child: Form(
                  key: _formKey,
                  child: Container(
                    width: size.width(context),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: _phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter mobile Number";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.green,
                      decoration: const InputDecoration(
                        hintText: 'Phone Number',
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
              ),
              Positioned(
                top: size.height(context) * .58,
                left: (size.width(context) * .65 - size.width(context) / 2.5),
                child: InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, OtpScreen.routeName);
                    }
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
                      'Send',
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
