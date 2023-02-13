import 'package:dating/constant/GuideList.dart';
import 'package:dating/constant/constant.dart';
import 'package:flutter/material.dart';

class GuideDetail extends StatefulWidget {
  const GuideDetail({Key? key}) : super(key: key);

  static const String routeName = '/guide-detail';

  @override
  State<GuideDetail> createState() => _GuideDetailState();
}

class _GuideDetailState extends State<GuideDetail> {
  @override
  Widget build(BuildContext context) {
    var index = ModalRoute.of(context)?.settings.arguments as int;
    var datas = guide[index];
    var size = Sizess();
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf5f5f5),
        foregroundColor: const Color(0xFF7A112F),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(size.height(context) * 0.01),
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
              Text(
                datas[0],
                style: const TextStyle(
                    fontFamily: inter,
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: size.height(context) * .03,
              ),
              const Text(
                'What is app?',
                style: TextStyle(
                    fontFamily: inter,
                    fontSize: 18,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: size.height(context) * .03,
              ),
              const Text(
                'Habitant sed nec purus egestas at lorem morbi sit porta. Pellentesque sit nullam iaculis nisl massa dui sed. Pharetra consequat mattis pretium amet adipiscing adipiscing sem netus. Risus nisi fringilla gravida sit vulputate tortor. Sed tellus interdum dictumst felis sagittis. Netus tellus sed consectetur risus adipiscing massa venenatis mauris. Lacus tortor egestas id amet sapien tincidunt nulla nam eu.Netus tellus sed consectetur risus adipiscing massa venenatis mauris. Lacus tortor egestas id amet sapien tincidunt nulla nam eu.Netus tellus sed consectetur risus adipiscing massa venenatis mauris. Lacus tortor egestas id amet sapien tincidunt nulla nam eu.',
                style: TextStyle(
                    fontFamily: inter,
                    color: Color(0xFF000000),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: size.height(context) * .03,
              ),
              const Text(
                'What is the minimum age requirement?',
                style: TextStyle(
                    fontFamily: inter,
                    fontSize: 18,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: size.height(context) * .03,
              ),
              const Text(
                'Habitant sed nec purus egestas at lorem morbi sit porta. Pellentesque sit nullam iaculis nisl massa dui sed. Pharetra consequat mattis pretium amet adipiscing adipiscing sem netus. Risus nisi fringilla gravida sit vulputate tortor. Sed tellus interdum dictumst felis sagittis. Netus tellus sed consectetur risus adipiscing massa venenatis mauris. Lacus tortor egestas id amet sapien tincidunt nulla nam eu.Netus tellus sed consectetur risus adipiscing massa venenatis mauris. Lacus tortor egestas id amet sapien tincidunt nulla nam eu.Netus tellus sed consectetur risus adipiscing massa venenatis mauris. Lacus tortor egestas id amet sapien tincidunt nulla nam eu.',
                style: TextStyle(
                    fontFamily: inter,
                    color: Color(0xFF000000),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: size.height(context) * .03,
              ),
              const Text(
                'Supported platforms and devices',
                style: TextStyle(
                    fontFamily: inter,
                    fontSize: 18,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: size.height(context) * .03,
              ),
              const Text(
                'Habitant sed nec purus egestas at lorem morbi sit porta. Pellentesque sit nullam iaculis nisl massa dui sed. Pharetra consequat mattis pretium amet adipiscing adipiscing sem netus. Risus nisi fringilla gravida sit vulputate tortor. Sed tellus interdum dictumst felis sagittis. Netus tellus sed consectetur risus adipiscing massa venenatis mauris. Lacus tortor egestas id amet sapien tincidunt nulla nam eu.Netus tellus sed consectetur risus adipiscing massa venenatis mauris. Lacus tortor egestas id amet sapien tincidunt nulla nam eu.Netus tellus sed consectetur risus adipiscing massa venenatis mauris. Lacus tortor egestas id amet sapien tincidunt nulla nam eu.',
                style: TextStyle(
                    fontFamily: inter,
                    color: Color(0xFF000000),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
