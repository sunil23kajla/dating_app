import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/Guide.dart';
import 'package:flutter/material.dart';

import '../../../../../constant/constant.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({Key? key}) : super(key: key);

  static const String routeName = '/help-support';

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
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
          'Help & Support',
          style: TextStyle(
              fontSize: 18.0,
              fontFamily: merriweather,
              color: Color(0xFF7A112F),
              fontWeight: FontWeight.w700),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(size.height(context) * 0.03),
          child: Container(),
        ),
      ),
      body: SizedBox(
        height: size.height(context),
        width: size.width(context),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: size.width(context) * .7,
                alignment: Alignment.center,
                child: const Text(
                  'Hi! How can we help?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: inter,
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: size.height(context) * .05,
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: size.width(context) * .03),
                child: TextFormField(
                  cursorColor: const Color(0xFF7A112F),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF7A112F),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 7.0, horizontal: 15),
                    hintText: 'Search here.....',
                    hintStyle: TextStyle(
                        color: Color(0xFF7A112F),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    filled: true,
                    fillColor: Color(0xFFFFFFFF),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xFF7A112F),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.5, color: Color(0xFF7A112F)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height(context) * .13,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Guide.routeName);
                },
                child: Container(
                  height: size.height(context) * .055,
                  width: size.width(context),
                  alignment: Alignment.center,
                  color: const Color.fromARGB(242, 122, 17, 47),
                  child: const Text(
                    'Guide',
                    style: TextStyle(
                        fontFamily: inter,
                        fontSize: 16,
                        color: Color(0xFFF5F5F5),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Container(
                height: size.height(context) * .055,
                width: size.width(context),
                alignment: Alignment.center,
                color: const Color.fromARGB(236, 176, 26, 69),
                child: const Text(
                  'Troubleshooting',
                  style: TextStyle(
                      fontFamily: inter,
                      fontSize: 16,
                      color: Color(0xFFF5F5F5),
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                height: size.height(context) * .055,
                width: size.width(context),
                alignment: Alignment.center,
                color: const Color.fromARGB(236, 201, 37, 100),
                child: const Text(
                  'Security & Privacy',
                  style: TextStyle(
                      fontFamily: inter,
                      fontSize: 16,
                      color: Color(0xFFF5F5F5),
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
