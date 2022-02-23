import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/data/model/response/lab_model.dart';
import 'package:sonocare_partner2/data/model/response/pharmacy_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/base/textFieldNotStyled.dart';
import 'package:sonocare_partner2/view/screens/lab/accept_lab_request/widgets/test_list_widget.dart';

class HospitalRequestCompletedScreen extends StatefulWidget {
  const HospitalRequestCompletedScreen({Key? key}) : super(key: key);

  @override
  State<HospitalRequestCompletedScreen> createState() => _PharmacyRequestCompletedScreenState();
}

class _PharmacyRequestCompletedScreenState extends State<HospitalRequestCompletedScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        const BackGround(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('Hospital Request'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(child: Text('Completed Successfully', style: TextStyle(fontSize: 20, color: Colors.white),),),
                const SizedBox(height: 16,),
                GestureDetector(
                  onTap: ()=>Get.offAllNamed('/hospital/dashboard'),
                  child: Container(
                    height: 55,
                    decoration: const BoxDecoration(
                        color: ColorResources.COLOR_PURPLE_DEEP,
                        borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                    child: const Center(child: Text('See Other Requests', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),)),
                  ),
                ),
                const SizedBox(height: 100,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
