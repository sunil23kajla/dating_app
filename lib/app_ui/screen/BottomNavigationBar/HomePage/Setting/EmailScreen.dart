import 'package:flutter/material.dart';

import '../../../../../constant/constant.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  static const String routeName = '/email-screen';

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  bool newMatches = false;
  bool newMessages = false;
  bool promotions = false;
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
          'Email',
          style: TextStyle(
              fontSize: 18.0,
              fontFamily: merriweather,
              color: Color(0xFF7A112F),
              fontWeight: FontWeight.w700),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(size.height(context) * 0.015),
          child: Container(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width(context) * .04),
        height: size.height(context),
        width: size.width(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                  'Control the emails you want to get - all of them, just the important stuff or the bare minimum. You can always unsubscribe from the bottom of any email.',
                  style: TextStyle(
                    fontSize: 9,
                    fontFamily: inter,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF858585),
                  )),
              SizedBox(
                height: size.height(context) * .03,
              ),
              TextField(
                showCursor: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    fillColor: const Color(0xFFDEDEDE),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(
                        // vertical: 5.0,
                        horizontal: size.width(context) * .023),
                    // border: OutlineInputBorder(),

                    hintText: 'shimee0196@gmail.com',
                    hintStyle: const TextStyle(
                        fontFamily: inter,
                        fontSize: 14,
                        color: Color(0xFF000000))),
              ),
              SizedBox(
                height: size.height(context) * .046,
              ),
              Container(
                width: size.width(context),
                height: size.height(context) * .20,
                padding: EdgeInsets.symmetric(
                  horizontal: size.width(context) * .03,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFDEDEDE),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'New Matches',
                          style: TextStyle(
                              fontFamily: inter,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF000000)),
                        ),
                        Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith(
                              (states) => (const Color(0xFF7A112F))),
                          activeColor: const Color(0xFF7A112F),
                          value: newMatches,
                          onChanged: (value) {
                            setState(() {
                              newMatches = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'New Messages',
                          style: TextStyle(
                              fontFamily: inter,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF000000)),
                        ),
                        Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith(
                              (states) => (const Color(0xFF7A112F))),
                          activeColor: const Color(0xFF7A112F),
                          value: newMessages,
                          onChanged: (value) {
                            setState(() {
                              newMessages = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Promotions',
                          style: TextStyle(
                              fontFamily: inter,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF000000)),
                        ),
                        Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith(
                              (states) => (const Color(0xFF7A112F))),
                          activeColor: const Color(0xFF7A112F),
                          value: promotions,
                          onChanged: (value) {
                            setState(() {
                              promotions = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height(context) * .046,
              ),
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
                    "Unsubscribe From All",
                    style: TextStyle(
                      fontFamily: inter,
                      color: Color(0xFFF5F5F5),
                      fontSize: 16,
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
