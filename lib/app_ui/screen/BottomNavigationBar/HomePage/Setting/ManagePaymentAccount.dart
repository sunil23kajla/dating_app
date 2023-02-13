import 'package:flutter/material.dart';

import '../../../../../constant/constant.dart';

class ManagePaymentAccount extends StatefulWidget {
  const ManagePaymentAccount({Key? key}) : super(key: key);

  static const String routeName = '/manage-payment-account';

  @override
  State<ManagePaymentAccount> createState() => _ManagePaymentAccountState();
}

class _ManagePaymentAccountState extends State<ManagePaymentAccount> {
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
          'Manage Payment Account',
          style: TextStyle(
              fontSize: 18.0,
              fontFamily: merriweather,
              color: Color(0xFF7A112F),
              fontWeight: FontWeight.w700),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(size.height(context) * 0.015),
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
              const Text(
                  'Enim gravida lacus scelerisque dolor aliquet. Tincidunt iaculis diam faucibus gravida mi nisl mi tempus amet. Sagittis adipiscing quisque enim pellentesque malesuada eros ornare. Risus pellentesque pulvinar at vestibulum lacus convallis feugiat pharetra odio.',
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: inter,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF858585),
                  )),
              SizedBox(height: size.height(context) * .07),
              InkWell(
                onTap: () {},
                child: Container(
                  height: size.height(context) * .055,
                  width: size.width(context) * .91,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFFC92564),
                          Color(0xFF7A112F),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(7)),
                  child: const Center(
                      child: Text(
                    "Add Account",
                    style: TextStyle(
                      fontFamily: inter,
                      color: Color(0xFFF5F5F5),
                      fontSize: 16,
                    ),
                  )),
                ),
              ),
              SizedBox(height: size.height(context) * .04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: size.height(context) * .002,
                    width: size.width(context) * .35,
                    margin: EdgeInsets.only(left: size.width(context) * .06),
                    color: const Color(0xFF858585),
                  ),
                  const Text(
                    'Or',
                    style: TextStyle(
                      fontFamily: inter,
                      color: Color(0xFF858585),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    height: size.height(context) * .002,
                    width: size.width(context) * .35,
                    margin: EdgeInsets.only(right: size.width(context) * .06),
                    color: const Color(0xFF858585),
                  ),
                ],
              ),
              SizedBox(height: size.height(context) * .04),
              InkWell(
                onTap: () {},
                child: Container(
                  height: size.height(context) * .055,
                  width: size.width(context) * .91,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border:
                          Border.all(width: 2, color: const Color(0xFF7A112F))),
                  child: const Center(
                      child: Text(
                    "Delete Account",
                    style: TextStyle(
                        fontFamily: inter,
                        color: Color(0xFF7A112F),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
