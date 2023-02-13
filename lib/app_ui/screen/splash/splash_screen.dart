import 'package:dating/app_ui/screen/auth/loginScreen.dart';
import 'package:flutter/material.dart';

import '../../../constant/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = "/splash-screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var size = Sizess();

    return Scaffold(
      body: SizedBox(
        height: size.height(context),
        width: size.width(context),
        child: Stack(
          children: [
            Image.asset(
              'assets/splash.png',
              fit: BoxFit.cover,
              height: size.height(context),
              width: size.width(context),
            ),
            Positioned(
              top: size.height(context) * .18,
              left: size.width(context) * .365,
              child: Image.asset(
                'assets/Vector.png',
                fit: BoxFit.cover,
                height: size.height(context) * .07,
              ),
            ),
            Positioned(
                top: size.height(context) * .24,
                left: size.width(context) * .42,
                child: const Text(
                  'meet',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: fontFamily,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                )),
            Positioned(
                top: size.height(context) * .28,
                left: size.width(context) * .28,
                child: const Text(
                  'The online dating app',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF8A8989),
                    fontFamily: fontFamily1,
                    fontSize: 17,
                  ),
                )),
            Positioned(
              bottom: size.height(context) * .08,
              left: size.width(context) * .08,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
                child: Container(
                  height: size.height(context) * .065,
                  width: size.width(context) * .85,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFFE36B99),
                          Color(0xFFA02145),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(7)),
                  child: const Center(
                      child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontFamily: inter,
                      color: Color(0xFFF5F5F5),
                      fontSize: 16,
                    ),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
