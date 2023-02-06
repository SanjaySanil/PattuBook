import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopzy/services/firebase_auth_repository/authentication_repository.dart';
import 'package:shopzy/views/pages/dashboard/dashboard.dart';
import 'package:shopzy/views/pages/login_details_screen/login_details.dart';
import 'package:shopzy/views/pages/on_boariding_screen/on_boarding_screen.dart';
import 'package:shopzy/views/pages/otp_screen/otp_screen.dart';
import 'package:shopzy/views/pages/sign_up_details/sign_up_details.dart';
import 'package:shopzy/views/widgets/theme/theme.dart';
import 'views/pages/otp_entry_screen/otp_entry_screen.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp()
      .then((value) => Get.put(AuthenticationRepository()));
  final prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt('initScreen');
  await prefs.setInt('initScreen', 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TTheme.lightTheme,
      darkTheme: TTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: initScreen == 0 || initScreen == null
          ? Routes.onBoardingScreen
          : Routes.loginSignUp,
      getPages: [
        GetPage(name: Routes.onBoardingScreen, page: () => OnBoardingScreen()),
        GetPage(
          name: Routes.loginSignUp,
          page: () => LoginSignUp(),
        ),
        GetPage(name: Routes.dashBoard, page: () => Dashboard()),
        GetPage(name: Routes.signUpScreen, page: () => SignupDetails()),
        GetPage(name: Routes.loginScreen, page: () => LoginDetails()),
      ],
    );
  }
}

class Routes {
  static const onBoardingScreen = "/";
  static const loginSignUp = "/loginSignUp";
  static const dashBoard = "/dashboard";
  static const signUpScreen = "/signUpScreen";
  static const loginScreen = "/loginScreen";
}
