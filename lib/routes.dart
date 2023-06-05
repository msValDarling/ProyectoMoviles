import 'package:cakecraft/screens/CakeCraftHome.dart';
import 'package:cakecraft/screens/DashboardScreen.dart';
import 'package:cakecraft/screens/Onboarding.dart';
import 'package:cakecraft/screens/PhotoUploadScreen.dart';
import 'package:cakecraft/screens/loginScreen.dart';
import 'package:cakecraft/screens/registerScreen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/home': (BuildContext context) => CakeCraftHome(),
    '/login': (BuildContext context) => LoginScreen(),
    '/register': (BuildContext context) => RegisterScreen(),
    '/dash': (BuildContext context) => DashboardScreen(),
    '/photoup': (BuildContext context) => PhotoUploadScreen(),
    '/onboarding': (BuildContext context) => Onboarding()
  };
}
