import 'package:final_project/components/Admin/Crud/EditCar/EditCarComponent.dart';
import 'package:final_project/size_config.dart';
import 'package:final_project/utils/constants.dart';
import 'package:flutter/material.dart';

class EditCarsScreen extends StatelessWidget {
  static var routeName = '/edit_cars_screen';
  static var dataCar;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    dataCar = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Edit Data Car",
            style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold)),
      ),
      body: EditCarComponent(),
    );
  }
}
