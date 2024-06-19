import 'package:final_project/components/Admin/Crud/InputCar/InputCarForm.dart';
import 'package:final_project/size_config.dart';
import 'package:final_project/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class InputCarComponent extends StatefulWidget {
  @override
  _InputCarComponent createState() => _InputCarComponent();
}

class _InputCarComponent extends State<InputCarComponent> {
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
                      'Input Data Car !',
                      style: mTitleStyle,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FormInputCar()
            ],
          ),
        ),
      ),
    ));
  }
}
