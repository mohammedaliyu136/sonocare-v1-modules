import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/controller/verification_controller.dart';
import 'package:sonocare_partner2/controller/verification_form_controller.dart';
import 'package:sonocare_partner2/data/model/response/verification_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/screens/otp/not_approved.dart';
import 'package:sonocare_partner2/view/screens/verification/ambulance_steps/step01.dart';
import 'package:sonocare_partner2/view/screens/verification/ambulance_steps/step02.dart';
import 'package:sonocare_partner2/view/screens/verification/ambulance_steps/step03.dart';
import 'package:sonocare_partner2/view/screens/verification/ambulance_steps/step04.dart';
import 'package:sonocare_partner2/view/screens/verification/line.dart';

class AmbulanceVerificationScreen extends StatefulWidget {
  const AmbulanceVerificationScreen({Key? key}) : super(key: key);

  @override
  State<AmbulanceVerificationScreen> createState() => _AmbulanceVerificationScreenState();
}

class _AmbulanceVerificationScreenState extends State<AmbulanceVerificationScreen> {
  int step = 1;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const BackGround(),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: const Padding(
          padding: EdgeInsets.only(left: 26.0, top: 10.0, bottom: 20.0),
          child: Text('Verification', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),),
        ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: GetBuilder<VerificationFormController>(builder: (verificationFormController) {
          return GetBuilder<VerificationController>(builder: (verificationController) {
            if(verificationController.isUploading){
              return Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(children: const [
                        Text('Uploading Verification Information', style: TextStyle(fontSize: 18, color: Colors.white),)
                      ],)
                    ],),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(children: [
                        verificationController.isUploadingPersonalInfo?const CircularProgressIndicator():verificationController.isDoneUploadingPersonalInfo?const Icon(Icons.check_circle, color: Colors.green, size: 30,):const Icon(Icons.check_circle, color: Colors.grey, size: 30,),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Personal Information', style: const TextStyle(color: Colors.white),),
                        )
                      ],)
                    ],),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(children: [
                        verificationController.isUploadingBusinessInfo?const CircularProgressIndicator():verificationController.isDoneUploadingBusinessInfo?const Icon(Icons.check_circle, color: Colors.green, size: 30,):const Icon(Icons.check_circle, color: Colors.grey, size: 30,),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Work Details', style: const TextStyle(color: Colors.white),),
                        )
                      ],)
                    ],),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(children: [
                        verificationController.isUploadingMedicalInfo?const CircularProgressIndicator():verificationController.isDoneUploadingMedicalInfo?const Icon(Icons.check_circle, color: Colors.green, size: 30,):const Icon(Icons.check_circle, color: Colors.grey, size: 30,),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Medical Information', style: const TextStyle(color: Colors.white),),
                        )
                      ],)
                    ],),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(children: [
                        verificationController.isUploadingPersonalInfo2?const CircularProgressIndicator():verificationController.isDoneUploadingPersonalInfo2?const Icon(Icons.check_circle, color: Colors.green, size: 30,):const Icon(Icons.check_circle, color: Colors.grey, size: 30,),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: const Text('Company Information', style: TextStyle(color: Colors.white),),
                        )
                      ],)
                    ],),
                ],);
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 45,
                      color: step==1?ColorResources.COLOR_PURPLE_MID:ColorResources.COLOR_WHITE,
                      child: Center(child: Text("Step 1", style: TextStyle(fontWeight: FontWeight.w800, color: step==1?ColorResources.COLOR_WHITE:ColorResources.COLOR_BLACK, fontSize: 12),)),
                    ),
                    CustomPaint(
                      painter: TrianglePainter(
                        strokeColor: step==1?ColorResources.COLOR_PURPLE_MID:ColorResources.COLOR_WHITE,
                        strokeWidth: 10,
                        paintingStyle: PaintingStyle.fill,
                      ),
                      child: Container(
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Container(
                      height: 30,
                      width: 45,
                      color: step==2?ColorResources.COLOR_PURPLE_MID:ColorResources.COLOR_WHITE,
                      child: Center(child: Text("Step 2", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12, color: step==2?ColorResources.COLOR_WHITE:ColorResources.COLOR_BLACK,),)),
                    ),
                    CustomPaint(
                      painter: TrianglePainter(
                        strokeColor: step==2?ColorResources.COLOR_PURPLE_MID:ColorResources.COLOR_WHITE,
                        strokeWidth: 10,
                        paintingStyle: PaintingStyle.fill,
                      ),
                      child: Container(
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Container(
                      height: 30,
                      width: 45,
                      color: step==3?ColorResources.COLOR_PURPLE_MID:ColorResources.COLOR_WHITE,
                      child: Center(child: Text("Step 3", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12, color: step==3?ColorResources.COLOR_WHITE:ColorResources.COLOR_BLACK),)),
                    ),
                    CustomPaint(
                      painter: TrianglePainter(
                        strokeColor: step==3?ColorResources.COLOR_PURPLE_MID:ColorResources.COLOR_WHITE,
                        strokeWidth: 10,
                        paintingStyle: PaintingStyle.fill,
                      ),
                      child: Container(
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Container(
                      height: 30,
                      width: 45,
                      color: step==4?ColorResources.COLOR_PURPLE_MID:ColorResources.COLOR_WHITE,
                      child: Center(child: Text("Step 4", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12, color: step==4?ColorResources.COLOR_WHITE:ColorResources.COLOR_BLACK),)),
                    ),
                    CustomPaint(
                      painter: TrianglePainter(
                        strokeColor: step==4?ColorResources.COLOR_PURPLE_MID:ColorResources.COLOR_WHITE,
                        strokeWidth: 10,
                        paintingStyle: PaintingStyle.fill,
                      ),
                      child: Container(
                        height: 30,
                        width: 30,
                      ),
                    ),
                    const SizedBox(width: 10,),
                  ],),
                const SizedBox(height: 20,),
                if(step==1)const Step01(),
                if(step==2)const Step02(),
                if(step==3)const Step03(),
                if(step==4)const Step04(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: normalButton(
                    button_text: step!=4?'Next':'Upload',
                    fontSize: 20,
                    primaryColor: ColorResources.COLOR_WHITE,
                    backgroundColor: ColorResources.COLOR_PURPLE_MID,
                    onTap: ()async{
                      if(step!=4){
                        if(step==1){
                          VerificationModel verificationModel = verificationFormController.step1Verified(context);
                          if(verificationModel.verified){
                            verificationFormController.getAllStates();
                            setState(() {
                              step+=1;
                            });
                          }
                          //dialog(context: context, text: 'Verification Pending for Dr. Prince David!', success: false);
                        }
                        if(step==2){
                          VerificationModel verificationModel = verificationFormController.step2Verified(context);
                          if(verificationModel.verified){
                            setState(() {
                              step+=1;
                            });
                          }
                        }
                        if(step==3){
                          VerificationModel verificationModel = verificationFormController.step3Verified(context);
                          if(verificationModel.verified){
                            setState(() {
                              step+=1;
                            });
                          }
                        }
                      }else{
                        print('finished');
                        VerificationModel verificationModel = verificationFormController.step4Verified(context);
                        if(verificationModel.verified){
                          String token = Get.find<AuthController>().token;
                          verificationController.setToken(token);
                          print('token: ${token}');

                          /*
                          await verificationController.startUpload(
                            //step1: verificationFormController.getStep1(Get.find<AuthController>().AmbulanceTypeList[0].title),
                            step1: verificationFormController.getStep1(''),
                            step2: verificationFormController.getStep2(),
                            step3: verificationFormController.getStep3(),
                            step4: verificationFormController.getStep4(),

                            passport: verificationFormController.passport,
                            idCard: verificationFormController.idCard,
                            degreeCertificate: verificationFormController.degreeCertificate,
                            nigerianMedicalCertificate: verificationFormController.nigeriaMedicalLicense,
                            specialistDoc: verificationFormController.specialistDocuments,
                          ).then((response){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NotApprovedScreen()),
                            );
                          });
                          */

                        }
                      }
                    },
                  ),
                )
              ],),
            );
          },
          );
        },
        ),
      )
    ],);
  }
}
