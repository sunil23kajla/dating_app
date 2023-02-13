import 'package:flutter/material.dart';

import '../../../../../constant/constant.dart';

class PushNotification extends StatefulWidget {
  const PushNotification({Key? key}) : super(key: key);

  static const String routeName = '/push-notification';

  @override
  State<PushNotification> createState() => _PushNotificationState();
}

class _PushNotificationState extends State<PushNotification> {
  bool newMatches = false;
  bool newMessages = false;
  bool newLikes = false;
  bool superLikes = false;
  bool topPicks = false;

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
          'Push Notifications',
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width(context) * .04),
        height: size.height(context),
        width: size.width(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width(context),
                height: size.height(context) * .50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFDEDEDE),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'New Matches',
                        style: TextStyle(
                            fontFamily: inter,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text(
                        'You just got a new match',
                        style: TextStyle(
                            fontFamily: inter,
                            color: Color(0xFF000000),
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith(
                              (states) => (const Color(0xFF7A112F))),
                          activeColor: const Color(0xFF7A112F),
                          value: newMatches,
                          onChanged: (value) {
                            setState(() {
                              newMatches = value!;
                            });
                          }),
                    ),
                    ListTile(
                      title: const Text(
                        'New Messages',
                        style: TextStyle(
                            fontFamily: inter,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text(
                        'Someone sent you a new message',
                        style: TextStyle(
                            fontFamily: inter,
                            color: Color(0xFF000000),
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith(
                              (states) => (const Color(0xFF7A112F))),
                          activeColor: const Color(0xFF7A112F),
                          value: newMessages,
                          onChanged: (value) {
                            setState(() {
                              newMessages = value!;
                            });
                          }),
                    ),
                    ListTile(
                      title: const Text(
                        'Message Likes',
                        style: TextStyle(
                            fontFamily: inter,
                            fontSize: 14,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text(
                        'Someone liked your message',
                        style: TextStyle(
                            fontFamily: inter,
                            color: Color(0xFF000000),
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith(
                              (states) => (const Color(0xFF7A112F))),
                          activeColor: const Color(0xFF7A112F),
                          value: newLikes,
                          onChanged: (value) {
                            setState(() {
                              newLikes = value!;
                            });
                          }),
                    ),
                    ListTile(
                      title: const Text(
                        'Super Likes',
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: inter,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text(
                        'You’ve been super liked! swipe to found out by whom',
                        style: TextStyle(
                            fontFamily: inter,
                            color: Color(0xFF000000),
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith(
                              (states) => (const Color(0xFF7A112F))),
                          activeColor: const Color(0xFF7A112F),
                          value: superLikes,
                          onChanged: (value) {
                            setState(() {
                              superLikes = value!;
                            });
                          }),
                    ),
                    ListTile(
                      title: const Text(
                        'Top Picks',
                        style: TextStyle(
                            fontFamily: inter,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text(
                        'Your daily top picks are ready!',
                        style: TextStyle(
                            fontFamily: inter,
                            color: Color(0xFF000000),
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                      trailing: Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith(
                              (states) => (const Color(0xFF7A112F))),
                          activeColor: const Color(0xFF7A112F),
                          value: topPicks,
                          onChanged: (value) {
                            setState(() {
                              topPicks = value!;
                            });
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
