import 'package:flutter/material.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: [
      const DarkBackGround(),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
                onTap: ()=>Navigator.pop(context),
                child: Image.asset(Images.backArrowIcon)),
            title: const Text('Privacy', style: TextStyle(color: Colors.white),),
            elevation: 0,
          ),
          body: ListView(children: const [])
      )
    ],);
  }
}
