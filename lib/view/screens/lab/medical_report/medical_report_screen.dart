import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/base/textField.dart';
import 'package:sonocare_partner2/view/base/textFieldNotStyled.dart';

class MedicalReportScreen extends StatelessWidget {
  MedicalReportScreen({Key? key}) : super(key: key);
  final categoryController = TextEditingController();
  String dropDownStringItem = 'Male';

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
            child: Text('Medical Report Screen', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),),
          ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 0,),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Patient name', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),),
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: categoryController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '',
                    contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Row(children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text('Age', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),),
                        ),
                        TextField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          controller: categoryController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '',
                            contentPadding:
                            const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text('Sex', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),),
                        ),
                        Stack(
                          children: [
                            TextField(
                              //controller: _genderController,
                              enabled: false,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: '',
                                contentPadding:
                                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                underline: Container(color: Colors.transparent),
                                items: ['Male','Female'].map((String dropDownStringItem) {
                                  return DropdownMenuItem<String>(
                                    value: dropDownStringItem,
                                    child: Text(dropDownStringItem, style: const TextStyle(color: Colors.black),),
                                  );
                                }).toList(),
                                onChanged: (value){},
                                value: dropDownStringItem,
                              ),
                            ),
                          ],
                        ),
                      ],),
                  ),
                ],),
                const SizedBox(height: 5,),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Date of Consultation', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),),
                ),
                TextField(
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  controller: categoryController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '',
                    contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Diagnosis', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),),
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  maxLines: 3,
                  controller: categoryController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '',
                    contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Prescription', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),),
                ),
                TextField(
                  textInputAction: TextInputAction.done,
                  maxLines: 5,
                  controller: categoryController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '',
                    contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(child: normalButton(
                          backgroundColor: ColorResources.COLOR_PURPLE_MID,
                          button_text: 'submit'.tr,
                          primaryColor: ColorResources.COLOR_WHITE,
                          fontSize: 16,
                          onTap: () async {
                            //Get.toNamed('/dashboard');
                            Get.back();
                            /*
                                        if(_emailController.text.split('@').length==2){
                                          print('090090909');
                                          if(selectedAccount=='Doctor'){
                                            authProvider.login(_emailController.text, _passwordController.text).then((ResponseModel responseModel){
                                              if(responseModel.isSuccess){
                                                //showCustomSnackBar(responseModel.message, context, isError: false);
                                                print('===================');
                                                print(authProvider.userInfoModel!.gender.isEmpty);
                                                if(authProvider.userInfoModel!.gender.isEmpty){
                                                  Provider.of<FormProvider>(context, listen: false).getStates(selectedState: -1, selectedLGA: -1);
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => ProfileSetUPScreen()),
                                                  );
                                                }else{
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                                                  );
                                                }
                                              }else{
                                                showCustomSnackBar(responseModel.message, context, isError: true);
                                              }
                                            });
                                          }else{
                                            print('000000');

                                            nurseAuthProvider.login(_emailController.text, _passwordController.text).then((ResponseModelNurse responseModel){
                                              if(responseModel.isSuccess){
                                                //showCustomSnackBar(responseModel.message, context, isError: false);
                                                print('===================');
                                                print(nurseAuthProvider.userInfoModel!.stateID.isEmpty);
                                                if(nurseAuthProvider.userInfoModel!.stateID.isEmpty){
                                                  int stateId = -1;
                                                  int lgaId = -1;
                                                  Provider.of<FormProviderNurse>(context, listen: false).getStates(selectedState: stateId, selectedLGA: lgaId);
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => ProfileSetUPNurseScreen()),
                                                  );
                                                }else{
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => DashboardNurseScreen()),
                                                  );
                                                }

                                              }else{
                                                showCustomSnackBar(responseModel.message, isError: true);
                                              }
                                            });

                                          }
                                        }else{
                                          showCustomSnackBar('Invalid email address', isError: true);
                                        }
                                        */
                          }
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
