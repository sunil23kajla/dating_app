import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/GameScreen.dart';
import 'package:dating/constant/constant.dart';
import 'package:flutter/material.dart';

import '../../../../constant/ListDeta.dart';
import '../../../Widget/ShowModalBottomSheetWidget.dart';

class DetailsYourSelf extends StatefulWidget {
  const DetailsYourSelf({Key? key}) : super(key: key);

  @override
  State<DetailsYourSelf> createState() => _DetailsYourSelfState();
}

class _DetailsYourSelfState extends State<DetailsYourSelf> {
  late PageController controller;
  double currentPageValue = 0.0;
  late int nextIndex;

  late Color color;
  bool first = true;
  bool second = false;
  bool third = false;
  bool four = false;
  bool five = false;
  bool liked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController(initialPage: 0);
    nextIndex = controller.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    var size = Sizess();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height(context) * .6,
                width: size.width(context),
                // color: Colors.red,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    // Image.asset(
                    //   'assets/Frame 87.png',
                    //   width: size.width(context),
                    //   fit: BoxFit.cover,
                    // ),
                    PageView.builder(
                      controller: controller,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          child: GestureDetector(
                            onTap: nextIndex == 4
                                ? () {}
                                : () async {
                                    await controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeIn);
                                    setState(() {
                                      nextIndex = controller.page!.toInt();
                                    });
                                  },
                            child: Image.asset(
                              images[0],
                              width: size.width(context),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                      onPageChanged: (value) {
                        setState(() {
                          nextIndex = value;
                        });
                      },
                    ),
                    Positioned(
                      top: size.height(context) * 0.02,
                      child: Container(
                        width: size.width(context) * 0.89,
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width(context) * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: size.width(context) * .15,
                              height: size.height(context) * .003,
                              color: nextIndex == 0
                                  ? const Color(0xFFFFFFFF)
                                  : const Color(0xFF000000),
                            ),
                            Container(
                              width: size.width(context) * .15,
                              height: size.height(context) * .003,
                              color: nextIndex == 1
                                  ? const Color(0xFFFFFFFF)
                                  : const Color(0xFF000000),
                            ),
                            Container(
                              width: size.width(context) * .15,
                              height: size.height(context) * .003,
                              color: nextIndex == 2
                                  ? const Color(0xFFFFFFFF)
                                  : const Color(0xFF000000),
                            ),
                            Container(
                              width: size.width(context) * .15,
                              height: size.height(context) * .003,
                              color: nextIndex == 3
                                  ? const Color(0xFFFFFFFF)
                                  : const Color(0xFF000000),
                            ),
                            Container(
                              width: size.width(context) * .15,
                              height: size.height(context) * .003,
                              color: nextIndex == 4
                                  ? const Color(0xFFFFFFFF)
                                  : const Color(0xFF000000),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height(context) * .06,
                      right: size.width(context) * .05,
                      child: PopupMenuButton(
                        constraints: BoxConstraints(
                          maxHeight: size.height(context) * .04,
                          maxWidth: size.width(context) * .25,
                        ),
                        offset: Offset(
                          0,
                          size.height(context) * .04,
                        ),
                        child: Image.asset(
                          'assets/Menu Vertical.png',
                          height: size.height(context) * .04,
                        ),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              padding: const EdgeInsets.only(bottom: 50),
                              child: Container(
                                  alignment: Alignment.center,
                                  // height: size.height(context) * .04,
                                  width: size.width(context) * .22,
                                  child: const Text(
                                    "Report",
                                    style: TextStyle(
                                        fontFamily: inter,
                                        fontSize: 14,
                                        color: Color(0xFF000000),
                                        fontWeight: FontWeight.w600),
                                  )),
                            ),
                          ];
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height(context) * .02,
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: size.width(context) * .05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Wesley Langworth, 22",
                      style: TextStyle(
                          fontFamily: merriweather,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: size.height(context) * .01,
                    ),
                    newMethod(size, context, 'assets/Vector (14).png',
                        'Human Resource'),
                    SizedBox(
                      height: size.height(context) * .01,
                    ),
                    newMethod(
                        size, context, 'assets/Vector (15).png', 'Straight'),
                    SizedBox(
                      height: size.height(context) * .01,
                    ),
                    newMethod(size, context, 'assets/Vector (13).png',
                        '2.46 km away'),
                    SizedBox(
                      height: size.height(context) * .022,
                    ),
                    const Text(
                      'About Me',
                      style: TextStyle(
                          fontFamily: inter,
                          fontSize: 18,
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: size.height(context) * .022,
                    ),
                    const Text(
                      'Ac tristique molestie hac ut. Amet sapien tortor parturient viverra semper amet. At ac ac orci elit. Tempus dis consequat nulla tellus laoreet eget ut morbi aliquet. Scelerisque proin sagittis est quis id et mauris consectetur. Praesent cras id aliquam ullamcorper elit arcu in. Eget dolor nunc phasellus posuere a. A sollicitudin ut amet dolor pellentesque felis varius. Blandit mi luctus consectetur integer bibendum lorem. Faucibus mauris sed egestas pretium integer natoque sem feugiat. Pellentesque venenatis dignissim nam odio et aenean sollicitudin rhoncus at. Commodo arcu posuere quis hendrerit nulla ultrices. Egestas tincidunt duis arcu nibh. ',
                      style: TextStyle(
                          fontFamily: inter,
                          fontSize: 14,
                          color: Color(0xFF626262),
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: size.height(context) * .022,
                    ),
                    const Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: size.height(context) * .022,
                    ),
                    const Text(
                      'Interests',
                      style: TextStyle(
                          fontFamily: inter,
                          fontSize: 18,
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: size.height(context) * .022,
                    ),
                    Row(
                      children: [
                        InterestsWidget(size, context, 'Cooking/ Baking'),
                        SizedBox(
                          width: size.width(context) * .022,
                        ),
                        InterestsWidget(size, context, 'Video game'),
                        SizedBox(
                          width: size.width(context) * .022,
                        ),
                        InterestsWidget(size, context, 'Football'),
                        SizedBox(
                          width: size.width(context) * .022,
                        ),
                        InterestsWidget(size, context, 'Shy'),
                      ],
                    ),
                    SizedBox(
                      height: size.height(context) * .022,
                    ),
                    SizedBox(
                        width: size.width(context) * .4,
                        child: InterestsWidget(
                            size, context, 'Wine or Food Tasting')),
                    SizedBox(
                      height: size.height(context) * .022,
                    ),
                    const Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: size.height(context) * .022,
                    ),
                    Container(
                      child: const Text(
                        "Wants to see Wesley Langworth’s private album ",
                        style: TextStyle(
                            fontFamily: inter,
                            fontSize: 18,
                            color: Color(0xFF980000),
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: size.height(context) * .022,
                    ),
                    InkWell(
                      onTap: () {
                        print(" Send Request");
                      },
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
                          "Send Request",
                          style: TextStyle(
                            fontFamily: inter,
                            color: Color(0xFFF5F5F5),
                            fontSize: 16,
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: size.height(context) * .022,
                    ),
                    const Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: size.height(context) * .01,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: size.height(context) * .1,
                width: size.width(context) * .6,
                // color: Colors.red,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          print("cancel");
                        },
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFFFFFFFF),
                          child: Image.asset(
                            'assets/Vector (10).png',
                            height: size.height(context) * .02,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            liked = !liked;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor:
                              liked ? const Color(0xFFC92564) : Colors.white,
                          child: Image.asset(
                            'assets/Vector (11).png',
                            height: size.height(context) * .022,
                            color:
                                liked ? Colors.white : const Color(0xFF7A112F),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await ShowModalBottomSheetWidget(context, size);
                        },
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFFFFFFFF),
                          child: Image.asset(
                            'assets/Communication.png',
                            height: size.height(context) * .028,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, GameScreen.routeName);
                        },
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFFFFFFFF),
                          child: Image.asset(
                            'assets/Game Controller.png',
                            height: size.height(context) * .028,
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget InterestsWidget(Sizess size, BuildContext context, text) {
    return Container(
      alignment: Alignment.center,
      height: size.height(context) * .04,
      padding: EdgeInsets.only(
          left: size.width(context) * .015, right: size.width(context) * .015),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            width: 1,
            color: const Color(0xFF7A112F),
          )),
      child: Text(
        text,
        style: const TextStyle(
            fontFamily: inter,
            fontSize: 13,
            color: Color(0xFF7A112F),
            fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget newMethod(Sizess size, BuildContext context, images, title) {
    return Row(
      children: [
        Image.asset(
          images,
          height: size.height(context) * .022,
        ),
        Container(
            padding:
                EdgeInsets.symmetric(horizontal: size.width(context) * .04),
            child: Text(
              title,
              style: const TextStyle(
                  fontFamily: inter,
                  fontSize: 16,
                  color: Color(0xFF626262),
                  fontWeight: FontWeight.w400),
            )),
      ],
    );
  }
}
