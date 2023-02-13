import 'package:flutter/material.dart';

import '../../constant/constant.dart';

Future<dynamic> SettingPopupWidget(BuildContext context, Sizess size) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            // width: size.width(context) * .5,
            height: size.height(context) * .2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Account Settings',
                    style: TextStyle(
                        fontFamily: inter,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: size.height(context) * .02,
                ),
                Container(
                  width: size.width(context),
                  height: size.height(context) * .05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFFDEDEDE),
                  ),
                  child: const TextField(
                    showCursor: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 4.0, horizontal: 5),
                        // border: OutlineInputBorder(),
                        border: InputBorder.none,
                        hintText: '1234567890',
                        suffixIcon: Icon(
                          Icons.done_outline_rounded,
                          color: Color(0xFF7A112F),
                        )),
                  ),
                ),
                SizedBox(
                  height: size.height(context) * .01,
                ),
                const Text(
                  'Verify Phone Number',
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: inter,
                      color: Color(0xFF858585),
                      fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                Container(
                  alignment: Alignment.center,
                  height: size.height(context) * .045,
                  // width: size.width(context) * .25,
                  margin: EdgeInsets.only(bottom: size.height(context) * .002),
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
                      'Update My Phone Number',
                      style: TextStyle(
                          fontFamily: inter,
                          color: Color(0xFFF5F5F5),
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
