

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/util/app_constants.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/screens/doctor/appointment/appointment_screen.dart';
import 'package:sonocare_partner2/view/screens/doctor/dashboard/chat_list.dart';
import 'package:sonocare_partner2/view/screens/doctor/dashboard/settings_screen.dart';
import 'package:sonocare_partner2/view/screens/doctor/service_preference/service_reference_list_screen.dart';

import 'widgets/lg_container.dart';
class DashboardAmbulanceScreen extends StatefulWidget {
  const DashboardAmbulanceScreen({Key? key}) : super(key: key);

  @override
  _DashboardAmbulanceScreenState createState() {
    return _DashboardAmbulanceScreenState();
  }
}

class _DashboardAmbulanceScreenState extends State<DashboardAmbulanceScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        const BackGround(),
        GetBuilder<AuthController>(builder: (authController) {
            return Scaffold(
              //key: _scaffoldKey,
              //key: Provider.of<AppProviderNurse>(context, listen: false).scaffoldKey,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(height: 4,),
                    Text('Hello,', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),),
                    SizedBox(height: 4,),
                    Text('First Name', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),)
                    //Text(authController.userInfoModel!.firstName, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),)
                    //Text('${Provider.of<AuthProvider>(context, listen: false).userInfoModel!.firstName}', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),)
                  ],),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      onTap: (){
                        /*
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileSetUPScreen(upDateProfile:true)),
                        );
                        */
                      },
                      child: Container(
                        height: 55,
                        width: 57,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            image:DecorationImage(
                              fit:BoxFit.fill,
                              image: NetworkImage(''),
                            )
                        ),
                      ),
                    ),
                  )
                ],
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              drawer: Drawer(
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerHeader(
                        decoration: const BoxDecoration(
                          color: ColorResources.COLOR_PURPLE_MID,
                          borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(470, 150.0)),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10,),
                            Container(
                              height: 70,
                              width: 70,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                  image:DecorationImage(
                                    fit:BoxFit.fill,
                                    image: NetworkImage('image'),
                                  )

                              ),
                            ),
                            const SizedBox(width: 10,),
                            const Text('firstName',  style: TextStyle(fontSize: 20, color: ColorResources.COLOR_WHITE),)

                          ],
                        ),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.only(left: 60, top: 0, bottom: 0),
                        title: const Text('PROFILE'),//Profile
                        onTap: () {},
                      ),
                      const Divider(),
                      ListTile(
                        contentPadding: const EdgeInsets.only(left: 60),
                        title: const Text('REVIEWS'),//Reviews
                        onTap: () {},
                      ),
                      const Divider(),
                      ListTile(
                        contentPadding: const EdgeInsets.only(left: 60),
                        title: const Text('SETTINGS'),//Settings
                        onTap: () {},
                      ),
                      const Divider(),
                      ListTile(
                        contentPadding: const EdgeInsets.only(left: 60),
                        title: const Text('LOGOUT'),//Logout
                        onTap: () async {Get.toNamed('/');},
                      ),
                      const SizedBox(height: 100,)
                    ],
                  ),
                ),
              ),
              body: index==0?Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 18, top: 10, bottom: 0),
                child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20, bottom: 20),
                    child: Row(
                      children: [
                        Expanded(child: normalButton(
                          backgroundColor: ColorResources.COLOR_PURPLE_MID,
                          button_text: 'Update Profile',
                          primaryColor: ColorResources.COLOR_WHITE,
                          fontSize: 16,
                          onTap: (){
                            Get.toNamed('/profile/update');
                            /*
                            int stateId = authController.userInfoModel!.stateID==null?-1:int.parse(Provider.of<AuthProvider>(context, listen: false).userInfoModel!.stateID);
                            int lgaId = authController.userInfoModel!.lgaID==null?-1:int.parse(Provider.of<AuthProvider>(context, listen: false).userInfoModel!.lgaID);
                            Provider.of<FormProvider>(context, listen: false).getStates(selectedState: stateId, selectedLGA: lgaId);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProfileSetUPScreen(upDateProfile:true)),
                            );*/
                          },
                        )),
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: LGConatiner(heading: 'Set Preference', body: 'Schedule a consultation with a doctor',),
                    onTap: (){
                      authController.getConsultationType();
                      authController.getConsultationFee();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ServicePreferenceListScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    child: LGConatiner(heading: 'Ambulance Requests', body: 'You have no bookings at the moment', imageUrl: 'assets/icons/appointment_icon.png'),
                    onTap: (){
                      print('get Ambulance Requests');
                      /*
                      String token = Provider.of<AuthProvider>(context, listen: false).token;
                      Provider.of<AppointmentProvider>(context, listen: false).getAppointments(context, token, '0');
                       */
                      Get.toNamed('/ambulance/request/list');

                    },
                  ),
                  const SizedBox(height: 30,),
                ],),
              ):SettingsScreenDash(),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: Colors.green,
                iconSize: 40,
                currentIndex: index,
                onTap: (current_index){
                  setState(() {
                    index=current_index;
                  });
                },
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: index==0?
                      Image.asset("assets/icons/home_icon.png", height: 40, width: 40)
                          :Image.asset("assets/icons/home_icon_light.png", height: 40, width: 40),
                      label: 'ss',
                      backgroundColor: Colors.green
                  ),
                  BottomNavigationBarItem(
                    icon: index==2?
                    Image.asset("assets/icons/settings_icon.png", height: 40, width: 40)
                        :Image.asset("assets/icons/settings_icon_light.png", height: 40, width: 40),
                    label: 'qq',
                  ),
                ],
              ),
            );
          }
        ),
      ],
    );
  }
}
