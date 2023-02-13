import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/HomePage.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/Notifications/NotificationsScreen.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/Profile/ProfileScreen.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/blogs/blogs.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/plans/plans.dart';
import 'package:flutter/material.dart';

import '../../../constant/constant.dart';

class Bottom_NavigationBar extends StatefulWidget {
  const Bottom_NavigationBar({Key? key}) : super(key: key);

  static const String routeName = "/bottom-navigationbar";

  @override
  State<Bottom_NavigationBar> createState() => _Bottom_NavigationBarState();
}

class _Bottom_NavigationBarState extends State<Bottom_NavigationBar> {
  int _selectedIndex = 0;

  late Color color;
  bool first = true;
  bool second = false;
  bool third = false;
  bool four = false;
  bool five = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = <Widget>[
      const HomePage(),
      const NotificationsScreen(),
      const ProfileScreen(),
      const PlansScreen(),
      const BlogListScreen(),
    ];

    DateTime preBackpress = DateTime.now();

    void _onItemTapped(int index) {
      if (index == 0) {
        setState(() {
          first = true;
          second = false;
          third = false;
          four = false;
          five = false;
          _selectedIndex = index;
        });
      } else if (index == 1) {
        setState(() {
          first = false;
          second = true;
          third = false;
          four = false;
          five = false;
          _selectedIndex = index;
        });
      } else if (index == 2) {
        setState(() {
          first = false;
          second = false;
          third = true;
          four = false;
          five = false;
          _selectedIndex = index;
        });
      } else if (index == 3) {
        setState(() {
          first = false;
          second = false;
          third = false;
          four = true;
          five = false;
          _selectedIndex = index;
        });
      } else if (index == 4) {
        setState(() {
          first = false;
          second = false;
          third = false;
          four = false;
          five = true;
          _selectedIndex = index;
        });
      }
    }

    var size = Sizess();
    return Scaffold(
        // backgroundColor: const Color(0xFFf5f5f5),
        body: Center(
          child: pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: WillPopScope(
          onWillPop: () async {
            if (_selectedIndex > 0) {
              Navigator.popAndPushNamed(
                  context, Bottom_NavigationBar.routeName);
              setState(() {
                _selectedIndex = 0;
              });
              return false;
            } else if (_selectedIndex == 0) {
              final timegap = DateTime.now().difference(preBackpress);
              preBackpress = DateTime.now();

              if (timegap >= const Duration(seconds: 2)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Press Back button again to Exit"),
                  ),
                );
                return false;
              } else {
                return true;
              }
            }
            return false;
          },
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: const Color(0xFFFFFFFF),
            selectedLabelStyle: null,
            unselectedLabelStyle: null,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/Vector (1).png',
                  height: size.height(context) * .025,
                  color:
                      first ? const Color(0xFFa41c4b) : const Color(0xFF8d8d8d),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/Vector (2).png',
                  height: size.height(context) * .025,
                  color: second
                      ? const Color(0xFFa41c4b)
                      : const Color(0xFF8d8d8d),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/Vector (3).png',
                  height: size.height(context) * .025,
                  color:
                      third ? const Color(0xFFa41c4b) : const Color(0xFF8d8d8d),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/Vector (4).png',
                  color:
                      four ? const Color(0xFFa41c4b) : const Color(0xFF8d8d8d),
                  height: size.height(context) * .025,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/Vector (5).png',
                  color:
                      five ? const Color(0xFFa41c4b) : const Color(0xFF8d8d8d),
                  height: size.height(context) * .025,
                ),
                label: "",
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ));
  }
}
