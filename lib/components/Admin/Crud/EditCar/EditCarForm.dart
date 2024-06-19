import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:final_project/components/custom_surfix_icon.dart';
import 'package:final_project/components/default_button_custom_color.dart';
import 'package:final_project/screens/admin/Crud/editCarScreen.dart';
import 'package:final_project/screens/admin/HomeAdminScreen.dart';
import 'package:final_project/size_config.dart';
import 'package:final_project/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormEditCar extends StatefulWidget {
  @override
  _FormEditCar createState() => _FormEditCar();
}

class _FormEditCar extends State<FormEditCar> {
  TextEditingController txtName = TextEditingController(
        text: '${EditCarsScreen.dataCar['name']}',
      ),
      txtQty = TextEditingController(text: '${EditCarsScreen.dataCar['qty']}'),
      txtCategoryId = TextEditingController(
          text: '${EditCarsScreen.dataCar['categoryId']}'),
      txtUrl = TextEditingController(text: '${EditCarsScreen.dataCar['url']}'),
      txtCreatedBy =
          TextEditingController(text: '${EditCarsScreen.dataCar['createdBy']}'),
      txtUpdatedBy =
          TextEditingController(text: '${EditCarsScreen.dataCar['updatedBy']}');

  FocusNode focusNode = new FocusNode();
  Response? response;
  var dio = Dio();

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
            color: kPrimaryColor,
            text: 'Submit',
            press: () {
              if (txtName.text == '') {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  title: 'Peringatan',
                  desc: 'Nama Mobil tidak boleh kosong',
                  btnOkOnPress: () {},
                ).show();
              } else if (txtQty.text == '') {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  title: 'Peringatan',
                  desc: 'Qty tidak boleh kosong',
                  btnOkOnPress: () {},
                ).show();
              } else if (txtCategoryId.text == '') {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  title: 'Peringatan',
                  desc: 'Category Id tidak boleh kosong',
                  btnOkOnPress: () {},
                ).show();
              } else if (txtUrl.text == '') {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  title: 'Peringatan',
                  desc: 'Url tidak boleh kosong',
                  btnOkOnPress: () {},
                ).show();
              } else if (txtCreatedBy.text == '') {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  title: 'Peringatan',
                  desc: 'Created By tidak boleh kosong',
                  btnOkOnPress: () {},
                ).show();
              } else if (txtUpdatedBy.text == '') {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  title: 'Peringatan',
                  desc: 'Updated By tidak boleh kosong',
                  btnOkOnPress: () {},
                ).show();
              } else {
                editDataCar(txtName.text, txtQty.text, txtCategoryId.text,
                    txtUrl.text, txtCreatedBy.text, txtUpdatedBy.text);
              }
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

  void editDataCar(name, qty, categoryId, url, createdBy, updatedBy) async {
    utilsApps.showDialog(context);
    bool status;
    var message;
    try {
      response = await dio.put(
        'http://192.168.200.21:3000/products/update/${EditCarsScreen.dataCar['id']}',
        data: {
          'name': name,
          'qty': qty,
          'categoryId': categoryId,
          'url': url,
          'createdBy': createdBy,
          'updatedBy': updatedBy,
        },
      );
      status = response!.data['success'];
      message = response!.data['message'];
      Navigator.pop(context);
      if (status) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          title: 'Peringatan',
          desc: '$message',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
            Navigator.pushNamed(context, AdminScreen.routeName);
          },
        ).show();
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Peringatan',
          desc: '$message',
          btnOkOnPress: () {
            utilsApps.hideDialog(context);
          },
        ).show();
      }
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
