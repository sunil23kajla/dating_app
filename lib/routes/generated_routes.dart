import 'package:dating/app_ui/details/ChooseHobbies.dart';
import 'package:dating/app_ui/details/ChoosePersonality.dart';
import 'package:dating/app_ui/details/ChooseSport.dart';
import 'package:dating/app_ui/details/DetailedExplanation.dart';
import 'package:dating/app_ui/details/Looking.dart';
import 'package:dating/app_ui/details/PhysicalInformation.dart';
import 'package:dating/app_ui/details/Relationship.dart';
import 'package:dating/app_ui/details/SexualPractises.dart';
import 'package:dating/app_ui/details/basicDetails.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/BottomNavigationBar.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/CoinsSceen.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/GameScreen.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Messages/ChattingScreen.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Messages/MessagesScreen.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/QuestionsAnswer.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/AddAccount.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/Blocklist.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/EmailScreen.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/Guide.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/GuideDetails.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/Help&Support.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/ManagePaymentAccount.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/PushNotification.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/RatingApp.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/SettingScreen.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/Team.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/HomePage/Setting/addPaymentCard.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/blogs/blogs.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/blogs/fullBlog.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/Notifications/NotificationsScreen.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/Profile/AddImage.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/Profile/EditProfile.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/Profile/GameResult.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/Profile/MyAlbum.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/Profile/ProfileScreen.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/plans/planRecharge.dart';
import 'package:dating/app_ui/screen/BottomNavigationBar/plans/plans.dart';
import 'package:dating/app_ui/screen/auth/ChangePassword.dart';
import 'package:dating/app_ui/screen/auth/forgotPassword.dart';
import 'package:dating/app_ui/screen/auth/loginScreen.dart';
import 'package:dating/app_ui/screen/auth/otpScreen.dart';
import 'package:dating/app_ui/screen/auth/signupScreen.dart';
import 'package:dating/app_ui/screen/splash/splash_screen.dart';
import 'package:dating/app_ui/screen/splash/splash_screennew.dart';
import 'package:flutter/material.dart';

import '../app_ui/screen/BottomNavigationBar/HomePage/HomePage.dart';

Route<dynamic> generatedRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const SplashScreen());

    case SplashScreenNew.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const SplashScreenNew());

    case LoginScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const LoginScreen());

    case SignupScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const SignupScreen());

    case ForgotPassword.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const ForgotPassword());

    case OtpScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const OtpScreen());

    case BasicDetail.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const BasicDetail());

    case ChoosePersonality.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const ChoosePersonality());

    case ChooseSport.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const ChooseSport());

    case ChooseHobbies.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const ChooseHobbies());

    case LookingScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const LookingScreen());

    case Relationship.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const Relationship());

    case SexualPractises.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const SexualPractises());

    case PhysicalInformation.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const PhysicalInformation());

    case DetailedExplanation.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const DetailedExplanation());

    case Bottom_NavigationBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Bottom_NavigationBar());

    case HomePage.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomePage());

    case GameScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const GameScreen());

    case QuestionsAnswer.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const QuestionsAnswer());

    case NotificationsScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const NotificationsScreen());

    case MessagesScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const MessagesScreen());

    case ChattingScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const ChattingScreen());

    case ProfileScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const ProfileScreen());

    case MyAlbumScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const MyAlbumScreen());

    case AddImages.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AddImages());

    case GameResultScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const GameResultScreen());

    case CoinsScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const CoinsScreen());

    case EditProfile.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const EditProfile());

    case SettingScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const SettingScreen());

    case BlocklistScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const BlocklistScreen());

    case EmailScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const EmailScreen());

    case PushNotification.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const PushNotification());

    case Team.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const Team());

    case ManagePaymentAccount.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const ManagePaymentAccount());

    case AddAccount.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AddAccount());

    case HelpSupport.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HelpSupport());

    case Guide.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const Guide());

    case GuideDetail.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const GuideDetail());

    case RatingAppScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const RatingAppScreen());

    case ChangePassword.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const ChangePassword());

    case PlansScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PlansScreen(),
      );

    case PlanRechargeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PlanRechargeScreen(),
      );

    case AddPaymentCardScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddPaymentCardScreen(),
      );

    case BlogListScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BlogListScreen(),
      );

    case FullBlogScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const FullBlogScreen(),
      );

    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                  body: Center(
                child: Text("404 Not found"),
              )));
  }
}
