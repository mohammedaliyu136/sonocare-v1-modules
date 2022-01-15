

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/appointment_controller.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/screens/doctor/lab_test/lab_test_screen.dart';
import 'package:sonocare_partner2/view/screens/doctor/medical_report/medical_report_screen.dart';
import 'package:sonocare_partner2/view/screens/doctor/prescription/prescription_screen.dart';
import 'package:sonocare_partner2/view/screens/doctor/recommend_referral/recommend_referral_screen.dart';

class DoctorPatientOptionsScreen extends StatelessWidget {
  const DoctorPatientOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: [
      const DarkBackGround(),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
              onTap: ()=>Navigator.pop(context),
              child: Image.asset(Images.backArrowIcon)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: (){
                  /*
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileSetUPScreen(upDateProfile:true)),
                  );
                  */
                },
                child: Container(
                  height: 55,
                  width: 57,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      image: DecorationImage(
                        fit:BoxFit.fill,
                        image: AssetImage("assets/dummy/profile_dummy.png"),
                      )
                  ),
                ),
              ),
            )
          ],
        ),
        body:GetBuilder<AppointmentController>(builder: (appointmentController) {
              return Column(children: [
                const SizedBox(height: 30,),
                ListTile(
                  title: const Text('Recommend Tests', style: TextStyle(color: Colors.white, fontSize: 20),),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
                  onTap: (){
                    /*
                    Provider.of<LabTestProvider>(context, listen: false).getLabTestCategory();
                     */
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LabTestScreen()),
                    );
                  },
                ),
                const SizedBox(height: 20,),
                ListTile(
                  title: const Text('Write Prescriptions', style: TextStyle(color: Colors.white, fontSize: 20),),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PrescriptionScreen(appointmentID: appointmentController.appointment!.id,)),
                    );
                  },
                ),
                const SizedBox(height: 20,),
                ListTile(
                  title: const Text('Write Medical Report', style: TextStyle(color: Colors.white, fontSize: 20),),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MedicalReportScreen(appointmentID: appointmentController.appointment!.id,)),
                    );
                  },
                ),
                const SizedBox(height: 20,),
                ListTile(
                  title: const Text('Recommend Referral', style: TextStyle(color: Colors.white, fontSize: 20),),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecommendReferralScreen(appointmentID: appointmentController.appointment!.id,)),
                    );
                  },
                ),
              ],);
            }
        ),
      )
    ],);
  }
}
