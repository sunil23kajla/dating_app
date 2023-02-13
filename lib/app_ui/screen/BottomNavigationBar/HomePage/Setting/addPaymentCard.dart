import 'package:dating/constant/constant.dart';
import 'package:flutter/material.dart';

class AddPaymentCardScreen extends StatefulWidget {
  const AddPaymentCardScreen({super.key});
  static const routeName = "/add-payment-card";

  @override
  State<AddPaymentCardScreen> createState() => _AddPaymentCardScreenState();
}

class _AddPaymentCardScreenState extends State<AddPaymentCardScreen> {
  bool _saveCard = true;
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
          'Payment Accounts',
          style: TextStyle(
              fontSize: 18.0,
              fontFamily: merriweather,
              color: Color(0xFF7A112F),
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                minLeadingWidth: 20,
                contentPadding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                leading: Image.asset(
                  'assets/credit-card 1.png',
                  height: size.height(context) * .044,
                ),
                title: const Text(
                  'Credit/Debit/ATM Card',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF000000),
                      fontFamily: inter,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 3),
              textfield("Cardholder Name"),
              const SizedBox(height: 25),
              textfield("Card Number"),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width(context) * 0.4,
                    child: textfield("Exp. Date"),
                  ),
                  SizedBox(
                    width: size.width(context) * 0.4,
                    child: textfield("CVV"),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    visualDensity:
                        const VisualDensity(horizontal: -4, vertical: -4),
                    activeColor: const Color(0xff7A112F),
                    value: _saveCard,
                    onChanged: (value) {
                      setState(() {
                        _saveCard = !_saveCard;
                      });
                    },
                  ),
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      setState(() {
                        _saveCard = !_saveCard;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Save this card for faster payment.",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: inter,
                            fontSize: 12.5),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height(context) * 0.45,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
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
                    "Pay Now",
                    style: TextStyle(
                      fontFamily: inter,
                      color: Color(0xFFF5F5F5),
                      fontSize: 16,
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField textfield(String hint) {
    return TextField(
      decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xff7A112F),
          )),
          hintText: hint,
          hintStyle: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 16),
          contentPadding: const EdgeInsets.fromLTRB(8, 8, 8, 6),
          isDense: true),
    );
  }
}
