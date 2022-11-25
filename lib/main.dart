import 'package:bmi/pages/bmiresult.dart';
import 'package:bmi/pages/dashboard.dart';
import 'package:bmi/pages/detailsscreen.dart';
import 'package:bmi/pages/splashscreen.dart';
import 'package:bmi/utils/route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: const Color.fromRGBO(39, 221, 177, 1)),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(),
        Routes.splashScreen: (context) => SplashScreen(),
        Routes.dashBoard: (context) => const DashBoard(),
        Routes.detailsScreen: (context) => const DetailsScreen(userName: ''),
        Routes.bmiResult: (context) =>
            const BMIResult(name: "", age: 0, weight: 0, height: 0, gender: "")
      },
    );
  }
}
