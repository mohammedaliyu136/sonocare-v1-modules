import 'package:flutter/material.dart';
import 'package:sonocare_partner2/util/images.dart';

class BackGround extends StatelessWidget {
  const BackGround({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration:const BoxDecoration(
                image:DecorationImage(
                  fit:BoxFit.cover,
                  image: AssetImage("assets/image/bg_1.png"),
                )
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromRGBO(78, 0, 118, 0.3),
        ),
        Column(children: [
          const Spacer(),
          Row(
            children: [
              Image.asset(Images.scope),
            ],
          ),
        ],),
      ],
    );
  }
}

class DarkBackGround extends StatelessWidget {
  const DarkBackGround({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration:const BoxDecoration(
                color: Color(0xFF4E0076)
              /*
                image:DecorationImage(
                  fit:BoxFit.cover,
                  image: AssetImage("assets/bg/dark_bg.png"),
                )*/
            ),
          ),
        ),
        Column(children: [
          const Spacer(),
          Row(
            children: [
              Image.asset(Images.scope),
            ],
          ),
        ],),
      ],
    );
  }
}