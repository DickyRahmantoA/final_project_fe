import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:final_project/components/custom_surfix_icon.dart';
import 'package:final_project/components/default_button_custom_color.dart';
import 'package:final_project/screens/admin/Crud/detailCarScreen.dart';
import 'package:final_project/screens/admin/HomeAdminScreen.dart';
import 'package:final_project/size_config.dart';
import 'package:final_project/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class FormDetailCar extends StatefulWidget {
  @override
  _FormDetailCarState createState() => _FormDetailCarState();
}

class _FormDetailCarState extends State<FormDetailCar> {
  TextEditingController txtName = TextEditingController(
        text: '${DetailCarsScreen.dataCar['name']}',
      ),
      txtQty =
          TextEditingController(text: '${DetailCarsScreen.dataCar['qty']}'),
      txtCategoryId = TextEditingController(
          text: '${DetailCarsScreen.dataCar['categoryId']}'),
      txtUrl =
          TextEditingController(text: '${DetailCarsScreen.dataCar['url']}'),
      txtCreatedBy = TextEditingController(
          text: '${DetailCarsScreen.dataCar['createdBy']}'),
      txtUpdatedBy = TextEditingController(
          text: '${DetailCarsScreen.dataCar['updatedBy']}');

  FocusNode focusNode = new FocusNode();
  Response? response;
  var dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataCarById();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildName(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildQty(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildCategoryId(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildUrl(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildCreatedBy(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildUpdatedBy(),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButtonCustomeColor(
            color: kColorRedSlow,
            text: 'Kembali',
            press: () {
              Navigator.pushNamed(context, AdminScreen.routeName);
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  TextFormField buildName() {
    return TextFormField(
      controller: txtName,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Nama Mobil',
          hintText: 'Masukan Nama Mobil',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.car_repair)),
    );
  }

  TextFormField buildQty() {
    return TextFormField(
      controller: txtQty,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Qty',
          hintText: 'Masukan Qty',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.production_quantity_limits)),
    );
  }

  TextFormField buildCategoryId() {
    return TextFormField(
      controller: txtCategoryId,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Category Id',
          hintText: 'Masukan Category Id',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(
            Icons.category,
          )),
    );
  }

  TextFormField buildUrl() {
    return TextFormField(
      controller: txtUrl,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Url',
          hintText: 'Masukan Url',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(
            Icons.link,
          )),
    );
  }

  TextFormField buildCreatedBy() {
    return TextFormField(
      controller: txtCreatedBy,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Created By',
          hintText: 'Masukan Created By',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/User.svg",
          )),
    );
  }

  TextFormField buildUpdatedBy() {
    return TextFormField(
      controller: txtUpdatedBy,
      keyboardType: TextInputType.number,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Updated By',
          hintText: 'Masukan Updated By',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/User.svg",
          )),
    );
  }

  void getDataCarById() async {
    try {
      response = await dio.get(
        'http://192.168.200.21:3000/products/${DetailCarsScreen.dataCar['id']}',
        data: {},
      );
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Peringatan',
        desc: 'Terjadi kesalahan server',
        btnOkOnPress: () {},
      ).show();
    }
  }
}
