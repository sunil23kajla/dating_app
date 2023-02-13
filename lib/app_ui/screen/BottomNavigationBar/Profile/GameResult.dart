import 'package:dating/constant/constant.dart';
import 'package:flutter/material.dart';

class GameResultScreen extends StatefulWidget {
  const GameResultScreen({Key? key}) : super(key: key);

  static const String routeName = '/game-result-screen';

  @override
  State<GameResultScreen> createState() => _GameResultScreenState();
}

class _GameResultScreenState extends State<GameResultScreen> {
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
            'Game Result',
            style: TextStyle(
                color: Color(0xFF7A112F),
                fontSize: 18.0,
                fontFamily: merriweather,
                fontWeight: FontWeight.w700),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(size.height(context) * 0.02),
            child: Container(),
          )),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width(context) * .04),
        height: size.height(context),
        width: size.width(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GameResultCard(size, context),
              SizedBox(
                height: size.height(context) * .04,
              ),
              GameResultCard(size, context),
              SizedBox(
                height: size.height(context) * .04,
              ),
              GameResultCard(size, context),
              SizedBox(
                height: size.height(context) * .04,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget GameResultCard(Sizess size, BuildContext context) {
    return Container(
      height: size.height(context) * .15,
      width: size.width(context),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFFFFFFF),
          boxShadow: const [
            BoxShadow(
              offset: Offset(
                0,
                4,
              ),
              blurRadius: 12,
              color: Color.fromARGB(44, 0, 0, 0),
            ),
          ]),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: size.width(context) * .12,
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100)),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                'assets/Rectangle 67.png',
                fit: BoxFit.fill,
                height: size.height(context) * .05,
                width: size.width(context) * .11,
              ),
            ),
          ),
          Positioned(
            right: size.width(context) * .12,
            top: 0,
            child: CircleAvatar(
              child: Image.asset(
                'assets/Ellipse 5 (3).png',
                height: size.height(context) * .06,
              ),
            ),
          ),
          Positioned(
              top: 0,
              right: size.width(context) * .02,
              child: const Icon(
                Icons.share,
                size: 17,
                color: Color(0xFF7A112F),
              )),
          Positioned(
            top: size.height(context) * .055,
            left: size.width(context) * .03,
            child: const Text(
              'Wesley Langworth',
              style: TextStyle(
                  fontFamily: inter, fontSize: 12, fontWeight: FontWeight.w700),
            ),
          ),
          Positioned(
            right: size.width(context) * .06,
            top: size.height(context) * .055,
            child: const Text(
              'Kristina Kunze',
              style: TextStyle(
                  fontFamily: inter, fontSize: 12, fontWeight: FontWeight.w700),
            ),
          ),
          Positioned(
            left: size.width(context) * .06,
            top: size.height(context) * .073,
            child: const Text(
              '20 Answers',
              style: TextStyle(
                  fontFamily: inter,
                  fontSize: 12,
                  color: Color(0xFF626262),
                  fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            right: size.width(context) * .085,
            top: size.height(context) * .073,
            child: const Text(
              '25 Answers',
              style: TextStyle(
                  fontFamily: inter,
                  fontSize: 12,
                  color: Color(0xFF626262),
                  fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
              bottom: size.height(context) * .01,
              child: const Text(
                '18 Answers Match',
                style: TextStyle(
                    fontFamily: inter,
                    fontSize: 12,
                    color: Color(0xFF0B5200),
                    fontWeight: FontWeight.w700),
              ))
        ],
      ),
    );
  }
}
