import 'package:flutter/material.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
//my_patient_screen
class MessageScreen extends StatelessWidget {

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
            title: const Text('Message'),
            elevation: 0,
            leading: GestureDetector(
                onTap: ()=>Navigator.pop(context),
                child: Image.asset(Images.backArrowIcon)),
          ),
          body: const Center(child: Text('You have no messages', style: TextStyle(color: Colors.white, fontSize: 16),),)
        ),
      ),
    ],);
  }
}
