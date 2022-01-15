import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/data/model/body/signup_body.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/custom_snackbar.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/base/outLineButton.dart';
import 'package:sonocare_partner2/view/base/textField.dart';
import 'package:sonocare_partner2/view/screens/auth/sign_in_screen.dart';

class SelectAccountTypeScreen extends StatefulWidget {
  const SelectAccountTypeScreen({Key? key}) : super(key: key);

  @override
  _SelectAccountTypeScreenState createState() {
    return _SelectAccountTypeScreenState();
  }
}

class _SelectAccountTypeScreenState extends State<SelectAccountTypeScreen> {
  int selectedAccountType = -1;
  List<String> accountTypes = ['doctor', 'nurse', 'lab', 'pharmacy', 'ambulance', 'logistic'];

  @override
  void initState() {
    Get.find<AuthController>().getStates(context);
    Get.find<AuthController>().getServicePreferences();
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
            appBar: AppBar(title: const Text('You are a', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),), backgroundColor: Colors.transparent, elevation: 0,),
            body: SafeArea(
              child: Stack(
                children: [
                  ListView(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 13.0, right: 13.0, top: 14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          accountTypeWidget(context:context, index:1, text:'DOCTOR',image:Images.doctorCategoryImage),
                          accountTypeWidget(context:context, index:2, text:'NURSE',image:Images.nurseCategoryImage),
                      ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13.0,right: 13.0, top: 13.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          accountTypeWidget(context:context, index:3, text:'LABORATORY',image:Images.labCategoryImage),
                          accountTypeWidget(context:context, index:4, text:'PHARMACY',image:Images.pharmacyCategoryImage),
                        ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13.0,right: 13.0, top: 13.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          accountTypeWidget(context:context, index:5, text:'AMBULANCE',image:Images.ambulanceCategoryImage),
                          accountTypeWidget(context:context, index:6, text:'LOGISTIC',image:Images.logisticCategoryImage),
                        ],),
                    ),
                  ],),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0, right: 40, top: 0, bottom: 10),
                      child: Row(
                        children: [
                          Expanded(child: normalButton(
                              backgroundColor: ColorResources.COLOR_PURPLE_MID,
                              button_text: 'Continue',
                              primaryColor: ColorResources.COLOR_WHITE,
                              fontSize: 16,
                              onTap: (){
                                print(accountTypes[selectedAccountType-1]);
                                Get.toNamed('/sign-up', arguments: accountTypes[selectedAccountType-1]);
                              }
                          )),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            )
            )
      ],
    );
  }

  GestureDetector accountTypeWidget({required BuildContext context, required int index, required String text, required String image}) {
    return GestureDetector(
              onTap: ()=>setState(() {selectedAccountType=index;}),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)), color: Colors.grey,
                    image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.fill)
                ),
                width: MediaQuery.of(context).size.width/2-20, height: 150,
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.check_circle, color: selectedAccountType==index?Colors.green:Colors.transparent, size: 60,)),
                    Align(alignment: Alignment.bottomCenter,child: Container(color:Colors.white.withOpacity(0.7),child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),],),
                    )),)
                  ],
                ),
              ),
    );
  }
}
