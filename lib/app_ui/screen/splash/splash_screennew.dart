import 'package:flutter/material.dart';

import '../../../constant/constant.dart';

class SplashScreenNew extends StatefulWidget {
  const SplashScreenNew({Key? key}) : super(key: key);

  static const String routeName = "/splash-screennew";

  @override
  State<SplashScreenNew> createState() => _SplashScreenNewState();
}

class _SplashScreenNewState extends State<SplashScreenNew> {
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
              left: size.width(context) * .3,
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
