import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:final_project/screens/admin/Crud/detailCarScreen.dart';
import 'package:final_project/screens/admin/Crud/editCarScreen.dart';
import 'package:final_project/size_config.dart';
import 'package:final_project/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeAdminComponent extends StatefulWidget {
  @override
  _HomeAdminComponent createState() => _HomeAdminComponent();
}

class _HomeAdminComponent extends State<HomeAdminComponent> {
  Response? response;
  var dio = Dio();
  var dataCar;

  @override
  void initState() {
    super.initState();
    getDataCar();
  }

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
                SizedBox(height: getProportionateScreenHeight(20)),
                Container(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: dataCar == null ? 0 : dataCar.length,
                    itemBuilder: (BuildContext context, int index) {
                      return cardDataCar(dataCar[index]);
                    },
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cardDataCar(data) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailCarsScreen.routeName,
            arguments: data);
      },
      child: Card(
        elevation: 10.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(width: 1.0, color: Colors.white24))),
              child: Image.network(
                '${data['url']}',
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.broken_image, size: 50);
                },
              ),
            ),
            title: Text(
              "${data['name']}",
              style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, EditCarsScreen.routeName,
                        arguments: data);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.edit, color: kColorYellow),
                      SizedBox(width: 5),
                      Text("Edit",
                          style: TextStyle(
                              color: mTitleColor, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Peringatan',
                      desc: 'Yakin Ingin Menghapus ${data['name']} ?',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        hapusCar('${data['id']}');
                      },
                    ).show();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: kColorRedSlow),
                      SizedBox(width: 5),
                      Text("Hapus",
                          style: TextStyle(
                              color: mTitleColor, fontWeight: FontWeight.bold))
                    ],
                  ),
                )
              ],
            ),
            trailing: Icon(Icons.keyboard_arrow_right,
                color: mTitleColor, size: 30.0),
          ),
        ),
      ),
    );
  }

  void getDataCar() async {
    try {
      response = await dio.get('http://192.168.200.21:3000/products/');
      if (response!.data['success']) {
        setState(() {
          dataCar = response!.data['data'];
        });
      } else {
        showErrorDialog(response!.data['message']);
      }
    } catch (e) {
      showErrorDialog('Terjadi kesalahan server');
    }
  }

  void hapusCar(id) async {
    try {
      response =
          await dio.delete('http://192.168.200.21:3000/products/delete/$id');
      if (response!.data['success']) {
        showSuccessDialog(response!.data['message']);
        getDataCar();
      } else {
        showErrorDialog(response!.data['message']);
      }
    } catch (e) {
      showErrorDialog('Terjadi kesalahan server');
    }
  }

  void showErrorDialog(String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: 'Peringatan',
      desc: message,
      btnOkOnPress: () {
        utilsApps.hideDialog(context);
      },
    ).show();
  }

  void showSuccessDialog(String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Berhasil',
      desc: message,
      btnOkOnPress: () {
        utilsApps.hideDialog(context);
      },
    ).show();
  }
}
