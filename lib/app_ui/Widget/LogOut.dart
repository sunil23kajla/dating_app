import 'package:flutter/material.dart';

import '../screen/auth/loginScreen.dart';

AlertDialog LogoutWidget(BuildContext context) {
  return AlertDialog(
    content: SizedBox(
      height: 150,
      child: Column(
        children: <Widget>[
          const Text('Are you sure you want to logout?',
              style: TextStyle(fontSize: 20)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7A112F),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const LoginScreen())),
                        (route) => false);
                  }),
              ElevatedButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          )
        ],
      ),
    ),
  );
}
