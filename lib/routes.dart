import 'package:flutter/material.dart';
import 'package:mobile_test/src/pages/detail.dart';
import 'package:mobile_test/src/pages/favorites_page.dart';
import 'package:mobile_test/src/pages/home_page.dart';
import 'package:mobile_test/src/pages/settings_page.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    // 'login': (BuildContext context) => LoginPage(),
    // 'crearcuenta': (BuildContext context) => CreateAccountPage(),
    'home': (BuildContext context) => HomePage(),
    'detalle': (BuildContext context) => MovieDetail(),
    'favoritos': (BuildContext context) => FavoritesPage(),
    'ajustes': (BuildContext context) => SettingsPage(),
  };
}
