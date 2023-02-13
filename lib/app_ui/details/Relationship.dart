import 'package:dating/app_ui/details/SexualPractises.dart';
import 'package:dating/constant/checkBoxDeta.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class Relationship extends StatefulWidget {
  const Relationship({Key? key}) : super(key: key);

  static const String routeName = '/relationship';

  @override
  State<Relationship> createState() => _RelationshipState();
}

class _RelationshipState extends State<Relationship> {
  var Relationshipvalue = List<bool>.filled(relationship.length, false);

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
            margin: EdgeInsets.only(
                bottom: size.height(context) * 0.05,
                right: size.width(context) * .22),
            child: const Text("Type of relationship",
                style: TextStyle(
                    color: Color(0xFF7A112F),
                    fontFamily: merriweather,
                    fontSize: 23,
                    fontWeight: FontWeight.w700)),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, SexualPractises.routeName);
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height(context) * .409,
                child: ListView.builder(
                    primary: false,
                    itemCount: relationship.length,
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
                                value: Relationshipvalue[i],
                                onChanged: (bool? val) => setState(
                                  () {
                                    setState(() {
                                      Relationshipvalue[i] = val!;
                                    });
                                  },
                                ),
                              ),
                              Text(relationship[i],
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
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, SexualPractises.routeName);
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
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
