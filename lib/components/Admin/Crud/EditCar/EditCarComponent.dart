import 'package:final_project/components/Admin/Crud/EditCar/EditCarForm.dart';
import 'package:final_project/size_config.dart';
import 'package:final_project/utils/constants.dart';
import 'package:flutter/material.dart';

class EditCarComponent extends StatefulWidget {
  @override
  _EditCarComponent createState() => _EditCarComponent();
}

class _EditCarComponent extends State<EditCarComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Edit Data Car !',
                      style: mTitleStyle,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FormEditCar()
            ],
          ),
        ),
      ),
    ));
  }
}
