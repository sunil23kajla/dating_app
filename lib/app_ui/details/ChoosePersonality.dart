import 'package:dating/app_ui/details/ChooseSport.dart';
import 'package:dating/constant/constant.dart';
import 'package:flutter/material.dart';

import '../../authentication/auth_service.dart';
import '../../constant/checkBoxDeta.dart';

class ChoosePersonality extends StatefulWidget {
  const ChoosePersonality({Key? key}) : super(key: key);

  static const String routeName = '/choose-personality';

  @override
  State<ChoosePersonality> createState() => _ChoosePersonalityState();
}

class _ChoosePersonalityState extends State<ChoosePersonality> {
  var valuefirst = List<bool>.filled(personality.length, false);

  var activeOrlikely = false;
  var generous = false;
  var shy = false;
  var ambitious = false;
  var fun = false;
  var imaginative = false;
  var reliable = false;
  var openMinded = false;
  var social = false;
  var chatty = false;
  var sophisticated = false;
  var outgoingOrtalkative = false;
  var honestOrfrank = false;
  var relaxedOrcasual = false;
  var cheerful = false;
  var modest = false;
  var selfConfident = false;
  var calm = false;
  var cultivated = false;
  var moody = false;
  var independent = false;
  var spiritual = false;
  var sensitive = false;
  var mature = false;

  final AuthService personalityDetails = AuthService();

  Future<void> personalitys() async {
    for (var i = 0; i < valuefirst.length; i++) {
      if (valuefirst[i] == true) {}
    }
    await personalityDetails.personalitys(
        context: context,
        activeOrlikely: activeOrlikely,
        generous: generous,
        shy: shy,
        ambitious: ambitious,
        fun: fun,
        imaginative: imaginative,
        reliable: reliable,
        openMinded: openMinded,
        social: social,
        chatty: chatty,
        sophisticated: sophisticated,
        outgoingOrtalkative: outgoingOrtalkative,
        honestOrfrank: honestOrfrank,
        relaxedOrcasual: relaxedOrcasual,
        cheerful: cheerful,
        modest: modest,
        selfConfident: selfConfident,
        calm: calm,
        cultivated: cultivated,
        moody: moody,
        independent: independent,
        spiritual: spiritual,
        sensitive: sensitive,
        mature: mature);
  }

  void showProgressIndicator() {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const CircularProgressIndicator(
                color: Color.fromRGBO(122, 17, 47, 1),
              ),
            ),
          ),
        );
      },
    );
  }

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
                right: size.width(context) * .12),
            child: const Text("Choose your personality",
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
                Navigator.pushNamed(context, ChooseSport.routeName);
              },
              child: const Text('Skip',
                  style: TextStyle(
                      color: Color(0xFF818181),
                      fontFamily: inter,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)))
        ],
      ),
      body: SizedBox(
        height: size.height(context),
        width: size.width(context),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  primary: false,
                  itemCount: personality.length,
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
                              value: valuefirst[i],
                              onChanged: (bool? val) => setState(
                                () {
                                  setState(() {
                                    valuefirst[i] = val!;
                                    if (i == 0) {
                                      activeOrlikely = val;
                                    } else if (i == 1) {
                                      generous = val;
                                    } else if (i == 2) {
                                      shy = val;
                                    } else if (i == 3) {
                                      ambitious = val;
                                    } else if (i == 4) {
                                      fun = val;
                                    } else if (i == 5) {
                                      imaginative = val;
                                    } else if (i == 6) {
                                      reliable = val;
                                    } else if (i == 7) {
                                      openMinded = val;
                                    } else if (i == 8) {
                                      social = val;
                                    } else if (i == 9) {
                                      chatty = val;
                                    } else if (i == 10) {
                                      cheerful = val;
                                    } else if (i == 11) {
                                      modest = val;
                                    } else if (i == 12) {
                                      selfConfident = val;
                                    } else if (i == 13) {
                                      calm = val;
                                    } else if (i == 14) {
                                      cultivated = val;
                                    } else if (i == 15) {
                                      moody = val;
                                    } else if (i == 16) {
                                      independent = val;
                                    } else if (i == 17) {
                                      spiritual = val;
                                    } else if (i == 18) {
                                      sensitive = val;
                                    } else if (i == 19) {
                                      mature = val;
                                    } else if (i == 20) {
                                      sophisticated = val;
                                    } else if (i == 21) {
                                      outgoingOrtalkative = val;
                                    } else if (i == 22) {
                                      honestOrfrank = val;
                                    } else {
                                      relaxedOrcasual = val;
                                    }
                                  });
                                },
                              ),
                            ),
                            Text(personality[i],
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
        onTap: () async {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          Navigator.pushNamed(context, ChooseSport.routeName);
          // showProgressIndicator();
          // await personalitys();
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
