import 'package:dating/app_ui/screen/auth/ChangePassword.dart';
import 'package:flutter/material.dart';

import '../../../constant/constant.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);
  static const String routeName = '/otp-screen';

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController first = TextEditingController();
  TextEditingController two = TextEditingController();
  TextEditingController three = TextEditingController();
  TextEditingController four = TextEditingController();
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
                  child: Container(
                    padding: const EdgeInsets.only(right: 5),
                    width: size.width(context),
                    child: const Text(
                      'Enter the code to verify number',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                          // letterSpacing: 1,
                          color: Color(0xFF7A112F),
                          fontFamily: merriweather,
                          fontSize: 29,
                          fontWeight: FontWeight.w700),
                    ),
                  )),
              Positioned(
                top: size.height(context) * .58,
                left: (size.width(context) * .65 - size.width(context) / 2.5),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ChangePassword.routeName);
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
                      'Verify',
                      style: TextStyle(
                          fontFamily: inter,
                          color: Color(0xFFF5F5F5),
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    )),
                  ),
                ),
              ),
              Positioned(
                bottom: size.height(context) * 0.6,
                right: size.width(context) * .155,
                child: SizedBox(
                    width: size.width(context) * 0.50,
                    height: size.width(context) * 0.10,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 5),
                          width: size.width(context) * 0.07,
                          height: size.width(context) * 0.07,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(207, 122, 17, 47),
                          ),
                          child: SizedBox(
                            width: size.width(context) * 0.075,
                            height: size.width(context) * 0.07,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              maxLength: 1,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              cursorColor: Colors.white,
                              decoration: const InputDecoration(
                                counterText: "",
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )),
              ),
              Positioned(
                top: size.height(context) * .45,
                left: size.width(context) * .38,
                child: InkWell(
                    onTap: () {},
                    child: const Text(
                      'Resend OTP',
                      style: TextStyle(
                          // decoration: TextDecoration.underline,
                          fontFamily: inter,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF7A112F)),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
