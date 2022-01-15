import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/data/model/response/lab_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/base/textFieldNotStyled.dart';
import 'package:sonocare_partner2/view/screens/lab/accept_lab_request/widgets/test_list_widget.dart';

class AcceptLabRequestScreen extends StatefulWidget {
  const AcceptLabRequestScreen({Key? key}) : super(key: key);

  @override
  State<AcceptLabRequestScreen> createState() => _AcceptLabRequestScreenState();
}

class _AcceptLabRequestScreenState extends State<AcceptLabRequestScreen> {
  LabRequestsModel? labRequestsModel;
  @override
  void initState() {
    labRequestsModel = Get.arguments;
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
            toolbarHeight: 1,
            backgroundColor: ColorResources.COLOR_PURPLE_MID,
            elevation: 0,
            leading: const Icon(Icons.ten_k_outlined, color: Colors.transparent,),
          ),
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: ColorResources.COLOR_PURPLE_MID,
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              400, 150.0)
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 38.0, top: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SafeArea(
                            child: Column(
                              children: [
                                //SizedBox(height: 20,),
                                Container(
                                  height: 120,
                                  width: 120,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(100)),
                                      image:DecorationImage(
                                        fit:BoxFit.fill,
                                        //image: AssetImage("assets/dummy/profile_dummy.png"),
                                        image: NetworkImage('image'),
                                      )
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                //Todo: add loading...
                                Text(labRequestsModel!.patientProfile.name, style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //Navigator.pop(context);
                      Get.back();
                    },
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(children: [
                          Image.asset(Images.backArrowIcon),
                          const SizedBox(width: 30,),
                          const Text('Accept Lab Requests', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),),
                        ],),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:30.0, bottom: 8, left: 15, right: 15),
                child: Row(children: const [
                  Text('Appointment', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: 1.1),)
                ],),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(children: [
                  //  26th May 2021 (09:00 AM - 10 PM)
                  Expanded(child: Text('${labRequestsModel!.date} (${labRequestsModel!.time})', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white, letterSpacing: 1.1),))
                ],),
              ),
              Padding(
                padding: const EdgeInsets.only(top:30.0, bottom: 8, left: 15, right: 15),
                child: Row(children: const [
                  Text('List of Test', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: 1.1),)
                ],),
              ),
              //testListWidget(rowNumber: 1, rowText: 'Malaria Test'),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 15),
                child: Column(
                  children: List.generate(labRequestsModel!.tests.length, (index) => testListWidget(rowNumber: index+1, rowText: labRequestsModel!.tests[index].name))//labRequestsModel!.tests.map((e) => testListWidget(rowNumber: 1, rowText: 'Malaria Test')).toList(),
                ),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Expanded(child: normalButton(
                      button_text: 'Decline',
                      fontSize: 14,
                      primaryColor: ColorResources.COLOR_WHITE,
                      backgroundColor: ColorResources.COLOR_PURPLE_DEEP,
                      onTap: () {},
                    )),
                    const SizedBox(width: 30,),
                    Expanded(child: normalButton(
                      button_text: 'Accept',
                      fontSize: 14,
                      primaryColor: ColorResources.COLOR_WHITE,
                      backgroundColor: ColorResources.COLOR_PURPLE_DEEP,
                      onTap: () {
                        Get.toNamed('/lab/medical/report');
                      },
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 20,)
            ],
          ),),
      ],
    );
  }
}
