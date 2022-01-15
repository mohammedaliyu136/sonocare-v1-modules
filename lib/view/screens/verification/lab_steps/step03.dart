import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/verification_form_controller.dart';
import 'package:sonocare_partner2/view/base/textField.dart';

class Step03 extends StatelessWidget {
  const Step03({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerificationFormController>(builder: (verificationFormController) {
        return Column(children: [
          const Padding(
            padding: EdgeInsets.only(left: 26.0, top: 10.0, bottom: 20.0),
            child: Text('Medical Information', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),),
          ),
          GestureDetector(
              onTap: ()=>verificationFormController.takeDegreeCertificate(),
              child: textField(label: 'Degree Certificate', icon: const Icon(Icons.upload_rounded, color: Colors.white,), hintText: 'Select Degree Certificate', controller: verificationFormController.degreeCertificateController, validator: (){}, onChanged: (){}, enable: false,)),
          const SizedBox(height: 15,),
          GestureDetector(
              onTap: ()=>verificationFormController.takeNigeriaMedicalLicense(),
              child: textField(label: ' Nigeria Medical License', icon: const Icon(Icons.upload_rounded, color: Colors.white,), hintText: 'Select Nigeria Medical License', controller: verificationFormController.nigeriaMedicalLicenseController, validator: (){}, onChanged: (){}, enable: false,)),
          const SizedBox(height: 15,),
          GestureDetector(
              onTap: ()=>verificationFormController.takeSpecialistDocuments(),
              child: textField(label: 'Specialist Supporting Documents', icon: const Icon(Icons.upload_rounded, color: Colors.white,), hintText: 'Select Specialist Supporting Documents', controller: verificationFormController.specialistDocumentsController, validator: (){}, onChanged: (){}, enable: false,)),
          const SizedBox(height: 15,),
          TextField(
            controller: verificationFormController.aboutMeController,
            maxLines: 6,

            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'About me',
              hintStyle: TextStyle(color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.1),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.1),
              ),

            ),
          ),
        ],);
      }
    );
  }
}
