import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sonocare_partner2/controller/map_controller.dart';
import 'package:sonocare_partner2/data/model/response/delivery_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/map/map_screen.dart';
import 'package:sonocare_partner2/view/screens/nurse/going_to_location/delivered_screen.dart';
import 'package:sonocare_partner2/view/screens/nurse/take_vital_sign/vital_sign.dart';
import 'package:url_launcher/url_launcher.dart';

class GoingToLocationNurseScreen extends StatefulWidget {
  const GoingToLocationNurseScreen({Key? key}) : super(key: key);

  @override
  State<GoingToLocationNurseScreen> createState() => _GoingToLocationScreenState();
}

class _GoingToLocationScreenState extends State<GoingToLocationNurseScreen> {
  DeliveryRequestsModel? deliveryRequestsModel;
  double lat = 9.088248;
  double lng = 7.480932;
  //9.21406397684134, 12.488736896453696
  double lat_des = 9.019422;
  double lng_des = 7.492406;
  @override
  void initState() {
    deliveryRequestsModel = Get.arguments;
    super.initState();
  }

  double coordinateDistance({lat1, lon1, lat2, lon2}) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
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
            title: const Text('Nurse Going to location'),
            leading: GestureDetector(
                onTap: ()=>Navigator.pop(context),
                child: Image.asset(Images.backArrowIcon)),
          ),
          body: Stack(
            children: [
              //Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, color: Colors.blue,),
              Column(
                children: [
                  Expanded(child: MapPage(source_location: const LatLng(9.088248, 7.480932), destination_location: const LatLng(9.019422, 7.492406),icon: 'nurse',)),
                  const SizedBox(height: 170,)
                ],
              ),
              GetBuilder<MapController>(builder: (mapController) {
                  return Align(
                    alignment:Alignment.bottomCenter,
                    child: Container(
                      height: 170,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: ColorResources.COLOR_PURPLE_MID,
                        /*
                        borderRadius: BorderRadius.vertical(
                            top: Radius.elliptical(
                                400, 150.0)
                        ),*/
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14),
                        child: Column(children: [
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Moving to Location', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),),
                              const SizedBox(width: 20,),
                              Row(
                                children: [
                                  Text('${mapController.distance}km', style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),),
                                ],
                              ),
                              const SizedBox(width: 20,),
                              Container(
                                height: 50, width: 50,
                                decoration: const BoxDecoration(
                                    color: ColorResources.COLOR_PURPLE_DEEP,
                                    borderRadius: BorderRadius.all(Radius.circular(100))
                                ),
                                child: const Icon(Icons.call, size: 30, color: Colors.white,),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => VitalSign(vitalSignId: '41',)),
                                      );
                                      /*
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const NurseCompletedSuccessfully()),
                                      );
                                      */
                                    },
                                    child: Container(
                                      height: 55,
                                      decoration: const BoxDecoration(
                                          color: ColorResources.COLOR_PURPLE_DEEP,
                                          borderRadius: BorderRadius.all(Radius.circular(100))
                                      ),
                                      child: const Center(child: Text('Confirm Arrival', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),)),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: ()async{
                                      String url ='https://www.google.com/maps/dir/?api=1&destination=$lat_des,$lng_des&origin=$lat,$lng';
                                      if (await canLaunch(url)) {
                                        print('-------------09889');
                                        print(url);
                                      await launch(url);
                                      } else {
                                      throw '${'could_not_launch'.tr} $url';
                                      }
                                    },
                                    child: Container(
                                      height: 55,
                                      decoration: const BoxDecoration(
                                          color: ColorResources.COLOR_PURPLE_DEEP,
                                          borderRadius: BorderRadius.all(Radius.circular(100))
                                      ),
                                      child: const Center(child: Text('Open in\n Google Map',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],),
                      ),
                    ),
                  );
                }
              )
            ],
          ),),
      ],
    );
  }
}
