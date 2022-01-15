import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/lab_controller.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/base/textFieldNotStyled.dart';
import 'package:sonocare_partner2/view/screens/doctor/dashboard/dashboard_screen.dart';

import 'sub_cat_lab_test_screen.dart';

class LabTestSuccessfulScreen extends StatelessWidget {
  const LabTestSuccessfulScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        const DarkBackGround(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text('Lab Category'),
            elevation: 0,
            leading: GestureDetector(
                onTap: ()=>Navigator.pop(context),
                child: Image.asset(Images.backArrowIcon)),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Center(
              child: Text('Lab test recommended successfully',
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20, bottom: 20),
                child: Row(
                  children: [
                    Expanded(child: normalButton(
                      backgroundColor: ColorResources.COLOR_PURPLE_MID,
                      button_text: 'Go to Dashboard',
                      primaryColor: ColorResources.COLOR_WHITE,
                      fontSize: 16,
                      onTap: (){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        const DashboardDoctorScreen()), (Route<dynamic> route) => false);
                      },
                    )),
                  ],
                ),
              ),
          ],),
        )
      ],
    );
  }
}
