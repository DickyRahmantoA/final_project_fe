import 'package:final_project/screens/login/LoginScreen.dart';
import 'package:final_project/screens/register/registrasi.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen()
};
