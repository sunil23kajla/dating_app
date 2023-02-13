import 'package:dating/app_ui/screen/BottomNavigationBar/BottomNavigationBar.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/AddAccount.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/ManagePaymentAccount.dart';
import 'package:dating/constant/constant.dart';
import 'package:flutter/material.dart';

class PlanRechargeScreen extends StatelessWidget {
  const PlanRechargeScreen({super.key});
  static const routeName = "/plan-recharge";

  @override
  Widget build(BuildContext context) {
    Map<String, String> args = (ModalRoute.of(context)?.settings.arguments ??
        <String, String>{}) as Map<String, String>;
    var size = Sizess();
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf5f5f5),
        foregroundColor: const Color(0xFF7A112F),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.popAndPushNamed(context, Bottom_NavigationBar.routeName);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xFF7A112F),
          ),
        ),
        title: const Text(
          'Pack details',
          style: TextStyle(
              fontSize: 18.0,
              fontFamily: merriweather,
              color: Color(0xFF7A112F),
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(21, 12, 21, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "\$${args['price']}",
                style: textStyle(21),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/Dollar Coin2.png",
                      height: 30,
                    ),
                    Text(
                      "${args['coins']} Coins",
                      style: textStyle(15),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              const Divider(
                height: 2.1,
                thickness: 0.6,
                color: Color(0xffadadad),
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 3.0),
                        blurRadius: 6.0,
                      ),
                    ]),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: const ExpansionTile(
                    trailing: Icon(
                      Icons.expand_more,
                      color: Colors.black,
                    ),
                    title: Text(
                      'TERMS & CONDITIONS',
                      style: TextStyle(
                        color: Color(0xff626262),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: inter,
                      ),
                    ),
                    children: <Widget>[
                      Text('All Terms and conditions here...'),
                      Text('All Terms and conditions here...'),
                      Text('All Terms and conditions here...'),
                      Text('All Terms and conditions here...'),
                      Text('All Terms and conditions here...'),
                      Text('All Terms and conditions here...'),
                      SizedBox(height: 21)
                    ],
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AddAccount.routeName);
                },
                child: Container(
                  height: size.height(context) * .055,
                  width: size.width(context) * .91,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFFE36B99),
                          Color(0xFFA02145),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(7)),
                  child: const Center(
                      child: Text(
                    "Recharge Now",
                    style: TextStyle(
                      fontFamily: inter,
                      color: Color(0xFFF5F5F5),
                      fontSize: 16,
                    ),
                  )),
                ),
              ),
            ],
          )),
    );
  }

  TextStyle textStyle(double size) {
    return TextStyle(
        fontSize: size, fontWeight: FontWeight.bold, fontFamily: inter);
  }
}
