import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/data/model/response/util_models.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/screens/doctor/service_preference/service_reference_screen.dart';

import 'set_service_fee_screen.dart';
import 'widgets/lg_container.dart';
class ServicePreferenceListScreen extends StatefulWidget {
  const ServicePreferenceListScreen({Key? key}) : super(key: key);

  @override
  _ServicePreferenceScreenState createState() {
    return _ServicePreferenceScreenState();
  }
}

class _ServicePreferenceScreenState extends State<ServicePreferenceListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ConsultationType selectedConsultationType = ConsultationType(id: '', title: '');
  final feeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
          child: GetBuilder<AuthController>(builder: (authController) {
                if(authController.loadingConsultationFee){
                  return const Center(child: Text('Loading...', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, color: ColorResources.COLOR_WHITE),),);
                }else {
                  return Column(children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: ListView(children: List.generate(authController.consultationFeeList.length, (index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ServicePreferenceScreen(consultationFee:authController.consultationFeeList[index])),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Row(children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(authController.consultationFeeList[index].servicesType, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                                        const SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            Text("ID:${authController.consultationFeeList[index].id}", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                            const SizedBox(width: 20,),
                                            Text("₦${authController.consultationFeeList[index].price}", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                          ],
                                        ),
                                      ],)
                                  ],),
                                ),
                              ),
                            ),
                          );
                        }),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20, bottom: 20),
                      child: Row(
                        children: [
                          Expanded(child: normalButton(
                            backgroundColor: ColorResources.COLOR_PURPLE_MID,
                            button_text: 'Set Consultation',
                            primaryColor: ColorResources.COLOR_WHITE,
                            fontSize: 16,
                            onTap: (){
                              //SetServiceFeeScreen
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ServicePreferenceScreen()),
                              );
                            },
                          )),
                        ],
                      ),
                    ),
                  ],);
                }
              }
          ),
        ),
      )
    ],);
  }
}
