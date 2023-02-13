import 'package:dating/app_ui/details/basicDetails.dart';
import 'package:dating/authentication/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constant/constant.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static const String routeName = '/signup-screen';
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool seepassword = true;
  late TextEditingController _username;
  late TextEditingController _phone;
  late TextEditingController _password;

  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();

    _username = TextEditingController();
    _phone = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
    _phone.dispose();
    _password.dispose();
  }

  final AuthService authService = AuthService();

  Future<void> userSignUp(
      String username, String number, String password) async {
    print("rr");
    await authService.signupUser(
        context: context,
        username: username,
        phone: number,
        password: password);
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
                  top: size.height(context) * .12,
                  left: size.width(context) * .35,
                  child: const Text(
                    'Sign Up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: 1.5,
                        color: Color.fromRGBO(122, 17, 47, 1),
                        fontFamily: merriweather,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  )),
              Positioned(
                top: size.height(context) * .176,
                left: size.width(context) * .28,
                child: const Text(
                  'FOR YOUR ACCOUNT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 1.5,
                      color: Color(0xFF7A112F),
                      fontFamily: inter,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Positioned(
                top: size.height(context) * .29,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: size.height(context) * .28,
                  width: size.width(context),
                  // color: Colors.red,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormField(
                          controller: _username,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please fill this";
                            } else {
                              return null;
                            }
                          },
                          cursorColor: Colors.green,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Username',
                            hintStyle: TextStyle(
                                color: Color(
                                  0xFFB7798B,
                                ),
                                fontSize: 15,
                                fontFamily: inter),
                            fillColor: Colors.white,
                            focusColor: Colors.green,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.5, color: Color(0xFF7A112F)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.5, color: Color(0xFF7A112F)),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please fill this";
                            } else {
                              return null;
                            }
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.green,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
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
                              borderSide: BorderSide(
                                  width: 1.5, color: Color(0xFF7A112F)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.5, color: Color(0xFF7A112F)),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _password,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter a password";
                            } else if (value.length < 6) {
                              return "Password length have to be more than 6.";
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
                                      color: Color(0xFF7A112F),
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
                                        color: Color(0xFF7A112F)),
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
                              borderSide: BorderSide(
                                  width: 1.5, color: Color(0xFF7A112F)),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.5, color: Color(0xFF7A112F)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height(context) * .63,
                left: (size.width(context) * .65 - size.width(context) / 2.5),
                child: InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      FocusScopeNode currentFocus = FocusScope.of(context);

                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      // showProgressIndicator();

                      // await userSignUp(_username.text.toString(),
                      //     _phone.text.toString(), _password.text.toString());
                      Navigator.popAndPushNamed(context, BasicDetail.routeName);
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
                      'Signup',
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
