import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/appointment_controller.dart';
import 'package:sonocare_partner2/controller/prescription_controller.dart';
import 'package:sonocare_partner2/data/model/response/prescription_model.dart';
import 'package:sonocare_partner2/data/model/response/response_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/custom_snackbar.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';

class RecommendReferralScreen extends StatefulWidget {
  String appointmentID;
  RecommendReferralScreen({Key? key, required this.appointmentID}) : super(key: key);

  @override
  _RecommendReferralScreenState createState() {
    return _RecommendReferralScreenState();
  }
}

class _RecommendReferralScreenState extends State<RecommendReferralScreen> {
  final _patientNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  final _dateOfConsultationController = TextEditingController();
  final _diagnosisController = TextEditingController();
  final _prescriptionController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    DateTime date = DateTime.now();
    _dateOfConsultationController.text='${date.day<10?'0'+date.day.toString():date.day}/${date.month<10?'0'+date.month.toString():date.month}/${date.year}';
    return Stack(
      children: [
        const BackGround(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text('Medical Report'),
            elevation: 0,
            leading: GestureDetector(
                onTap: ()=>Navigator.pop(context),
                child: Image.asset(Images.backArrowIcon)),
          ),//PrescriptionProvider
          body: GetBuilder<AppointmentController>(builder: (appointmentController) {
                _patientNameController.text = appointmentController.patientModel.firstName+' '+appointmentController.patientModel.otherName+' '+appointmentController.patientModel.lastName;
                _ageController.text = (DateTime.now().year - int.parse(appointmentController.patientModel.dob.split('-')[2])).toString();
              return GetBuilder<PrescriptionController>(builder: (prescriptionController) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView(children: [
                      const SizedBox(height: 20,),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('Patient name', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                      ),
                      TextField(
                        textInputAction: TextInputAction.next,
                        controller: _patientNameController,
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
                              child: Text('Age', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                            ),
                            TextField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              controller: _ageController,
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
                              child: Text('Sex', style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
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
                                    onChanged: (value){
                                      setState(() {
                                        _genderController.text=value!;
                                      });
                                    },
                                    value: _genderController.text.isEmpty?'Male':_genderController.text,
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
                        child: Text('Date of Consultation', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                      ),
                      TextField(
                        keyboardType: TextInputType.datetime,
                        textInputAction: TextInputAction.next,
                        controller: _dateOfConsultationController,
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
                        child: Text('Diagnosis', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                      ),
                      TextField(
                        textInputAction: TextInputAction.next,
                        maxLines: 3,
                        controller: _diagnosisController,
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
                        child: Text('Referral note', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                      ),
                      TextField(
                        textInputAction: TextInputAction.done,
                        maxLines: 5,
                        controller: _prescriptionController,
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
                    const SizedBox(height: 30,),
                      if(prescriptionController.isLoading)Row(mainAxisAlignment: MainAxisAlignment.center, children: const[CircularProgressIndicator(color: Colors.red,),],),
                      if(!prescriptionController.isLoading)normalButton(
                      backgroundColor: ColorResources.COLOR_PURPLE_MID,
                      button_text: 'Submit',
                      primaryColor: ColorResources.COLOR_WHITE,
                      fontSize: 16, onTap: () {
                        String url = '/api/prescription';
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                    },
                    )
                    ],),
                  );
                }
              );
            }
          ),
        )
      ],
    );
  }
}