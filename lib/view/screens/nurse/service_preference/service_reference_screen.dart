import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';

import 'set_service_fee_screen.dart';
import 'widgets/lg_container.dart';

class ServicePreferenceNurseScreen extends StatefulWidget {
  const ServicePreferenceNurseScreen({Key? key}) : super(key: key);

  @override
  State<ServicePreferenceNurseScreen> createState() => _ServicePreferenceNurseScreenState();
}

class _ServicePreferenceNurseScreenState extends State<ServicePreferenceNurseScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackGround(),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Service Preference'),
          leading: GestureDetector(
              onTap: ()=>Navigator.pop(context),
              child: Image.asset(Images.backArrowIcon)),
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: ListView(children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 10),
                    child: Text('Set Fee and Service Preference', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 1.12, height: 1.5),),
                  ),
                  //SetServiceFeeScreen
                  GetBuilder<AuthController>(builder: (authController) {
                        if(authController.loadingNurseServices){
                          return const Center(child: Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Text('Loading...', style: TextStyle(color: Colors.white, fontSize: 16),),
                          ));
                        }else{
                          return Column(
                            children: List<Widget>.generate(authController.nurseServicesList.length, (index) {
                              return service_fee_widget(
                                  onTab: ()=>Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SetServiceFeeScreen(preference: authController.nurseServicesList[index].title,)),),
                                  title: authController.nurseServicesList[index].title
                              );
                            }),
                          );
                        }
                    }
                  ),
                ],),
              ),
            )
          ],),
        ),
      )
    ],);
  }
}
