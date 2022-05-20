import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobile_test/routes.dart';
import 'package:mobile_test/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        title: 'Mobile Test',
        //initialRoute: 'home',
        home: EasySplashScreen(
          logo: Image.asset('assets/logo.png'),
          logoSize: 100,
          backgroundColor: Colors.white,
          showLoader: true,
          loadingText: const Text("Cargando..."),
          loaderColor: Colors.black,
          navigator: HomePage(),
          durationInSeconds: 3,
        ),
        routes: getAppRoutes());
  }
}
