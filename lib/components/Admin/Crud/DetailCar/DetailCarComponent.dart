import 'package:final_project/components/Admin/Crud/DetailCar/DetailCarForm.dart';
import 'package:final_project/size_config.dart';
import 'package:final_project/utils/constants.dart';
import 'package:flutter/material.dart';

class DetailCarComponent extends StatefulWidget {
  @override
  _DetailCarComponent createState() => _DetailCarComponent();
}

class _DetailCarComponent extends State<DetailCarComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Detail Data Mobil!',
                        style: mTitleStyle,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                FormDetailCar(), // Di sini formulir ditampilkan
              ],
            ),
          ),
        ),
      ),
    );
  }
}
