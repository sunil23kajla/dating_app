// ignore_for_file: avoid_print

import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/CoinsSceen.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/DetailsYourSelf.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/GameScreen.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Messages/MessagesScreen.dart';
import 'package:dating/constant/ListDeta.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../constant/constant.dart';
import '../../../Widget/ShowModalBottomSheetWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController controller;
  late PageController controllers;
  double currentPageValue = 0.0;
  double currentPageValue1 = 0.0;
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
    controllers = PageController(initialPage: 0);
    nextIndex = controller.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    var size = Sizess();
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width(context) * .03),
                  alignment: Alignment.topLeft,
                  height: size.height(context) * .07,
                  width: size.width(context) * .6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'meet',
                        style: TextStyle(
                            fontFamily: inter,
                            fontSize: 22,
                            color: Color(0xFFC92564),
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: size.width(context) * .015),
                        child: const Text(
                          'Near you',
                          style: TextStyle(
                              fontFamily: merriweather,
                              fontSize: 14,
                              color: Color(0xFF7A112F),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height(context) * .06,
                  width: size.width(context) * .25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: (() {
                          Navigator.pushNamed(context, CoinsScreen.routeName);
                        }),
                        child: Image.asset(
                          'assets/Dollar Coin.png',
                          height: size.height(context) * .03,
                        ),
                      ),
                      const Text(
                        '50 coins',
                        style: TextStyle(
                            fontFamily: inter,
                            fontSize: 12,
                            color: Color(0xFF7A112F),
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (() {
                    Navigator.pushNamed(context, MessagesScreen.routeName);
                  }),
                  child: Container(
                    margin: EdgeInsets.only(top: size.height(context) * .012),
                    child: Image.asset(
                      'assets/Communication.png',
                      height: size.height(context) * .03,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.height(context) * .03,
            ),
            SizedBox(
              height: size.height(context) * .08,
              width: size.width(context),
              // color: Colors.red,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: activestatus.length,
                  itemBuilder: (context, index) {
                    var active = activestatus[index];
                    return Container(
                      padding: EdgeInsets.all(size.height(context) * .004),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient: active[2]),
                      margin: EdgeInsets.only(left: size.width(context) * .05),
                      width: size.height(context) * .08,
                      child: Container(
                        padding: EdgeInsets.all(size.height(context) * .003),
                        height: size.height(context) * .08,
                        width: size.height(context) * .08,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: active[1]),
                        child: CircleAvatar(
                            backgroundColor: Colors.greenAccent,
                            radius: size.height(context),
                            child: Image.asset(active[0])),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: size.height(context) * .03,
            ),
            Container(
              height: size.height(context) * .65,
              width: size.height(context),
              margin: EdgeInsets.only(
                  left: size.width(context) * .06,
                  right: size.width(context) * .06),
              decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView.builder(
                      controller: controllers,
                      onPageChanged: (value) {
                        setState(() {
                          print(value);
                          nextIndex = 0;
                        });
                      },
                      itemCount: imagess.length,
                      itemBuilder: (context, i) {
                        if (i == currentPageValue.floor()) {
                          controllers.addListener(() {
                            setState(() {
                              currentPageValue = controllers.page!.toDouble();
                            });
                          });

                          return Transform(
                            transform: Matrix4.identity()
                              ..rotateY(currentPageValue - i)
                              ..rotateZ(currentPageValue - i),
                            child: Stack(
                              children: [
                                PageView.builder(
                                  controller: controller,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: imagess[i].length,
                                  itemBuilder: (context, index) {
                                    // if (index == currentPageValue1.floor()) {
                                    //   controller.addListener(() {
                                    //     setState(() {
                                    //       currentPageValue1 =
                                    //           controller.page!.toDouble();
                                    //     });
                                    //   });
                                    return ClipRRect(
                                      child: GestureDetector(
                                        onTap: nextIndex >= imagess[i].length
                                            ? () {
                                                print("over");
                                              }
                                            : () async {
                                                await controller.nextPage(
                                                    duration: const Duration(
                                                        milliseconds: 200),
                                                    curve: Curves.easeIn);
                                                setState(() {
                                                  nextIndex =
                                                      controller.page!.toInt();
                                                });
                                              },
                                        child: Image.asset(
                                          imagess[i][nextIndex],
                                          width: size.width(context),
                                          height: size.height(context),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    );
                                    // } else {
                                    //   return Container();
                                    // }
                                  },
                                  onPageChanged: (value) {
                                    print("here is $value");
                                    setState(() {
                                      nextIndex = value;
                                    });
                                  },
                                ),
                                Positioned(
                                  top: size.height(context) * 0.03,
                                  right: size.width(context) * .0,
                                  left: size.width(context) * .0,
                                  child: Container(
                                    width: size.width(context) * 0.89,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: size.width(context) * 0.02),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                  bottom: -3,
                                  child: Container(
                                    height: size.height(context) * .07,
                                    width: size.width(context) * .908,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(202, 255, 255, 255),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: size.width(context) * .02),
                                          height: size.height(context) * .04,
                                          // width: size.width(context) * .45,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              const Text(
                                                'Wesley Langworth, 22',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xFF000000),
                                                    fontFamily: merriweather),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  // Navigator.of(context)
                                                  //     .push(PageRouteBuilder(
                                                  //   pageBuilder: (context,
                                                  //           animation,
                                                  //           secondaryAnimation) =>
                                                  //       const DetailsYourSelf(),
                                                  //   transitionsBuilder:
                                                  //       (context,
                                                  //           animation,
                                                  //           secondaryAnimation,
                                                  //           child) {
                                                  //     const begin =
                                                  //         Offset(0.0, 1.0);
                                                  //     const end = Offset.zero;
                                                  //     const curve = Curves.ease;

                                                  //     var tween = Tween(
                                                  //             begin: begin,
                                                  //             end: end)
                                                  //         .chain(CurveTween(
                                                  //             curve: curve));

                                                  //     return SlideTransition(
                                                  //       position: animation
                                                  //           .drive(tween),
                                                  //       child: child,
                                                  //     );
                                                  //   },
                                                  // ));
                                                  Navigator.push(
                                                      context,
                                                      PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .bottomToTop,
                                                          child:
                                                              const DetailsYourSelf()));
                                                },
                                                child: Image.asset(
                                                  'assets/Vector (12).png',
                                                  height: size.height(context) *
                                                      .02,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerRight,
                                          height: size.height(context) * .04,
                                          width: size.width(context) * .37,
                                          child: const Text(
                                            '2.46 km away',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF000000),
                                                fontFamily: merriweather),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                  Positioned(
                    bottom: size.height(context) * .08,
                    child: SizedBox(
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
                                backgroundColor: liked
                                    ? const Color(0xFF7A112F)
                                    : Colors.white,
                                child: Image.asset(
                                  'assets/Vector (11).png',
                                  height: size.height(context) * .022,
                                  color: liked
                                      ? Colors.white
                                      : const Color(0xFF7A112F),
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
                                Navigator.pushNamed(
                                    context, GameScreen.routeName);
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
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
