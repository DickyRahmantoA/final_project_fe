import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:final_project/components/Admin/HomeAdminComponent.dart';
import 'package:final_project/screens/admin/Crud/inputCarScreen.dart';
import 'package:final_project/screens/login/LoginScreen.dart';
import 'package:final_project/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:final_project/size_config.dart';

class AdminScreen extends StatelessWidget {
  static String routeName = "/home_admin_screens";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Cars Shop",
          style: TextStyle(color: mTitleColor, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        leading: const Icon(
          Icons.home,
          color: mTitleColor,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, InputCarsScreen.routeName);
            },
            child: const Row(
              children: [
                Icon(
                  Icons.add,
                  color: mTitleColor,
                ),
                Text("Input Data",
                    style: TextStyle(
                        color: mTitleColor, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: HomeAdminComponent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.info,
            animType: AnimType.rightSlide,
            title: 'Peringatan',
            desc: 'Yakin ingin keluar dari aplikasi ?',
            btnCancelOnPress: () {},
            btnCancelText: 'Tidak',
            btnOkText: 'Yakin',
            btnOkOnPress: () {
              Navigator.pushNamed(context, LoginScreen.routeName);
            },
          ).show();
        },
        backgroundColor: kColorRedSlow,
        child: Icon(
          Icons.logout,
          color: Colors.white,
        ),
      ),
    );
  }
}
