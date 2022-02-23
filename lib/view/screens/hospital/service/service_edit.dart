import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/hospital_controller.dart';
import 'package:sonocare_partner2/controller/lab_controller.dart';
import 'package:sonocare_partner2/controller/pharmacy_controller.dart';
import 'package:sonocare_partner2/data/model/response/hospital_model.dart';
import 'package:sonocare_partner2/data/model/response/lab_model.dart';
import 'package:sonocare_partner2/data/model/response/pharmacy_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/base/textField.dart';
import 'package:sonocare_partner2/view/base/textFieldNotStyled.dart';

class HospitalServiceEditScreen extends StatefulWidget {
  const HospitalServiceEditScreen({Key? key}) : super(key: key);

  @override
  State<HospitalServiceEditScreen> createState() => _HospitalServiceEditScreenState();
}

class _HospitalServiceEditScreenState extends State<HospitalServiceEditScreen> {
  final serviceNameController = TextEditingController();

  final serviceCostController = TextEditingController();
  late HospitalServiceModel service;
  late int index;
  bool update = false;

  @override
  void initState() {
    if(Get.arguments!=null){
      update = true;
      service = Get.arguments['service'];
      index = Get.arguments['index'];
      serviceNameController.text=service.name;
      serviceCostController.text = "200";
    }
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
          appBar: AppBar(title: const Padding(
            padding: EdgeInsets.only(left: 0.0, top: 10.0, bottom: 20.0),
            child: Text('Service', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),),
          ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
                onTap: ()=>Navigator.pop(context),
                child: Image.asset(Images.backArrowIcon)),
          ),
          body: GetBuilder<HospitalController>(builder: (hospitalController) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ListView(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: serviceNameController,
                          validator: null,
                          enabled: true,
                          obscureText: false,
                          decoration: const InputDecoration(
                            //labelText: 'Enter your username',
                            hintStyle: TextStyle(
                                color: Colors.grey
                            ),
                            hintText: 'Enter Service Name',
                            contentPadding: EdgeInsets.symmetric(vertical: 5), //Change this value to custom as you like
                            isDense: true, // and add this line
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                  style: BorderStyle.none
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                  style: BorderStyle.none
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: serviceCostController,
                          validator: null,
                          enabled: true,
                          obscureText: false,
                          decoration: const InputDecoration(
                            //labelText: 'Enter your username',
                            hintStyle: TextStyle(
                                color: Colors.grey
                            ),
                            hintText: 'Enter Service Cost',
                            contentPadding: EdgeInsets.symmetric(vertical: 5), //Change this value to custom as you like
                            isDense: true, // and add this line
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                  style: BorderStyle.none
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                  style: BorderStyle.none
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18,),

                    hospitalController.loadingHospital?
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                        ],
                      ),
                    )
                        :Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 0, top: 20, bottom: 10),
                      child: Row(
                        children: [
                          Expanded(child: normalButton(
                              backgroundColor: ColorResources.COLOR_PURPLE_MID,
                              button_text: Get.arguments==null?'submit'.tr:'Update',
                              primaryColor: ColorResources.COLOR_WHITE,
                              fontSize: 16,
                              onTap: () async {

                                if(Get.arguments==null){
                                  hospitalController.addHospitalService(hospitalService: HospitalServiceModel(id: '', name: serviceNameController.text, cost: serviceCostController.text)).then((response){
                                    if(response){
                                      Get.back();
                                    }
                                  });
                                }else{
                                  print('index: ${index}');
                                  hospitalController.updateHospitalService(hospitalService: HospitalServiceModel(id: '', name: serviceNameController.text, cost: serviceCostController.text), index: index,).then((response){
                                    if(response){
                                      Get.back();
                                    }
                                  });
                                }
                              }
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ],
    );
  }
}
