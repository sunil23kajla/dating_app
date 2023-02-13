import 'package:dating/constant/constant.dart';
import 'package:dating/constant/messageList.dart';
import 'package:flutter/material.dart';

class ChattingScreen extends StatefulWidget {
  const ChattingScreen({Key? key}) : super(key: key);

  static const String routeName = '/chatting-screen';

  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  @override
  Widget build(BuildContext context) {
    var index = ModalRoute.of(context)?.settings.arguments as int;
    var chat = messagelist[index];
    var size = Sizess();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF7A112F),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(size.height(context) * 0.05),
          child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: size.width(context) * .06),
            height: size.height(context) * .12,
            width: size.width(context),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF7A112F), Color(0xFFC92564)],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/Vector2.png',
                    color: Colors.white,
                    height: size.height(context) * .02,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width(context) * .04),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xFFD9D9D9),
                    child: Image.asset(
                      chat[0],
                      height: size.height(context) * .07,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width(context) * .01),
                  child: Text(
                    chat[1],
                    style: const TextStyle(
                        fontFamily: inter,
                        fontSize: 14,
                        color: Color(
                          0xFFFFFFFF,
                        ),
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: size.height(context) * .8,
            width: size.width(context),
            // color: Colors.red,
            margin: EdgeInsets.symmetric(horizontal: size.width(context) * .03),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.only(right: size.width(context) * .06),
                    width: size.width(context),
                    height: size.height(context) * .07,
                    child: TextFormField(
                        decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.send,
                        color: Color(0xFF999999),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          // vertical: size.height(context) * .02,
                          horizontal: size.width(context) * .05),
                      hintText: 'Message...',
                      hintStyle: const TextStyle(
                          color: Color(0xFF626262),
                          fontSize: 15,
                          fontFamily: inter,
                          fontWeight: FontWeight.w500),
                      filled: true,
                      fillColor: const Color(0xFFDCDCDC),
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFFDCDCDC)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFFDCDCDC)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                    )),
                  ),
                ),
                Positioned(
                  bottom: size.height(context) * .15,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width(context) * .04),

                    alignment: Alignment.center,
                    height: size.height(context) * .045,
                    // width: size.width(context) * .24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF7A112F), Color(0xFFC92564)],
                      ),
                    ),
                    child: const Text(
                      'Helloo!!',
                      style: TextStyle(
                          fontFamily: inter,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height(context) * .09,
                  right: size.width(context) * .0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width(context) * .04),

                    alignment: Alignment.center,
                    height: size.height(context) * .045,
                    // width: size.width(context) * .24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF7A112F), Color(0xFFC92564)],
                      ),
                    ),
                    child: const Text(
                      'How are you??',
                      style: TextStyle(
                          fontFamily: inter,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height(context) * .24,
                  right: size.width(context) * .0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width(context) * .04),

                    alignment: Alignment.center,
                    height: size.height(context) * .045,
                    // width: size.width(context) * .24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF7A112F), Color(0xFFC92564)],
                      ),
                    ),
                    child: const Text(
                      'Hey....',
                      style: TextStyle(
                          fontFamily: inter,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF)),
                    ),
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
