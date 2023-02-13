import 'package:dating/app_ui/details/basicDetails.dart';
import 'package:dating/app_ui/screen/auth/forgotPassword.dart';
import 'package:dating/app_ui/screen/auth/signupScreen.dart';
import 'package:dating/authentication/auth_service.dart';
import 'package:dating/constant/constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool seepassword = true;

  late TextEditingController _phonenumber;
  late TextEditingController _passwords;

  late GlobalKey<FormState> _formKey;
  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();

    _phonenumber = TextEditingController();
    _passwords = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _phonenumber.dispose();
    _passwords.dispose();
  }

  final AuthService loginService = AuthService();

  Future<void> userLogin(String number, String password) async {
    print('login api ');
    await loginService.loginUser(
        context: context, phone: number, password: password);
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
    var size = Sizess();
    return Scaffold(
      backgroundColor: const Color(0xFF78112f),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                    top: size.height(context) * .14,
                    left: size.width(context) * .41,
                    child: const Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          letterSpacing: 1.5,
                          color: Color(0xFFF5F5F5),
                          fontFamily: merriweather,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    )),
                Positioned(
                    top: size.height(context) * .19,
                    left: size.width(context) * .37,
                    child: const Text(
                      'TO CONTINUE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          letterSpacing: 1.5,
                          color: Color(0xFFF5F5F5),
                          fontFamily: inter,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    )),
                Positioned(
                  top: size.height(context) * .3,
                  child: Container(
                    width: size.width(context),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: _phonenumber,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter mobile Number";
                        } else {
                          return null;
                        }
                      },
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
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
                              BorderSide(width: 1, color: Color(0xFFFFFFFF)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height(context) * .4,
                  child: Container(
                    width: size.width(context),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: _passwords,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a password";
                        } else {
                          return null;
                        }
                      },
                      obscureText: seepassword == true ? true : false,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        suffixIcon: seepassword
                            ? IconButton(
                                icon: const Icon(
                                  Icons.visibility_off,
                                  color: Color(0xFFFFFFFF),
                                ),
                                onPressed: () {
                                  setState(() {
                                    seepassword = false;
                                  });
                                },
                              )
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    seepassword = true;
                                  });
                                },
                                icon: const Icon(Icons.visibility,
                                    color: Color(0xFFFFFFFF)),
                              ),
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                            color: Color(
                              0xFFB7798B,
                            ),
                            fontSize: 15,
                            fontFamily: inter),
                        fillColor: Colors.white,
                        focusColor: Colors.green,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xFFFFFFFF)),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height(context) * .455,
                  right: size.width(context) * .08,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ForgotPassword.routeName);
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                          fontFamily: inter,
                          color: Color(0xFFF5F5F5),
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height(context) * .56,
                  left: (size.width(context) * .65 - size.width(context) / 2.5),
                  child: InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        FocusScopeNode currentFocus = FocusScope.of(context);

                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        Navigator.popAndPushNamed(
                            context, BasicDetail.routeName);
                        // showProgressIndicator();
                        // await userLogin(_phonenumber.text.toString(),
                        //     _passwords.text.toString());
                      }
                    },
                    child: Container(
                      height: size.height(context) * .062,
                      width: size.width(context) * .5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color(0xFFF5F5F5)),
                      child: const Center(
                          child: Text(
                        'Login',
                        style: TextStyle(
                            fontFamily: inter,
                            color: Color(0xFF7A112F),
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      )),
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height(context) * .335,
                  left: size.width(context) * .2,
                  child: RichText(
                    text: TextSpan(
                        text: 'Don’t have an account? ',
                        style: const TextStyle(
                            color: Color(0xFFF5F5F5),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                        children: [
                          TextSpan(
                              text: 'Signup',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                      context, SignupScreen.routeName);
                                },
                              style: const TextStyle(
                                  // decoration: TextDecoration.underline,
                                  // decorationThickness: 2,
                                  color: Color(0xFFF5F5F5),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16))
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
