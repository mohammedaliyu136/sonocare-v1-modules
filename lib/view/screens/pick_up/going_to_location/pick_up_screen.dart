import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/data/model/response/pickup_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/view/base/background.dart';

class PickUpScreen extends StatefulWidget {
  const PickUpScreen({Key? key}) : super(key: key);

  @override
  State<PickUpScreen> createState() => _PickUpScreenState();
}

class _PickUpScreenState extends State<PickUpScreen> {
  PickupRequestsModel? pickUpRequestsModel;
  @override
  void initState() {
    pickUpRequestsModel = Get.arguments;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        const BackGround(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('Pick up'),
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50, width: 50,
                    decoration: const BoxDecoration(
                        color: ColorResources.COLOR_WHITE,
                        borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16,)
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(child: Text('Pick up Successfully', style: TextStyle(fontSize: 20, color: Colors.white),),),
                const SizedBox(height: 16,),
                GestureDetector(
                  onTap: ()=>Get.offAllNamed('/pickup/dashboard'),
                  child: Container(
                    height: 55,
                    decoration: const BoxDecoration(
                        color: ColorResources.COLOR_PURPLE_DEEP,
                        borderRadius: BorderRadius.all(Radius.circular(100))
                    ),
                    child: const Center(child: Text('See Other Requests', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),)),
                  ),
                ),
                const SizedBox(height: 100,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
