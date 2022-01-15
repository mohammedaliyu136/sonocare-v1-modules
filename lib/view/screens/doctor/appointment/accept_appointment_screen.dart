import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sonocare_partner2/controller/appointment_controller.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/data/model/response/appointmet_model.dart';
import 'package:sonocare_partner2/data/model/response/response_model.dart';
import 'package:sonocare_partner2/util/app_constants.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/screens/doctor/calling/calling.dart';
import 'package:sonocare_partner2/view/screens/doctor/doctor_patient_options/doctor_patient_options_screen.dart';


class AcceptAppointmentScreen extends StatefulWidget {
  AppointmentModel appointment;
  bool accepted;
  AcceptAppointmentScreen({Key? key, required this.appointment, this.accepted = false}) : super(key: key);

  @override
  _AcceptAppointmentScreenState createState() {
    return _AcceptAppointmentScreenState();
  }
}

class _AcceptAppointmentScreenState extends State<AcceptAppointmentScreen> {
  bool isShowVial = false;
  String subPage = 'infor';
  bool gettingToken = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  showAboutPatient(context){
    return GetBuilder<AppointmentController>(builder: (appointmentController) {
        return Column(children: [
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
              Expanded(child: Text(widget.appointment.getAppointmentDateTimeSTR(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white, letterSpacing: 1.1),))
            ],),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                //this.isShowVial = true;
                subPage='vital';
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top:30.0, bottom: 8, left: 15, right: 15),
              child: Row(children: [
                const Text('Vital Signs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: ColorResources.COLOR_WHITE, letterSpacing: 1.1),),
                const SizedBox(width: 15,),
                Image.asset('assets/icons/go_arrow.png')
              ],),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                //this.isShowVial = true;
                subPage='med_history';
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top:10.0, bottom: 8, left: 15, right: 15),
              child: Row(children: [
                const Text('Medical History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: ColorResources.COLOR_WHITE, letterSpacing: 1.1),),
                const SizedBox(width: 15,),
                Image.asset('assets/icons/go_arrow.png')
              ],),
            ),
          ),
        ],);
      }
    );
  }
  showVitals(BuildContext context){
    return GetBuilder<AppointmentController>(builder: (appointmentController) {
        return Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 20),
            child: Row(
              children: const [
                Text('Vital Signs', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
            child: Row(children: [
              Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('Temperature', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('Pulse rate', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('Respiration rate', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('Blood group', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('Sp02', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('Body Mass Index', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('random', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('Blood sugar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('Height, weight and BMI', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                    ],)),
              if(appointmentController.patientModel.vitals.isNotEmpty)Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(appointmentController.patientModel.vitals[appointmentController.patientModel.vitals.length-1].temperature, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(appointmentController.patientModel.vitals[appointmentController.patientModel.vitals.length-1].pulseRate, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(appointmentController.patientModel.vitals[appointmentController.patientModel.vitals.length-1].respiration, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(appointmentController.patientModel.vitals[appointmentController.patientModel.vitals.length-1].bloodGroup, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(appointmentController.patientModel.vitals[appointmentController.patientModel.vitals.length-1].sp02, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(appointmentController.patientModel.vitals[appointmentController.patientModel.vitals.length-1].bodyMass, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('-', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('Normal', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text('Average', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                    ],)
              ),
              if(appointmentController.patientModel.vitals.isEmpty)Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(' - ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(' - ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(' - ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(' - ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(' - ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(' - ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(' - ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(' - ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(' - ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                    ],)
              )
            ],),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                this.isShowVial = false;
                subPage='med_history';
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top:10.0, bottom: 8, left: 15, right: 15),
              child: Row(children: [
                const Text('Patient details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: ColorResources.COLOR_PURPLE_MID, letterSpacing: 1.1),),
                const SizedBox(width: 15,),
                Image.asset('assets/icons/go_arrow.png')
              ],),
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                this.isShowVial = false;
                subPage='med_history';
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top:10.0, bottom: 8, left: 15, right: 15),
              child: Row(children: [
                const Text('Medical History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: ColorResources.COLOR_PURPLE_MID, letterSpacing: 1.1),),
                const SizedBox(width: 15,),
                Image.asset('assets/icons/go_arrow.png')
              ],),
            ),
          ),
        ],);
      }
    );
  }
  showMedicalHistory(BuildContext context){
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 30.0, top: 20),
        child: Row(
          children: const [
            Text('Medical History', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white)),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text('Gender', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                  ),
                  SizedBox(height: 1, width: MediaQuery.of(context).size.width, child: Container(color: Colors.white.withOpacity(0.5),),),
                  const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text('DOB', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                  ),
                  SizedBox(height: 1, width: MediaQuery.of(context).size.width, child: Container(color: Colors.white.withOpacity(0.5),),),
                  const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text('Are You Hypertensive?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                  ),
                  SizedBox(height: 1, width: MediaQuery.of(context).size.width, child: Container(color: Colors.white.withOpacity(0.5),),),
                  const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text('Are You Diabetic?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                  ),
                  SizedBox(height: 1, width: MediaQuery.of(context).size.width, child: Container(color: Colors.white.withOpacity(0.5),),),
                  const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text('Are You Asthmatic?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                  ),
                  SizedBox(height: 1, width: MediaQuery.of(context).size.width, child: Container(color: Colors.white.withOpacity(0.5),),),
                  const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text('Have You Suffered Stroke?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                  ),
                  SizedBox(height: 1, width: MediaQuery.of(context).size.width, child: Container(color: Colors.white.withOpacity(0.5),),),
                  const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text('GenoType', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                  ),
                  SizedBox(height: 1, width: MediaQuery.of(context).size.width, child: Container(color: Colors.white.withOpacity(0.5),),),
                  const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Text('Blood Group', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                  ),
                ],)),
          Expanded(
              flex: 3,
              child: GetBuilder<AppointmentController>(builder: (appointmentController) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(appointmentController.patientModel.gender, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      SizedBox(height: 1, width: MediaQuery.of(context).size.width, child: Container(color: Colors.white.withOpacity(0.5),),),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(appointmentController.patientModel.dob, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      SizedBox(height: 1, width: MediaQuery.of(context).size.width, child: Container(color: Colors.white.withOpacity(0.5),),),
                      const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Icon(Icons.check, size: 19,),
                      ),
                      SizedBox(height: 1, width: MediaQuery.of(context).size.width, child: Container(color: Colors.white.withOpacity(0.5),),),
                      const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Icon(Icons.check, size: 19,),
                      ),
                      SizedBox(height: 1, width: MediaQuery.of(context).size.width, child: Container(color: Colors.white.withOpacity(0.5),),),
                      const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Icon(Icons.check, size: 19,),
                      ),
                      SizedBox(height: 1, width: MediaQuery.of(context).size.width, child: Container(color: Colors.white.withOpacity(0.5),),),
                      const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Icon(Icons.check, size: 19,),
                      ),
                      SizedBox(height: 1, width: MediaQuery.of(context).size.width, child: Container(color: Colors.white.withOpacity(0.5),),),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(appointmentController.patientModel.genoType, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                      SizedBox(height: 1, width: MediaQuery.of(context).size.width, child: Container(color: Colors.white.withOpacity(0.5),),),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(appointmentController.patientModel.bloodGroup, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                    ],);
                }
              ))
        ],),
      ),
      GestureDetector(
        onTap: (){
          setState(() {
            this.isShowVial = false;
            subPage='infor';
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(top:10.0, bottom: 8, left: 15, right: 15),
          child: Row(children: [
            const Text('Patient details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: ColorResources.COLOR_PURPLE_MID, letterSpacing: 1.1),),
            const SizedBox(width: 15,),
            Image.asset('assets/icons/go_arrow.png')
          ],),
        ),
      ),
      GestureDetector(
        onTap: (){
          setState(() {
            this.isShowVial = false;
            subPage='vital';
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(top:0.0, bottom: 8, left: 15, right: 15),
          child: Row(children: [
            const Text('Vital Signs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: ColorResources.COLOR_PURPLE_MID, letterSpacing: 1.1),),
            const SizedBox(width: 15,),
            Image.asset(Images.backArrowIcon)
          ],),
        ),
      ),
    ],);
  }

  @override
  Widget build(BuildContext context) {
    print('----------------------');
    print(widget.appointment.status);
    // TODO: implement build
    return Stack(children: [
      const BackGround(),
      GetBuilder<AuthController>(builder: (authController) {
          return GetBuilder<AppointmentController>(builder: (appointmentController) {
                if(appointmentController.isLoading){
                  return const Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Center(child: Text('Loading...', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, color: ColorResources.COLOR_WHITE),),));
                }else {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Column(children: [
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
                                padding: const EdgeInsets.all(38.0),
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
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: const BorderRadius.all(Radius.circular(100)),
                                                image:DecorationImage(
                                                  fit:BoxFit.fill,
                                                  //image: AssetImage("assets/dummy/profile_dummy.png"),
                                                  image: NetworkImage(AppConstants.BASE_URL+appointmentController.patientModel.image),
                                                )
                                            ),
                                          ),
                                          const SizedBox(height: 10,),
                                          //Todo: add loading...
                                          Text(appointmentController.patientModel.firstName+' '+appointmentController.patientModel.otherName+' '+appointmentController.patientModel.lastName, style: const TextStyle(
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
                                Navigator.pop(context);
                              },
                              child: SafeArea(
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Row(children: [
                                    Image.asset(Images.backArrowIcon),
                                  ],),
                                ),
                              ),
                            )
                          ],
                        ),
                        //if(!isShowVial)showAboutPatient(context),
                        //if(isShowVial)showVitals(context),
                        if(subPage=='infor')showAboutPatient(context),
                        if(subPage=='vital')showVitals(context),
                        if(subPage=='med_history')showMedicalHistory(context),

                        const Spacer(),
                        if(widget.appointment.status=='0')Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            children: [
                              Expanded(child: normalButton(
                                button_text: 'Decline',
                                fontSize: 14,
                                primaryColor: ColorResources.COLOR_WHITE,
                                backgroundColor: ColorResources.COLOR_PURPLE_DEEP,
                                onTap: () {
                                  String url = '/api/DeclineAppointmentment';
                                  appointmentController.cancelDoctorAppointment(url, widget.appointment.id.toString()).then((ResponseModel response){
                                    if(response.isSuccess){
                                      Navigator.pop(context);
                                    }else{
                                      print(response.message);
                                    }
                                  });
                                },
                              )),
                              const SizedBox(width: 30,),
                              Expanded(child: normalButton(
                                button_text: 'Accept',
                                fontSize: 14,
                                primaryColor: ColorResources.COLOR_WHITE,
                                backgroundColor: ColorResources.COLOR_PURPLE_DEEP,
                                onTap: () {
                                  setState(() {
                                    widget.accepted=true;
                                  });

                                  String url = '/api/AcceptAppointmentment';

                                  appointmentController.acceptDoctorAppointment(widget.appointment.id.toString(), url).then((ResponseModel response){
                                    if(response.isSuccess){
                                      //Navigator.pop(context);
                                      setState(() {
                                        widget.appointment.status='1';
                                      });
                                    }else{
                                      print(response.message);
                                    }
                                  });

                                },
                              )),
                            ],
                          ),
                        ),
                        if(widget.appointment.status=='1')if(!gettingToken)Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            children: [
                              Expanded(child: normalButton(
                                button_text: 'Options',
                                fontSize: 14,
                                primaryColor: ColorResources.COLOR_WHITE,
                                backgroundColor: ColorResources.COLOR_PURPLE_DEEP,
                                onTap: () {
                                  appointmentController.setSelectedAppointment(widget.appointment);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const DoctorPatientOptionsScreen()),
                                  );
                                },
                              )),
                              const SizedBox(width: 10,),
                              Expanded(child: normalButton(
                                button_text: 'Call Patient',
                                fontSize: 14,
                                primaryColor: ColorResources.COLOR_WHITE,
                                backgroundColor: ColorResources.COLOR_PURPLE_DEEP,
                                onTap: () {
                                  print('-----------900');
                                  setState(() {
                                    gettingToken=true;
                                  });

                                  //String channel = "doctor${authProvider.userInfoModel!.id}${widget.appointment.time.split(':').join("")}";
                                  String channel = "doctor${authController.userInfoModel!.id}";
                                  print(channel);
                                  String doc_uid = "${authController.userInfoModel!.id}";
                                  http.get(Uri.parse('https://sonocare-agora.herokuapp.com/access_token?channelName=${channel}')).then((value){
                                    setState(() {
                                      gettingToken=false;
                                    });
                                    String token = jsonDecode(value.body)['token'];
                                    print('00000000000000');
                                    print(channel);
                                    print(token);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => CallingScreen(channel: channel, token: token, remoteUID: doc_uid,)),
                                    );

                                  });

                                  setState(() {
                                    gettingToken=false;
                                  });
                                },
                              )),
                            ],
                          ),
                        ),
                        if(widget.appointment.status=='2')const Text('Appointment Rejected by You', style: TextStyle(color: Colors.white, fontSize: 20),),
                        if(gettingToken)const Center(child: Text('Getting Authorisation for call, please wait...', style: TextStyle(color: Colors.white),))
                      ],),
                    ),
                  );
                }
            }
          );
        }
      ),
    ],);
  }
}
