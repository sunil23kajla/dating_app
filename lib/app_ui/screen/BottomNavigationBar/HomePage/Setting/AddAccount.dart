import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/addPaymentCard.dart';
import 'package:flutter/material.dart';

import '../../../../../constant/constant.dart';

class AddAccount extends StatefulWidget {
  const AddAccount({Key? key}) : super(key: key);

  static const String routeName = '/add-account';

  @override
  State<AddAccount> createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
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
          'Payment',
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
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Payment Options',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF000000),
                      fontFamily: inter,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: size.height(context) * .02,
              ),
              ListTile(
                leading: Image.asset(
                  'assets/Vector (112).png',
                  height: size.height(context) * .05,
                ),
                title: const Text(
                  'Net Banking',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF000000),
                      fontFamily: inter,
                      fontWeight: FontWeight.w600),
                ),
                trailing: const Icon(
                  Icons.arrow_forward,
                  color: Color(0xFF7A112F),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              ListTile(
                leading: Image.asset(
                  'assets/bhim 1.png',
                  height: size.height(context) * .05,
                ),
                title: const Text(
                  'UPI',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF000000),
                      fontFamily: inter,
                      fontWeight: FontWeight.w600),
                ),
                trailing: const Icon(
                  Icons.arrow_forward,
                  color: Color(0xFF7A112F),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              ListTile(
                onTap: () => Navigator.pushNamed(
                    context, AddPaymentCardScreen.routeName),
                leading: Image.asset(
                  'assets/credit-card 1.png',
                  height: size.height(context) * .05,
                ),
                title: const Text(
                  'Credit/Debit/ATM Card',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF000000),
                      fontFamily: inter,
                      fontWeight: FontWeight.w600),
                ),
                trailing: const Icon(
                  Icons.arrow_forward,
                  color: Color(0xFF7A112F),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              ListTile(
                leading: Image.asset(
                  'assets/card 1.png',
                  height: size.height(context) * .05,
                ),
                title: const Text(
                  'EMI',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF000000),
                      fontFamily: inter,
                      fontWeight: FontWeight.w600),
                ),
                trailing: const Icon(
                  Icons.arrow_forward,
                  color: Color(0xFF7A112F),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
