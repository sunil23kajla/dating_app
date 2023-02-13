import 'package:dating/constant/constant.dart';
import 'package:flutter/material.dart';

class Team extends StatefulWidget {
  const Team({Key? key}) : super(key: key);

  static const String routeName = '/team';

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  bool team = false;
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
          'Team',
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width(context),
                height: size.height(context) * .1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFDEDEDE),
                ),
                child: ListTile(
                  title: const Text(
                    'Team',
                    style: TextStyle(
                        fontFamily: inter,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text(
                    'I want to receive news, updates, and offers from our app',
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
                      value: team,
                      onChanged: (value) {
                        setState(() {
                          team = value!;
                        });
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
