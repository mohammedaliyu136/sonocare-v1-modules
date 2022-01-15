import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/data/model/response/response_model.dart';
import 'package:sonocare_partner2/data/model/response/util_models.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/base/textField.dart';

import 'set_service_fee_screen.dart';
import 'widgets/lg_container.dart';
class ServicePreferenceScreen extends StatefulWidget {
  ConsultationFee? consultationFee;
  ServicePreferenceScreen({Key? key, this.consultationFee}) : super(key: key);

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

  ConsultationType selectedConsultationType = ConsultationType(id: '', title: '');
  final feeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    if(widget.consultationFee!=null){
      setState(() {
        feeController.text=widget.consultationFee!.price;
      });
    }
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
              return Column(children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: ListView(children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 10),
                        child: Text('Set Fee and Service Preference', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 1.12, height: 1.5),),
                      ),
                      //SetServiceFeeScreen
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Icon(Icons.person, color: Colors.transparent,),
                                ),
                                SizedBox(width: 1,child: Container(color: Colors.white,), height: 64,),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0, bottom: 0),
                                    child: Stack(
                                      //mainAxisAlignment: MainAxisAlignment.start,
                                      //crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text('Consultation', textAlign: TextAlign.start, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
                                        if(!authController.loadingConsultationType)Padding(
                                          padding: const EdgeInsets.only(top:10.0),
                                          child: DropdownButton<ConsultationType>(
                                            isExpanded: true,
                                            dropdownColor: ColorResources.COLOR_PURPLE_DEEP,
                                            underline: Container(color: Colors.transparent),
                                            items: authController.consultationTypeList.map((ConsultationType consultationType) {
                                              return DropdownMenuItem<ConsultationType>(
                                                value: consultationType,
                                                child: Text(consultationType.title.trim(), style: const TextStyle(color: Colors.white),),
                                              );
                                            }).toList(),
                                            onChanged: (value){
                                              setState(() {
                                                selectedConsultationType = value!;
                                              });
                                            },
                                            //value: formVerificationProvider.selectedNurseType.id,
                                            //value: formVerificationProvider.selectedDoctorType.id==''?authController.doctorTypeList[0]:formVerificationProvider.selectedDoctorType,
                                            value: selectedConsultationType.id==''?authController.consultationTypeList[0]:selectedConsultationType,
                                            //value: authController.doctorTypeList[0],
                                          ),
                                        ),
                                        if(authController.loadingConsultationType)Padding(
                                          padding: const EdgeInsets.only(top:30.0),
                                          child: Row(children: [Text('Loading Consultation Type', style: TextStyle(color: ColorResources.COLOR_WHITE),),],),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width,child: Container(color: Colors.white,), height: 1,),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      textField(label: 'Fee', icon: const Icon(Icons.account_circle_outlined, color: Colors.transparent,), hintText: 'Enter Consultation Fee', controller: feeController, validator: (){}, onChanged: (){}),


                      if(authController.loadingConsultationFee)Row(mainAxisAlignment: MainAxisAlignment.center, children: [const CircularProgressIndicator(color: Colors.red,),],),
                      if(!authController.loadingConsultationFee)Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20, bottom: 20),
                        child: Row(
                          children: [
                            Expanded(child: normalButton(
                              backgroundColor: ColorResources.COLOR_PURPLE_MID,
                              button_text: 'Save',
                              primaryColor: ColorResources.COLOR_WHITE,
                              fontSize: 16,
                              onTap: (){
                                ConsultationFee consultation = ConsultationFee(id: '', servicesType: selectedConsultationType.id==''?authController.consultationTypeList[0].title:selectedConsultationType.title, price: feeController.text);
                                authController.setConsultationFee(consultation).then((ResponseModel response){
                                  if(response.isSuccess){
                                    authController.getConsultationFee();
                                    Navigator.pop(context);
                                  }
                                });
                              },
                            )),
                          ],
                        ),
                      ),

                    ],),
                  ),
                )
              ],);
            }
          ),
        ),
      )
    ],);
  }
}
