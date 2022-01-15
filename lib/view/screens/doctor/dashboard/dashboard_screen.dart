

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
import 'widgets/sm_container.dart';
class DashboardDoctorScreen extends StatefulWidget {
  const DashboardDoctorScreen({Key? key}) : super(key: key);

  @override
  _DashboardDoctorScreenState createState() {
    return _DashboardDoctorScreenState();
  }
}

class _DashboardDoctorScreenState extends State<DashboardDoctorScreen> {
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
                  children: [
                    const SizedBox(height: 4,),
                    const Text('Hello,', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),),
                    const SizedBox(height: 4,),
                    Text(authController.userInfoModel!.firstName, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),)
                    //Text('${Provider.of<AuthProvider>(context, listen: false).userInfoModel!.firstName}', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),)
                  ],),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      onTap: (){/*
                        Provider.of<FormProvider>(context, listen: false).getStates(selectedState: -1, selectedLGA: -1);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileSetUPScreen(upDateProfile:true)),
                        );*/
                      },
                      child: Container(
                        height: 55,
                        width: 57,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(100)),
                            image:DecorationImage(
                              fit:BoxFit.fill,
                              image: NetworkImage(AppConstants.BASE_URL+authController.userInfoModel!.image),
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
                // Add a ListView to the drawer. This ensures the user can scroll
                // through the options in the drawer if there isn't enough vertical
                // space to fit everything.
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerHeader(
                        decoration: const BoxDecoration(
                          color: ColorResources.COLOR_PURPLE_MID,
                          borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(470, 150.0)),
                          //borderRadius: BorderRadius.only(bottomRight: Radius.circular(100), bottomLeft: Radius.circular(100))
                          //shape: BoxShape.circle,
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 10,),
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                                  image:DecorationImage(
                                    fit:BoxFit.fill,
                                    image: NetworkImage(AppConstants.BASE_URL+authController.userInfoModel!.image),
                                  )

                              ),
                            ),
                            const SizedBox(width: 10,),
                            Text(authController.userInfoModel!.firstName,  style: const TextStyle(fontSize: 20, color: ColorResources.COLOR_WHITE),)

                          ],
                        ),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.only(left: 60, top: 0, bottom: 0),
                        title: const Text('PROFILE'),//Profile
                        onTap: () {
                          Get.toNamed('/profile/update');
                          /*
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileSetUPScreen()),
                          );*/
                        },
                      ),
                      const Divider(),
                      ListTile(
                        contentPadding: const EdgeInsets.only(left: 60),
                        title: const Text('MY PATIENTS'),//My Patients
                        onTap: () {
                          print('get appointments');
                          /*
                          String token = Provider.of<AuthProvider>(context, listen: false).token;
                          Provider.of<AppointmentProvider>(context, listen: false).getAppointments(context, token, '1');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyPatientsScreen()),
                          );
                          */
                        },
                      ),
                      const Divider(),
                      /*
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 60),
                        title: const Text('Withdrawals'),
                        onTap: () {
                          //WithdrawScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WithdrawScreen()),
                          );
                        },
                      ),
                      Divider(),
                      */
                      ListTile(
                        contentPadding: const EdgeInsets.only(left: 60),
                        title: const Text('WALLET'),//Wallet
                        onTap: () {
                          Get.toNamed('/wallet');
                          /*
                          String token = Provider.of<AuthProvider>(context, listen: false).token;
                          //String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvc29ub2NhcmUuYXBwXC9hcGlcL2RvY3RvcmxvZ2luIiwiaWF0IjoxNjM0NzUwOTA5LCJleHAiOjIyMzQ3NTA5MDksIm5iZiI6MTYzNDc1MDkwOSwianRpIjoiaGpFdXVDdlVBOGlrSG1uNCIsInN1YiI6NDgsInBydiI6IjdmNzA2MmMzZDlkOTdhMjg3YjZkY2Y2NTkzNWFkNmRkZjJhNzI0N2YifQ.OG8qx1S5smsO8Me9Pw-zvczq51E_foHgHQNDRsI_V9c';
                          Provider.of<WalletProvider>(context, listen: false).getTransactions(context, token);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WalletScreen()),
                          );*/
                        },
                      ),
                      const Divider(),
                      ListTile(
                        contentPadding: const EdgeInsets.only(left: 60),
                        title: const Text('SCHEDULE TIMINGS'),//Schedule Timings
                        onTap: () {
                          //WithdrawScreen
                          /*
                          String token = Provider.of<AuthProvider>(context, listen: false).token;
                          Provider.of<ScheduleProvider>(context, listen: false).getSchedules(context, token, day: DateTime.now().weekday.toString());
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ScheduleTimingScreen()),
                          );*/
                        },
                      ),
                      const Divider(),
                      /*
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 60),
                        title: const Text('Invoices'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => InvoiceScreen()),
                          );
                        },
                      ),
                      Divider(),
                      */
                      ListTile(
                        contentPadding: const EdgeInsets.only(left: 60),
                        title: const Text('REVIEWS'),//Reviews
                        onTap: () {
                          Get.toNamed('/reviews');
                          /*
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ReviewsScreen()),
                          );*/
                        },
                      ),
                      const Divider(),
                      ListTile(
                        contentPadding: const EdgeInsets.only(left: 60),
                        title: const Text('MESSAGES'),//Message
                        onTap: () {
                          Get.toNamed('/message/list');
                          /*
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ChatListScreen()),
                          );*/
                        },
                      ),
                      const Divider(),
                      ListTile(
                        contentPadding: const EdgeInsets.only(left: 60),
                        title: const Text('SETTINGS'),//Settings
                        onTap: () {
                          Get.toNamed('/settings');
                          /*
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SettingsScreen()),
                          );*/
                        },
                      ),
                      const Divider(),
                      ListTile(
                        contentPadding: const EdgeInsets.only(left: 60),
                        title: const Text('LOGOUT'),//Logout
                        onTap: () async {
                          Get.toNamed('/');
                          //await authController.logout();
                          //Navigator.pop(context);
                          /*
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) => WelcomeScreen()),
                            ModalRoute.withName('/'),
                          );*/
                        },
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
                    child: LGConatiner(heading: 'Appointment', body: 'You have no bookings at the moment', imageUrl: 'assets/icons/appointment_icon.png'),
                    onTap: (){
                      print('get appointments');
                      /*
                      String token = Provider.of<AuthProvider>(context, listen: false).token;
                      Provider.of<AppointmentProvider>(context, listen: false).getAppointments(context, token, '0');
                       */
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PendingAppointmentScreen()),
                      );

                    },
                  ),
                  const SizedBox(height: 20,),
                  /*
                  Container(
                    height: 55,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                      SMConatiner(title:  'Total Patient'),
                      SMConatiner(title:  'Today\'s Patient'),
                      SMConatiner(title:  'Hospital Patient'),
                    ],),
                  ),
                  const SizedBox(height: 20,),*/
                  GestureDetector(
                    onTap: (){
                      print('get appointments');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PendingAppointmentScreen()),
                      );
                      /*
                      String token = Provider.of<AuthProvider>(context, listen: false).token;
                      Provider.of<AppointmentProvider>(context, listen: false).getAppointments(context, token, '1');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyPatientsScreen()),
                      );
                      */
                    },
                    child: LGConatiner(heading: 'Consultation', body: 'You have no bookings at the moment', bgColorTXT:'colored', imageUrl: 'assets/icons/consultation_icon.png'),
                  ),
                  const SizedBox(height: 30,),
                ],),
              ):
                    index==1?ChatListScreenDash():
                    //index==1?Center(child: Text('Messages', style: TextStyle(fontSize: 50, color: Colors.white),)):
                             //Center(child: Text('Settings', style: TextStyle(fontSize: 50, color: Colors.white),)),
                    SettingsScreenDash(),
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
                    icon: index==1?
                    Image.asset("assets/icons/chat_icon.png", height: 40, width: 40)
                        :Image.asset("assets/icons/chat_icon_light.png", height: 40, width: 40),
                    label: 'aa',
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
