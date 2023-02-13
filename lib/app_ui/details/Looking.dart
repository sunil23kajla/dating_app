import 'package:dating/app_ui/details/Relationship.dart';
import 'package:dating/constant/checkBoxDeta.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class LookingScreen extends StatefulWidget {
  const LookingScreen({Key? key}) : super(key: key);

  static const String routeName = '/looking-screen';

  @override
  State<LookingScreen> createState() => _LookingScreenState();
}

class _LookingScreenState extends State<LookingScreen> {
  String? check;
  var lookingvalue = List<bool>.filled(looking.length, false);

  @override
  Widget build(BuildContext context) {
    var size = Sizess();
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      appBar: AppBar(
        foregroundColor: const Color(0xFF7A112F),
        backgroundColor: const Color(0xFFf5f5f5),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(size.height(context) * 0.10),
          child: Container(
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.only(
                bottom: size.height(context) * 0.05,
                left: size.width(context) * .05),
            child: const Text("Looking for..",
                style: TextStyle(
                    color: Color(0xFF7A112F),
                    fontFamily: merriweather,
                    fontSize: 23,
                    fontWeight: FontWeight.w700)),
          ),
        ),
        actions: [
          Radio(
            activeColor: const Color(0xFF7A112F),
            value: '',
            groupValue: check,
            onChanged: (value) {
              setState(() {
                check = value.toString();
              });
            },
          ),
          Container(
            padding: EdgeInsets.only(
              top: size.height(context) * 0.023,
            ),
            child: const Text('Hide',
                style: TextStyle(
                    color: Color(0xFF818181),
                    fontFamily: inter,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Relationship.routeName);
              },
              child: const Text('Skip',
                  style: TextStyle(
                      color: Color(0xFF818181),
                      fontFamily: inter,
                      fontSize: 16,
                      fontWeight: FontWeight.w600))),
        ],
      ),
      body: SizedBox(
        height: size.height(context),
        width: size.width(context),
        child: Column(
          children: [
            // GridView.builder(
            //     primary: false,
            //     physics: const NeverScrollableScrollPhysics(),
            //     gridDelegate:
            //         const SliverGridDelegateWithFixedCrossAxisCount(
            //             // maxCrossAxisExtent: 200,
            //             crossAxisCount: 2,
            //             childAspectRatio: 2 / .5,
            //             crossAxisSpacing: 0,
            //             mainAxisSpacing: 0),
            //     itemCount: looking.length,
            //     itemBuilder: (_, i) {
            //       return Row(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //           SizedBox(
            //             width: size.width(context) * .5,
            //             child: Row(children: [
            //               Checkbox(
            //                 shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(4)),
            //                 checkColor: Colors.white,
            //                 fillColor: MaterialStateProperty.resolveWith(
            //                     (states) => (const Color(0xFF7A112F))),
            //                 activeColor: const Color(0xFF7A112F),
            //                 value: lookingvalue[i],
            //                 onChanged: (bool? val) => setState(
            //                   () {
            //                     setState(() {
            //                       lookingvalue[i] = val!;
            //                     });
            //                   },
            //                 ),
            //               ),
            //               Text(looking[i],
            //                   style: const TextStyle(
            //                       color: Color(0xFF7A112F),
            //                       fontFamily: inter,
            //                       fontSize: 15,
            //                       fontWeight: FontWeight.w500))
            //             ]),
            //           ),
            //         ],
            //       );
            //     }),
            Expanded(
              child: ListView.builder(
                  primary: false,
                  itemCount: looking.length,
                  itemBuilder: (_, i) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width(context),
                          child: Row(children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.resolveWith(
                                  (states) => (const Color(0xFF7A112F))),
                              activeColor: const Color(0xFF7A112F),
                              value: lookingvalue[i],
                              onChanged: (bool? val) => setState(
                                () {
                                  setState(() {
                                    lookingvalue[i] = val!;
                                  });
                                },
                              ),
                            ),
                            Text(looking[i],
                                style: const TextStyle(
                                    color: Color(0xFF7A112F),
                                    fontFamily: inter,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500))
                          ]),
                        ),
                      ],
                    );
                  }),
            ),
            SizedBox(
              height: size.height(context) * .08,
            )
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Relationship.routeName);
        },
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          height: size.height(context) * .055,
          width: size.width(context) * .35,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFE36B99),
                  Color(0xFF811634),
                ],
              ),
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xFFF5F5F5)),
          child: const Center(
              child: Text(
            'Next',
            style: TextStyle(
                fontFamily: inter,
                color: Color(0xFFF5F5F5),
                fontWeight: FontWeight.w400,
                fontSize: 15),
          )),
        ),
      ),
    );
  }
}
