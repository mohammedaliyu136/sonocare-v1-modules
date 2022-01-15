import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sonocare_partner2/controller/appointment_controller.dart';
import 'package:sonocare_partner2/data/model/response/response_model.dart';
import 'package:sonocare_partner2/data/model/response/vital_sign_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/custom_snackbar.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/screens/nurse/dashboard/dashboard_screen.dart';

class VitalSign extends StatelessWidget {
  String vitalSignId;
  VitalSign({Key? key, required this.vitalSignId}) : super(key: key);
  final bloodPressureController = TextEditingController();
  final temperatureController = TextEditingController();
  final pulseRateController = TextEditingController();
  final respirationController = TextEditingController();
  final sp02Controller = TextEditingController();
  final bodyMassIndexController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: [
      const BackGround(),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Vital Sign'),
          elevation: 0,
          leading: GestureDetector(
              onTap: ()=>Navigator.pop(context),
              child: Image.asset(Images.backArrowIcon)),
        ),
        //VitalSignNurseProvider
        body: GetBuilder<AppointmentController>(builder: (appointmentController) {
            return SafeArea(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(children: [
                const SizedBox(height: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text('Blood pressure (BP)', style: TextStyle(color: Colors.white, fontSize: 18),),
                  const SizedBox(height: 8,),
                  Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(flex:8,child: TextField(textAlign: TextAlign.end, controller: bloodPressureController,)),
                          Expanded(flex:2,child: Container(child: const Text('mmHg'),))
                        ],
                      )),
                    const SizedBox(height: 10,),
                ],),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text('Temperature (T)', style: TextStyle(color: Colors.white, fontSize: 18),),
                  const SizedBox(height: 8,),
                  Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(flex:8,child: TextField(textAlign: TextAlign.end, controller: temperatureController,)),
                          Expanded(flex:2,child: Container(child: const Text('C'),))
                        ],
                      )),
                    const SizedBox(height: 10,),
                ],),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text('Pulse rate (PR)', style: const TextStyle(color: Colors.white, fontSize: 18),),
                  const SizedBox(height: 8,),
                  Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(flex:8,child: TextField(textAlign: TextAlign.end, controller: pulseRateController)),
                          Expanded(flex:2,child: Container(child: const Text('bpm'),))
                        ],
                      )),
                    const SizedBox(height: 10,),
                ],),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text('Respiration rate (RR)', style: TextStyle(color: Colors.white, fontSize: 18),),
                  const SizedBox(height: 8,),
                  Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(flex:8,child: TextField(textAlign: TextAlign.end, controller: respirationController,)),
                          Expanded(flex:2,child: Container(child: const Text(''),))
                        ],
                      )),
                    const SizedBox(height: 10,),
                ],),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text('Sp02', style: TextStyle(color: Colors.white, fontSize: 18),),
                  const SizedBox(height: 8,),
                  Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(flex:8,child: TextField(textAlign: TextAlign.end, controller: sp02Controller,)),
                          Expanded(flex:2,child: Container(child: const Text('%'),))
                        ],
                      )),
                    const SizedBox(height: 10,),
                ],),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text('Body mass index (BMI)', style: TextStyle(color: Colors.white, fontSize: 18),),
                  const SizedBox(height: 8,),
                  Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(flex:8,child: TextField(textAlign: TextAlign.end, controller: bodyMassIndexController,)),
                          Expanded(flex:2,child: Container(child: const Text(''),))
                        ],
                      )),
                    const SizedBox(height: 10,),
                ],),
              const SizedBox(height: 20,),
                if(appointmentController.isLoading)Row(mainAxisAlignment: MainAxisAlignment.center, children: const[CircularProgressIndicator(color: Colors.red,),],),
                if(!appointmentController.isLoading)Row(
                children: [
                  Expanded(
                    child: normalButton(
                      backgroundColor: ColorResources.COLOR_PURPLE_MID,
                      button_text: 'Submit',
                      primaryColor: ColorResources.COLOR_WHITE,
                      fontSize: 16, onTap: () {
                      appointmentController.updateVitalSign(
                          VitalSignModel2(
                              vitalSignId: int.parse(this.vitalSignId),
                              bloodPressure: bloodPressureController.text,
                              temperature: temperatureController.text,
                              pulseRate: pulseRateController.text,
                              respiration: respirationController.text,
                              sp02: sp02Controller.text,
                              bodyMassIdex: bodyMassIndexController.text
                          )
                      ).then((ResponseModel responseModel){
                        if(responseModel.isSuccess){
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) => const DashboardNurseScreen()),
                            ModalRoute.withName('/'),
                          );
                        }else{
                          showCustomSnackBar('Something went wrong', isError: true);
                        }
                      });

                    },
                    ),
                  ),
                ],
              )
              ],),
            ),);
          }
        ),
      )
    ],);
  }
}
