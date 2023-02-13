import 'package:dating/app_ui/screen/BottomNavigationBar/plans/planRecharge.dart';
import 'package:dating/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../BottomNavigationBar.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({super.key});
  static const routeName = "/plans";

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  var price = ["20", "30", "40", "50", "60"];
  var coins = ["200", "300", "400", "500", "600"];
  @override
  Widget build(BuildContext context) {
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
          'Plans',
          style: TextStyle(
              fontSize: 18.0,
              fontFamily: merriweather,
              color: Color(0xFF7A112F),
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 26),
            child: TextFormField(
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
                    borderSide: BorderSide(width: 2, color: Color(0xFF7A112F)),
                  ),
                )),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  PlanWidget(price: price[index], coins: coins[index]),
              itemCount: price.length,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          )
        ],
      ),
    );
  }
}

class PlanWidget extends StatelessWidget {
  final bool isSelected;
  final String price, coins;
  const PlanWidget({
    super.key,
    this.isSelected = false,
    required this.price,
    required this.coins,
  });

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(
        fontSize: 15, fontWeight: FontWeight.bold, fontFamily: inter);
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).pushNamed(PlanRechargeScreen.routeName,
            arguments: {"price": price, "coins": coins});
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFFFFFFF),
            border: isSelected
                ? const GradientBoxBorder(
                    width: 2,
                    gradient: LinearGradient(
                      colors: [Color(0xFF7A112F), Color(0xFFC92564)],
                    ),
                  )
                : null,
            boxShadow: const [
              BoxShadow(
                offset: Offset(
                  0,
                  3,
                ),
                blurRadius: 6,
                color: Colors.black12,
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$$price",
                    style: textStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/Dollar Coin2.png",
                        height: 30,
                      ),
                      Text(
                        " $coins Coins ",
                        style: textStyle,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff0D1EB1),
                        size: 13.2,
                      )
                    ],
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Text(
                "View Details",
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Color(0xff626262),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: inter),
              ),
            )
          ],
        ),
      ),
    );
  }
}
