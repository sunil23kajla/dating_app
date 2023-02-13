import 'package:dating/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class CoinsScreen extends StatefulWidget {
  const CoinsScreen({Key? key}) : super(key: key);

  static const String routeName = '/coins-screen';

  @override
  State<CoinsScreen> createState() => _CoinsScreenState();
}

class _CoinsScreenState extends State<CoinsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = Sizess();
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFf5f5f5),
          foregroundColor: const Color(0xFF7A112F),
          title: const Text('Coins'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(size.height(context) * 0.03),
            child: Container(),
          )),
      body: Container(
        height: size.height(context),
        width: size.width(context),
        padding: EdgeInsets.symmetric(horizontal: size.width(context) * .05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height(context) * .12,
                width: size.width(context),
                padding:
                    EdgeInsets.symmetric(horizontal: size.width(context) * .06),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFFFFF),
                    border: const GradientBoxBorder(
                      width: 2,
                      gradient: LinearGradient(
                        colors: [Color(0xFF7A112F), Color(0xFFC92564)],
                      ),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(
                          0,
                          4,
                        ),
                        blurRadius: 12,
                        color: Color.fromARGB(44, 0, 0, 0),
                      ),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/Dollar Coin2.png',
                      height: size.height(context) * .065,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Coins left',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: inter,
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: size.height(context) * .01,
                        ),
                        const Text(
                          '150/200',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: inter,
                              color: Color(0xFF626262),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )
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
