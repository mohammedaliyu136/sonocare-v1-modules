import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/appointment_controller.dart';
import 'package:sonocare_partner2/util/app_constants.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/textField.dart';
import 'package:sonocare_partner2/view/base/textFieldNotStyled.dart';
import 'package:sonocare_partner2/view/screens/nurse/appointment/accept_appointment_screen.dart';

class PendingAppointmentScreen extends StatefulWidget {

  const PendingAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<PendingAppointmentScreen> createState() => _PendingAppointmentScreenState();
}

class _PendingAppointmentScreenState extends State<PendingAppointmentScreen> {
  final textFieldd = TextEditingController();

  @override
  void initState() {
    Get.find<AppointmentController>().getAppointments(url: '/api/getnursevital');
    super.initState();
  }

  //AppointmentController
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: [
      const BackGround(),
      Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text('Appointments'),
            elevation: 0,
            leading: GestureDetector(
                onTap: ()=>Navigator.pop(context),
                child: Image.asset(Images.backArrowIcon)),
          ),
          body: GetBuilder<AppointmentController>(builder: (appointmentController) {
                if(appointmentController.isLoading){
                  return const Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Center(child: Text('Loading...', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, color: ColorResources.COLOR_WHITE),),));
                }else{
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: textFieldNotStyled(textController: textFieldd,),
                      ),
                      Column(
                        children: List.generate(appointmentController.appointments.length, (index) {
                          return GestureDetector(
                            onTap: (){
                              //appointmentController.appointments[index].patientID
                              //String url = '/api/getnursevital';
                              String appointmentDetailURL = '/api/getAppointmentID';
                              String getPatientDetailURL = '/api/dgetPatientProfile';
                              appointmentController.getAppointmentDetail(appointmentID: appointmentController.appointments[index].id, index: index, url: appointmentDetailURL);
                              appointmentController.getPatientDetail(patientID: appointmentController.appointments[index].patientID, url: getPatientDetailURL);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AcceptAppointmentScreen(appointment:appointmentController.appointments[index])),
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
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(100)),
                                      ),

                                      child: Image.network(
                                        AppConstants.BASE_URL+appointmentController.appointments[index].image,
                                        fit: BoxFit.cover,
                                        loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress == null) return child;

                                          return const Center(child: Text('Loading...'));
                                          // You can use LinearProgressIndicator or CircularProgressIndicator instead
                                        },
                                        errorBuilder: (context, error, stackTrace) =>
                                            //Text('Some errors occurred!'),
                                            Image.asset("assets/dummy/profile_dummy.png"),
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(appointmentController.appointments[index].patientName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                                        const SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            Text(appointmentController.appointments[index].getDate(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                            const SizedBox(width: 20,),
                                            Text(appointmentController.appointments[index].getTime(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                          ],
                                        ),
                                      ],)
                                  ],),
                                ),
                              ),
                            ),
                          );
                        }),),
                    ],),
                  );
                }
            }
          ),
        ),
      ),
    ],);
  }
}