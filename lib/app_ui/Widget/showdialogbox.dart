import 'package:flutter/material.dart';

import '../../constant/constant.dart';

Future<dynamic> showdialogbox(BuildContext context, Sizess size) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            // width: size.width(context) * .5,
            height: size.height(context) * .15,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Album Name',
                    style: TextStyle(
                        fontFamily: inter,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: size.width(context),
                  child: const TextField(
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type album name.....',
                      hintStyle: TextStyle(
                          color: Color(
                            0xFF858585,
                          ),
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          fontFamily: inter),
                      fillColor: Colors.white,
                      focusColor: Colors.green,
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.5, color: Color(0xFF858585)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.5, color: Color(0xFF858585)),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height(context) * .045,
                    width: size.width(context) * .25,
                    margin:
                        EdgeInsets.only(bottom: size.height(context) * .002),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF7A112F), Color(0xFFC92564)],
                        ),
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xFFF5F5F5)),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Done',
                        style: TextStyle(
                            fontFamily: inter,
                            color: Color(0xFFF5F5F5),
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
