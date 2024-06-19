import 'package:final_project/components/Admin/Crud/InputCar/InputCarComponent.dart';
import 'package:final_project/utils/constants.dart';
import 'package:flutter/material.dart';

class InputCarsScreen extends StatelessWidget {
  static var routeName = '/input_cars_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Input Data Cars",
            style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold)),
      ),
      body: InputCarComponent(),
    );
  }
}
