// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dating/app_ui/screen/BottomNavigationBar/BottomNavigationBar.dart';
import 'package:dating/app_ui/screen/splash/splash_screen.dart';
import 'package:dating/authentication/httpErrorHandle.dart';
import 'package:dating/constantData.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_ui/details/ChoosePersonality.dart';
import '../app_ui/details/ChooseSport.dart';
import '../app_ui/details/basicDetails.dart';
import '../providerData/userProvider.dart';

class AuthService {
  Future<void> signupUser({
    required BuildContext context,
    required String username,
    required String phone,
    required String password,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      http.Response res = await http.post(
        Uri.parse("$url/api/user/"),
        body: jsonEncode({
          "username": username,
          "number": phone,
          "password": password,
        }),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
      );
      print(res.statusCode);
      print(res.body);
      // Navigator.pop(context);

      httpErrorHandle(
          context: context,
          res: res,
          onSuccess: () async {
            var userProvider =
                Provider.of<UserProvider>(context, listen: false);
            navigatorPop() => Navigator.pop(context);
            navigatorPushPop() =>
                Navigator.popAndPushNamed(context, BasicDetail.routeName);
            await prefs.setString(
                "x-auth-token", jsonDecode(res.body)["token"]);
            userProvider.setUser(res.body);
            navigatorPop();
            navigatorPushPop();

            //we have to use shared prefrence to save tokan
          });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> loginUser({
    required BuildContext context,
    required String phone,
    required String password,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      http.Response res = await http.post(
        Uri.parse("$url/api/user/login"),
        body: jsonEncode({
          "number": phone,
          "password": password,
        }),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
      );
      print(res.body);
      print(res.statusCode);
      httpErrorHandle(
          context: context,
          res: res,
          onSuccess: () async {
            var loginProvider =
                Provider.of<UserProvider>(context, listen: false);
            navigatorPop() => Navigator.pop(context);
            navigatorPushPop() => Navigator.popAndPushNamed(
                context, Bottom_NavigationBar.routeName);
            await prefs.setString(
                "x-auth-token", jsonDecode(res.body)["token"]);

            loginProvider.setUser(res.body);
            navigatorPop();
            navigatorPushPop();

            //we have to use shared prefrence to save tokan
          });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> getUserData(BuildContext context) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString("x-auth-token");

      if (token == null || token.isEmpty) {
        return SplashScreen.routeName;
      } else {
        http.Response resp = await http.post(
            Uri.parse("$url/api/userdetails/by-id/:${userProvider.user.id}"));
        await prefs.setString("x-auth-token", jsonDecode(resp.body)["token"]);
        userProvider.setUser(resp.body);
        return userProvider.user.token;
      }
    } catch (e) {
      // showSnackbar(context, e.toString());
      print("here is error $e");
    }
  }

  Future<void> basics({
    required BuildContext context,
    required String fullname,
    required String dob,
    required String gender,
    required String city,
    required String state,
    required String country,
    required String zodiac,
    required String income,
    required String occupation,
    required String maritalStatus,
    required String children,
    required String sexualOrientation,
  }) async {
    var userProvider = Provider.of<UserProvider>(context, listen: false).user;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("x-auth-token");

      print(userProvider.id);

      if (token != null && token.isNotEmpty) {
        http.Response res = await http.post(
          Uri.parse("$url/api/userdetails/${userProvider.id}"),
          body: jsonEncode({
            "fullname": fullname,
            "dob": dob,
            "gender": gender,
            "city": city,
            "state": state,
            "country": country,
            "zodiac": zodiac,
            "income": income,
            "occupation": occupation,
            "maritalStatus": maritalStatus,
            "children": children,
            "sexualOrientation": sexualOrientation,
          }),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
            "x-auth-token": token,
          },
        );

        print(res.body);
        print(res.statusCode);
        httpErrorHandle(
            context: context,
            res: res,
            onSuccess: () async {
              Provider.of<UserProvider>(context, listen: false);
              navigatorPop() => Navigator.pop(context);
              navigatorPushPop() => Navigator.popAndPushNamed(
                  context, ChoosePersonality.routeName);
              // await prefs.setString(
              //     "x-auth-token", jsonDecode(res.body)["token"]);
              // basicProvider.setUser(res.body);
              navigatorPop();
              navigatorPushPop();

              // we have to use shared prefrence to save tokan
            });
      }
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  Future<void> personalitys({
    required BuildContext context,
    required bool activeOrlikely,
    required bool generous,
    required bool shy,
    required bool ambitious,
    required bool fun,
    required bool imaginative,
    required bool reliable,
    required bool openMinded,
    required bool social,
    required bool chatty,
    required bool sophisticated,
    required bool outgoingOrtalkative,
    required bool honestOrfrank,
    required bool relaxedOrcasual,
    required bool cheerful,
    required bool modest,
    required bool selfConfident,
    required bool calm,
    required bool cultivated,
    required bool moody,
    required bool independent,
    required bool spiritual,
    required bool sensitive,
    required bool mature,
  }) async {
    var userProvider = Provider.of<UserProvider>(context, listen: false).user;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("x-auth-token");
      print(userProvider.id);
      if (token != null && token.isNotEmpty) {
        http.Response res = await http.post(
          Uri.parse("$url/api/personality/${userProvider.id}"),
          body: jsonEncode({
            "activeOrlikely": activeOrlikely,
            "generous": generous,
            "shy": shy,
            "ambitious": ambitious,
            "fun": fun,
            "imaginative": imaginative,
            "reliable": reliable,
            "openMinded": openMinded,
            "social": social,
            "chatty": chatty,
            "sophisticated": sophisticated,
            "outgoingOrtalkative": outgoingOrtalkative,
            "honestOrfrank": honestOrfrank,
            "relaxedOrcasual": relaxedOrcasual,
            "cheerful": cheerful,
            "modest": modest,
            "selfConfident": selfConfident,
            "calm": calm,
            "cultivated": cultivated,
            "moody": moody,
            "independent": independent,
            "spiritual": spiritual,
            "sensitive": sensitive,
            "mature": mature,
          }),
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8",
            "x-auth-token": token,
          },
        );
        print(res.body);
        print(res.statusCode);
        httpErrorHandle(
            context: context,
            res: res,
            onSuccess: () async {
              navigatorPop() => Navigator.pop(context);
              navigatorPushPop() =>
                  Navigator.popAndPushNamed(context, ChooseSport.routeName);

              navigatorPop();
              navigatorPushPop();

              // we have to use shared prefrence to save tokan
            });
      }
    } catch (e) {
      print(e);
    }
  }
}
