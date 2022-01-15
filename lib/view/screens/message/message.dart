import 'package:flutter/material.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
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
          body: const Center(child: Text('Message Screen is in progress...', style: TextStyle(color: Colors.white, fontSize: 16),),)
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: ColorResources.COLOR_PURPLE_DEEP,
                    borderRadius: BorderRadius.all(Radius.circular(50))
                ),
                child: const Icon(Icons.home, color: Colors.white,),
              ),
              const SizedBox(width: 10,),
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: ColorResources.COLOR_PURPLE_DEEP,
                    borderRadius: BorderRadius.all(Radius.circular(50))
                ),
                child: const Icon(Icons.chat, color: Colors.white,),
              ),
              const SizedBox(width: 10,),
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: ColorResources.COLOR_PURPLE_DEEP,
                    borderRadius: BorderRadius.all(Radius.circular(50))
                ),
                child: const Icon(Icons.settings, color: Colors.white,),
              ),
            ],),
        ),
      )
    ],);
  }
}
