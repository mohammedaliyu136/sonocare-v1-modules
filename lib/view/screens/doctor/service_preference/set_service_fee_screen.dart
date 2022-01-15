import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/data/model/response/response_model.dart';
import 'package:sonocare_partner2/data/model/response/service_fee_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/custom_snackbar.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/base/textField.dart';

class SetServiceFeeScreen extends StatelessWidget {
  SetServiceFeeScreen({Key? key, required this.preference}) : super(key: key);
  String preference;
  final _consultationFeeController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    print(preference);
    // TODO: implement build
    return Stack(children: [
      const BackGround(),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Set Service Fees'),
          elevation: 0,
          leading: GestureDetector(
              onTap: ()=>Navigator.pop(context),
              child: Image.asset(Images.backArrowIcon)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(28.0),
          child: GetBuilder<AuthController>(builder: (authController) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(preference, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),),
                  const SizedBox(height: 30,),
                  textField(hintText: 'Enter Fee here', label:'Set Consultation Fee', icon: const Icon(Icons.account_circle_outlined, color: Colors.white,), controller: _consultationFeeController, validator: (){},onChanged: (){},),
                  if(preference!='Independent')const SizedBox(height: 20,),
                  if(preference!='Independent')textField(hintText: 'Enter Fee here', label:'Tariff Based', icon: const Icon(Icons.account_circle_outlined, color: Colors.white,), controller: _consultationFeeController, validator: (){},onChanged: (){},),
                  const SizedBox(height: 10,),
                  if(_isLoading)Row(mainAxisAlignment: MainAxisAlignment.center, children: [const CircularProgressIndicator(color: Colors.red,),],),
                  if(!_isLoading)Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Expanded(child: normalButton(
                          backgroundColor: ColorResources.COLOR_PURPLE_MID,
                          button_text: 'Done',
                          primaryColor: ColorResources.COLOR_WHITE,
                          fontSize: 16,
                          onTap: (){
                            if(_consultationFeeController.text.isEmpty){
                              showCustomSnackBar('Please enter consultation fee', isError: true);
                            }else{
                              ServiceFeeModel serviceFeeModel = ServiceFeeModel(type: preference, consultationFee: double.parse(_consultationFeeController.text),);
                              authController.setConsultationFee(serviceFeeModel).then((ResponseModel response){
                                if(response.isSuccess){
                                  showCustomSnackBar(response.message, isError: false);
                                  Get.back();
                                }else{
                                  showCustomSnackBar(response.message, isError: true);
                                }
                              });
                            }
                          },
                        )),
                      ],
                    ),
                  ),
              ],);
            }
          ),
        ),
      )
    ],);
  }
}
