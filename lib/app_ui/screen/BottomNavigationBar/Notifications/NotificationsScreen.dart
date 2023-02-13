import 'package:dating/app_ui/screen/BottomNavigationBar/BottomNavigationBar.dart';
import 'package:dating/constant/NotificationList.dart';
import 'package:dating/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:underline_indicator/underline_indicator.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  static const String routeName = '/notification-screen';

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = Sizess();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFf5f5f5),
        appBar: AppBar(
          foregroundColor: const Color(0xFF7A112F),
          backgroundColor: const Color(0xFFf5f5f5),
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.popAndPushNamed(
                  context, Bottom_NavigationBar.routeName);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFF7A112F),
            ),
          ),
          title: const Text("Notifications",
              style: TextStyle(
                  color: Color(0xFF7A112F),
                  fontFamily: merriweather,
                  fontSize: 23,
                  fontWeight: FontWeight.w700)),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(size.height(context) * 0.15),
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      indicator: const UnderlineIndicator(
                          strokeCap: StrokeCap.round, // Set your line endings.
                          borderSide: BorderSide(
                            color: Color(0xff7A112F),
                            width: 3,
                          ),
                          insets: EdgeInsets.only(bottom: 10)),
                      indicatorSize: TabBarIndicatorSize.label,
                      splashBorderRadius: BorderRadius.circular(30),
                      isScrollable: true,
                      indicatorColor: const Color(0xFF7A112F),
                      indicatorWeight: 4.5,
                      labelColor: const Color(0xFF7A112F),
                      tabs: const [
                        Tab(
                          child: Text(
                            'Notifications',
                            style: TextStyle(
                                fontFamily: merriweather,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Requests',
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
        body: TabBarView(
          // physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            ListView.builder(
                itemCount: notification.length,
                itemBuilder: (context, index) {
                  var notificationlists = notification[index];
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width(context) * .05),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: size.width(context) * .13,
                              // color: Colors.green,
                              child: CircleAvatar(
                                  backgroundColor: Colors.greenAccent,
                                  // radius: size.height(context),
                                  child: Image.asset(
                                    notificationlists[0],
                                    height: 50,
                                  )),
                            ),
                            Container(
                              // color: Colors.red,
                              width: size.width(context) * .76,
                              margin: EdgeInsets.symmetric(
                                vertical: size.width(context) * .05,
                              ),
                              child: Text(
                                notificationlists[1],
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: inter,
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1.2,
                        color: Color(0xFFD1D1D1),
                      )
                    ],
                  );
                }),
            SizedBox(
              height: size.height(context),
              width: size.width(context),
              child: ListView.builder(
                  itemCount: notificationrequest.length,
                  itemBuilder: (context, index) {
                    var notificationrequestlists = notificationrequest[index];
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width(context) * .05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                width: size.width(context) * .13,
                                // color: Colors.green,
                                child: CircleAvatar(
                                    backgroundColor: Colors.greenAccent,
                                    // radius: size.height(context),
                                    child: Image.asset(
                                      notificationrequestlists[0],
                                      height: 55,
                                    )),
                              ),
                              Container(
                                  // color: Colors.red,
                                  width: size.width(context) * .3,
                                  margin: EdgeInsets.symmetric(
                                    vertical: size.width(context) * .04,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle.of(context).style,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: notificationrequestlists[1],
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontFamily: inter,
                                              color: Color(0xFF000000),
                                              fontWeight: FontWeight.w500),
                                        ),
                                        TextSpan(
                                          text: notificationrequestlists[2],
                                          style: const TextStyle(
                                              fontSize: 13,
                                              fontFamily: inter,
                                              color: Color(0xFF50555C),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  )),
                              InkWell(
                                onTap: () {
                                  print('accept');
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: size.width(context) * .05,
                                  ),
                                  height: size.height(context) * .038,
                                  width: size.width(context) * .18,
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF7A112F),
                                          Color(0xFFC92564)
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                      color: const Color(0xFFF5F5F5)),
                                  child: const Center(
                                      child: Text(
                                    'Accept',
                                    style: TextStyle(
                                        fontFamily: inter,
                                        color: Color(0xFFF5F5F5),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  )),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  print('Reject');
                                },
                                child: Container(
                                  height: size.height(context) * .038,
                                  width: size.width(context) * .18,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: const Color(0xFF7A112F)),
                                    borderRadius: BorderRadius.circular(6),
                                    // color: const Color(0xFFF5F5F5)
                                  ),
                                  child: const Center(
                                      child: Text(
                                    'Reject',
                                    style: TextStyle(
                                        fontFamily: inter,
                                        color: Color(0xFF7A112F),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1.2,
                          color: Color(0xFFD1D1D1),
                        )
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
