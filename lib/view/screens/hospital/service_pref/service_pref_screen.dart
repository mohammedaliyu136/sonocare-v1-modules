import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'widgets/lg_container.dart';

class ServicePreferenceScreen extends StatefulWidget {
  const ServicePreferenceScreen({Key? key}) : super(key: key);

  @override
  _ServicePreferenceScreenState createState() {
    return _ServicePreferenceScreenState();
  }
}

class _ServicePreferenceScreenState extends State<ServicePreferenceScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        const BackGround(),
        GetBuilder<AuthController>(builder: (authController) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: const Text('Service Preference', style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: GestureDetector(
                    onTap: ()=>Get.back(),
                    child: Image.asset(Images.backArrowIcon)),
              ),
              body: Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 18, top: 10, bottom: 0),
                child: ListView(children: [
                  const Text('set fees and services preference', style: TextStyle(color: Colors.white),),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    child: LGConatiner(heading: 'Independent', body: 'Decide your consultation fees and consult only with patients willing to pay your services',),
                    onTap: (){},
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    child: LGConatiner(heading: 'Tarrif Based', body: 'Consult with patients using sonocare subscription plans only',),
                    onTap: (){},
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    child: LGConatiner(heading: 'Combined', body: 'See both PAYGO patients and subscription based patient',),
                    onTap: (){},
                  ),
                  const SizedBox(height: 20,),
                ],),
              )
            );
          }
        ),
      ],
    );
  }
}
