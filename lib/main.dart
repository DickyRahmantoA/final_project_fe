import 'package:final_project/routes.dart';
import 'package:final_project/screens/login/LoginScreen.dart';
import 'package:final_project/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MaterialApp(
    title: 'Car Shop',
    theme: theme(),
    initialRoute: LoginScreen.routeName,
    routes: routes,
  ));
}
