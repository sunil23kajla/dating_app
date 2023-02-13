import 'package:dating/app_ui/screen/BottomNavigationBar/BottomNavigationBar.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/HomePage.dart';
import 'package:dating/app_ui/screen/splash/splash_screen.dart';
import 'package:dating/authentication/auth_service.dart';
import 'package:dating/providerData/userProvider.dart';
import 'package:dating/routes/generated_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  Future<dynamic> waitForToken() async {
    return await authService.getUserData(context);
  }

  late Future<dynamic> _future;

  @override
  void initState() {
    _future = waitForToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context).user;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: FutureBuilder(
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       print("c done");
      //       if (snapshot.hasError) {
      //         print("inside has error");
      //         return const SplashScreen();
      //       }
      //     } else if (snapshot.hasData) {
      //       print(snapshot.data);
      //       final data = snapshot.data.toString();
      //       if (data == SplashScreen.routeName) {
      //         print("data");
      //         return const SplashScreen();
      //       } else {
      //         print("bottom else");
      //         if (snapshot.data.toString() == user.token) {
      //           print("bottom");
      //           return const Bottom_NavigationBar();
      //         }
      //       }
      //     }
      //     print("re");
      //     return const SplashScreenNew();
      //   },
      //   future: _future,
      // ),
      home: const SplashScreen(),
      onGenerateRoute: (settings) => generatedRoutes(settings),
    );
  }
}
