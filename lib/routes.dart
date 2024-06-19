import 'package:final_project/screens/admin/Crud/detailCarScreen.dart';
import 'package:final_project/screens/admin/Crud/editCarScreen.dart';
import 'package:final_project/screens/admin/Crud/inputCarScreen.dart';
import 'package:final_project/screens/admin/HomeAdminScreen.dart';
import 'package:final_project/screens/login/LoginScreen.dart';
import 'package:final_project/screens/register/registrasi.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  // LoginRegister
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),

  // Admin
  AdminScreen.routeName: (context) => AdminScreen(),
  InputCarsScreen.routeName: (context) => InputCarsScreen(),
  EditCarsScreen.routeName: (context) => EditCarsScreen(),
  DetailCarsScreen.routeName: (context) => DetailCarsScreen()
};
