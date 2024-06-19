import 'package:final_project/components/Admin/Crud/DetailCar/DetailCarComponent.dart';
import 'package:final_project/size_config.dart';
import 'package:final_project/utils/constants.dart';
import 'package:flutter/material.dart';

class DetailCarsScreen extends StatelessWidget {
  static var routeName = '/detail_cars_screen';
  static var dataCar;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    dataCar = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Detail Data Mobil",
            style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold)),
      ),
      body: DetailCarComponent(),
    );
  }
}
