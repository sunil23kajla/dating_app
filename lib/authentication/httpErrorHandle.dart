import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required BuildContext context,
  required http.Response res,
  required VoidCallback onSuccess,
}) async {
  if (res.statusCode == 200) {
    onSuccess();
  } else if (res.statusCode == 400 || res.statusCode == 401) {
    showSnackbar(context, jsonDecode(res.body)['msg']);
    Navigator.pop(context);
  } else if (res.statusCode == 500 || res.statusCode == 501) {
    showSnackbar(context, jsonDecode(res.body)['error']);
    Navigator.pop(context);
  } else {
    showSnackbar(context, jsonDecode(res.body));
    Navigator.pop(context);
  }
}

void showSnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
