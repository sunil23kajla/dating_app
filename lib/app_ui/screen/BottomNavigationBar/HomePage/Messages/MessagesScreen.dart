import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Messages/ChattingScreen.dart';
import 'package:dating/constant/messageList.dart';
import 'package:flutter/material.dart';
import 'package:underline_indicator/underline_indicator.dart';

import '../../../../../constant/constant.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  static const String routeName = '/message-screen';

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen>
    with TickerProviderStateMixin {
  String? checked;
  var messagecheckbox = List<bool>.filled(messagelist.length, false);
  bool create = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    var size = Sizess();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFf5f5f5),
        appBar: AppBar(
          foregroundColor: const Color(0xFF7A112F),
          backgroundColor: const Color(0xFFf5f5f5),
          elevation: 0,
          title: const Text("Messages",
              style: TextStyle(
                  color: Color(0xFF7A112F),
                  fontFamily: merriweather,
                  fontSize: 23,
                  fontWeight: FontWeight.w700)),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(size.height(context) * 0.2),
            child: Container(
              margin:
                  EdgeInsets.symmetric(horizontal: size.width(context) * .05),
              child: Column(
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
                              BorderSide(width: 2, color: Color(0xFF7A112F)),
                        ),
                      )),
                  SizedBox(
                    height: size.height(context) * .015,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: _tabController.index > 0
                          ? () {}
                          : () {
                              setState(() {
                                create = true;
                              });
                            },
                      child: _tabController.index > 0
                          ? Container()
                          : Container(
                              height: size.height(context) * .045,
                              width: size.width(context) * .4,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF7A112F),
                                      Color(0xFFC92564)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                  color: const Color(0xFFF5F5F5)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.groups_rounded,
                                    color: Color(0xFFF5F5F5),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: size.width(context) * .02),
                                    child: const Text(
                                      'Create Group',
                                      style: TextStyle(
                                          fontFamily: inter,
                                          color: Color(0xFFF5F5F5),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      controller: _tabController,
                      indicator: const UnderlineIndicator(
                          strokeCap: StrokeCap.round, // Set your line endings.
                          borderSide: BorderSide(
                            color: Color(0xff7A112F),
                            width: 3,
                          ),
                          insets: EdgeInsets.only(bottom: 10)),
                      indicatorSize: TabBarIndicatorSize.label,
                      // splashBorderRadius: BorderRadius.circular(30),
                      isScrollable: true,
                      indicatorColor: const Color(0xFF7A112F),
                      indicatorWeight: 4.5,
                      labelColor: const Color(0xFF7A112F),
                      tabs: const [
                        Tab(
                          child: Text(
                            'Messages',
                            style: TextStyle(
                                fontFamily: merriweather,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Special messages',
                            style: TextStyle(
                                fontFamily: merriweather,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Groups',
                            style: TextStyle(
                                fontFamily: merriweather,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: WillPopScope(
          onWillPop: () async {
            if (create) {
              setState(() {
                create = !create;
              });
              return false;
            }
            return true;
          },
          child: TabBarView(controller: _tabController,
              // physics: const NeverScrollableScrollPhysics(),
              children: [
                messageWidget(size, context),
                spacialmessageWidget(size, context),
                groupWidget(size, context),
              ]),
        ),
      ),
    );
  }

  SizedBox messageWidget(Sizess size, BuildContext context) {
    return SizedBox(
      height: size.height(context),
      width: size.width(context),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: messagelist.length,
                itemBuilder: (context, index) {
                  var messageAllList = messagelist[index];
                  return create == true
                      ? Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width(context) * .05),
                              child: Row(
                                children: [
                                  Checkbox(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) =>
                                                (const Color(0xFF7A112F))),
                                    activeColor: const Color(0xFF7A112F),
                                    value: messagecheckbox[index],
                                    onChanged: (bool? val) => setState(
                                      () {
                                        setState(() {
                                          messagecheckbox[index] = val!;
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: size.width(context) * .18,
                                    // color: Colors.green,
                                    child: CircleAvatar(
                                        backgroundColor: Colors.greenAccent,
                                        // radius: size.height(context),
                                        child: Image.asset(
                                          messageAllList[0],
                                        )),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    // color: Colors.red,
                                    width: size.width(context) * .55,
                                    margin: EdgeInsets.symmetric(
                                      vertical: size.width(context) * .042,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          messageAllList[1],
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: inter,
                                              color: Color(0xFF000000),
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: size.height(context) * .01,
                                        ),
                                        Text(
                                          messageAllList[2],
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: inter,
                                              color: Color(0xFF626262),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                              color: Color(0xFFD1D1D1),
                            ),
                          ],
                        )
                      : InkWell(
                          onTap: (() {
                            Navigator.pushNamed(
                                context, ChattingScreen.routeName,
                                arguments: index);
                          }),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: size.width(context) * .04),
                                child: Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: size.width(context) * .18,
                                      // color: Colors.green,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.greenAccent,
                                          // radius: size.height(context),
                                          child: Image.asset(
                                            messageAllList[0],
                                          )),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      // color: Colors.red,
                                      width: size.width(context) * .7,
                                      margin: EdgeInsets.symmetric(
                                        vertical: size.width(context) * .042,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            messageAllList[1],
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontFamily: inter,
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            height: size.height(context) * .01,
                                          ),
                                          Text(
                                            messageAllList[2],
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontFamily: inter,
                                                color: Color(0xFF626262),
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 1,
                                color: Color(0xFFD1D1D1),
                              )
                            ],
                          ),
                        );
                }),
          ),
          create == true
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height(context) * .045,
                    width: size.width(context) * .35,
                    margin: EdgeInsets.only(
                        right: size.height(context) * .02,
                        bottom: size.height(context) * .05),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF7A112F), Color(0xFFC92564)],
                        ),
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xFFF5F5F5)),
                    child: InkWell(
                      onTap: () {
                        showDialog(
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
                                          alignment: Alignment.bottomLeft,
                                          child: const Text(
                                            'Group Name',
                                            style: TextStyle(
                                                fontFamily: inter,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          )),
                                      SizedBox(
                                        width: size.width(context),
                                        child: const TextField(
                                          keyboardType: TextInputType.text,
                                          cursorColor: Colors.green,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText:
                                                'Type your group name....',
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
                                              borderSide: BorderSide(
                                                  width: 1.5,
                                                  color: Color(0xFF858585)),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1.5,
                                                  color: Color(0xFF858585)),
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
                                          margin: EdgeInsets.only(
                                              bottom:
                                                  size.height(context) * .002),
                                          decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                colors: [
                                                  Color(0xFF7A112F),
                                                  Color(0xFFC92564)
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6),
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
                      },
                      child: const Text(
                        'Create Group',
                        style: TextStyle(
                            fontFamily: inter,
                            color: Color(0xFFF5F5F5),
                            fontWeight: FontWeight.w400,
                            fontSize: 13),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  SizedBox spacialmessageWidget(Sizess size, BuildContext context) {
    return SizedBox(
      height: size.height(context),
      width: size.width(context),
      child: ListView.builder(
          itemCount: spacialmessages.length,
          itemBuilder: (context, index) {
            var spacialmessagesList = spacialmessages[index];
            return InkWell(
              onTap: (() {
                Navigator.pushNamed(context, ChattingScreen.routeName,
                    arguments: index);
              }),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: size.width(context) * .05),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: size.width(context) * .18,
                          // color: Colors.green,
                          child: CircleAvatar(
                              backgroundColor: Colors.greenAccent,
                              // radius: size.height(context),
                              child: Image.asset(
                                spacialmessagesList[0],
                              )),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          // color: Colors.red,
                          width: size.width(context) * .7,
                          margin: EdgeInsets.symmetric(
                            vertical: size.width(context) * .042,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                spacialmessagesList[1],
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: inter,
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: size.height(context) * .01,
                              ),
                              Text(
                                spacialmessagesList[2],
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: inter,
                                    color: Color(0xFF626262),
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Color(0xFFD1D1D1),
                  )
                ],
              ),
            );
          }),
    );
  }

  SizedBox groupWidget(Sizess size, BuildContext context) {
    return SizedBox(
      height: size.height(context),
      width: size.width(context),
      child: ListView.builder(
          itemCount: groups.length,
          itemBuilder: (context, index) {
            var grouplist = groups[index];
            return InkWell(
              onTap: (() {
                Navigator.pushNamed(context, ChattingScreen.routeName,
                    arguments: index);
              }),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: size.width(context) * .05),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: size.width(context) * .18,
                          // color: Colors.green,
                          child: CircleAvatar(
                              backgroundColor: Colors.greenAccent,
                              // radius: size.height(context),
                              child: Image.asset(
                                grouplist[0],
                              )),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          // color: Colors.red,
                          width: size.width(context) * .7,
                          margin: EdgeInsets.symmetric(
                            vertical: size.width(context) * .042,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                grouplist[1],
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: inter,
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: size.height(context) * .01,
                              ),
                              Text(
                                grouplist[2],
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: inter,
                                    color: Color(0xFF626262),
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Color(0xFFD1D1D1),
                  )
                ],
              ),
            );
          }),
    );
  }
}
