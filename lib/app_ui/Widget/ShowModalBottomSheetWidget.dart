import 'package:flutter/material.dart';

import '../../constant/constant.dart';

Future<dynamic> ShowModalBottomSheetWidget(BuildContext context, Sizess size) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    builder: (context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
            // width: size.width(context) * 1,
            height: size.height(context) * .45,
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: size.width(context) * 1,
                  height: size.height(context) * .13,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFFC92564),
                          Color(0xFF7A112F),
                        ],
                      )),
                ),
                Positioned(
                  top: size.height(context) * .07,
                  child: Container(
                    height: size.height(context) * .114,
                    width: size.width(context) * .25,
                    decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(110)),
                    child: const Center(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/Frame 86.png'),
                        // child: Image.asset(
                        //     'assets/Frame 86.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    right: size.width(context) * .06,
                    top: size.height(context) * .02,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/Vector (10).png',
                        height: size.height(context) * .02,
                        color: const Color(0xFFFFFFFF),
                      ),
                    )),
                Positioned(
                    bottom: size.height(context) * .22,
                    left: size.height(context) * .03,
                    child: const Text(
                      'Add special message',
                      style: TextStyle(
                          fontFamily: inter,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000)),
                    )),
                Positioned(
                  top: size.height(context) * .25,
                  child: Container(
                    width: size.width(context),
                    height: size.height(context) * 0.05,
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width(context) * 0.065),
                    child: const TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: Color(0xFFf5f5f5),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15),
                        hintText: 'Say something.....',
                        hintStyle: TextStyle(
                            color: Color(0xFFB7798B),
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xFF7A112F),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xFF7A112F)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height(context) * .05,
                  left: size.width(context) * .062,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: size.height(context) * .05,
                      width: size.width(context) * .87,
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
                        "Send",
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
            )),
      );
    },
  );
}
