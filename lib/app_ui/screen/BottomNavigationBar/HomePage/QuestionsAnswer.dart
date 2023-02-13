import 'package:dating/constant/ListDeta.dart';
import 'package:dating/constant/constant.dart';
import 'package:flutter/material.dart';

class QuestionsAnswer extends StatefulWidget {
  const QuestionsAnswer({Key? key}) : super(key: key);

  static const String routeName = '/questions-answer';

  @override
  State<QuestionsAnswer> createState() => _QuestionsAnswerState();
}

class _QuestionsAnswerState extends State<QuestionsAnswer> {
  bool skip = false;
  bool save = false;
  String? leval;
  bool yes = false;
  String text1 = "yes";
  String text2 = "no";
  String text3 = "Sometimes";
  @override
  Widget build(BuildContext context) {
    var size = Sizess();
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width(context) * .05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height(context) * .04,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/Vector (10).png',
                height: size.height(context) * .02,
              ),
            ),
            SizedBox(
              height: size.height(context) * .03,
            ),
            const Text(
              'Answer Questions',
              style: TextStyle(
                  fontFamily: merriweather,
                  fontSize: 24,
                  color: Color(0xFF7A112F),
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: size.height(context) * .03,
            ),
            SizedBox(
              height: size.height(context) * .1,
              child: ListView.builder(
                  itemCount: quetions.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Text(
                        quetions[index],
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: inter,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF000000)),
                      ),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  activeColor: const Color(0xFF7A112F),
                  value: text1,
                  groupValue: leval,
                  onChanged: (value) {
                    setState(() {
                      leval = value.toString();
                    });
                  },
                ),
                const Text(
                  'Yes',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: inter,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000)),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  activeColor: const Color(0xFF7A112F),
                  value: text2,
                  groupValue: leval,
                  onChanged: (value) {
                    setState(() {
                      leval = value.toString();
                      setState(() {
                        leval = value.toString();
                      });
                    });
                  },
                ),
                const Text(
                  'No',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: inter,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000)),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  activeColor: const Color(0xFF7A112F),
                  value: text3,
                  groupValue: leval,
                  onChanged: (value) {
                    setState(() {
                      leval = value.toString();
                      setState(() {
                        leval = value.toString();
                      });
                    });
                  },
                ),
                const Text(
                  'Sometimes',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: inter,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000)),
                ),
              ],
            ),
            SizedBox(
              height: size.height(context) * .3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: size.height(context) * .055,
                    width: size.width(context) * .4,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: const Color(0xFFC92564)),
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.white,
                            Colors.white,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xFFF5F5F5)),
                    child: const Center(
                        child: Text(
                      'Skip',
                      style: TextStyle(
                          fontFamily: inter,
                          color: Color(0xFF7A112F),
                          // color: Color(0xFFF5F5F5),
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print('save answer');
                  },
                  child: Container(
                    height: size.height(context) * .055,
                    width: size.width(context) * .4,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF7A112F), Color(0xFFC92564)],
                        ),
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xFFF5F5F5)),
                    child: const Center(
                        child: Text(
                      'Save answer',
                      style: TextStyle(
                          fontFamily: inter,
                          color: Color(0xFFF5F5F5),
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    )),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
