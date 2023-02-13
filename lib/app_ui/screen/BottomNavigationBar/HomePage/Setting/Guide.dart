import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/GuideDetails.dart';
import 'package:dating/constant/GuideList.dart';
import 'package:flutter/material.dart';

import '../../../../../constant/constant.dart';

class Guide extends StatefulWidget {
  const Guide({Key? key}) : super(key: key);

  static const String routeName = '/guide';

  @override
  State<Guide> createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  @override
  Widget build(BuildContext context) {
    var size = Sizess();
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf5f5f5),
        foregroundColor: const Color(0xFF7A112F),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(size.height(context) * 0.03),
          child: Container(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width(context) * .05),
        height: size.height(context),
        width: size.width(context),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
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
              SizedBox(
                height: size.height(context) * .03,
              ),
              const Text(
                'Guide for this app',
                style: TextStyle(
                    fontFamily: inter,
                    fontSize: 26,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: size.height(context) * .03,
              ),
              SizedBox(
                height: size.height(context),
                width: size.height(context),
                child: ListView.builder(
                  itemCount: guide.length,
                  itemBuilder: (context, index) {
                    var data = guide[index];
                    return SizedBox(
                      height: size.height(context) * .06,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, GuideDetail.routeName,
                              arguments: index);
                        },
                        child: Text(
                          data[0],
                          style: const TextStyle(
                              fontFamily: inter,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
