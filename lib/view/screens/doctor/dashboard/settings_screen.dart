
import 'package:flutter/material.dart';
import 'package:sonocare_partner2/view/screens/settings/about_screen.dart';
import 'package:sonocare_partner2/view/screens/settings/help_screen.dart';
import 'package:sonocare_partner2/view/screens/settings/privacy_screen.dart';
import 'package:sonocare_partner2/view/screens/settings/terms_and_conditions_screen.dart';


class SettingsScreenDash extends StatelessWidget {
  SettingsScreenDash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: [
      //DarkBackGround(),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(children: [
            ListTile(title: const Text('Notification', style: TextStyle(color: Colors.white),),leading: const Icon(Icons.notifications, color: Colors.white,), trailing: Switch(onChanged: (bool value) {  }, value: true,activeColor: Colors.green,)),
            const ListTile(title: const Text('Account Settings', style: TextStyle(color: Colors.white),),leading: const Icon(Icons.person, color: Colors.white,), trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white,)),
            ListTile(
                title: const Text('Security', style: TextStyle(color: Colors.white),),
                leading: const Icon(Icons.lock, color: Colors.white,),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
                onTap: (){
                  //Navigator.push(
                   // context,
                   // MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
                  //);
                  //ForgetPasswordScreen
                  /*
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgetPasswordScreen()),
                  );*/
                },
            ),
            /*
            const ListTile(
                title: Text('Ads', style: TextStyle(color: Colors.white),),
                leading: Icon(Icons.all_out_sharp, color: Colors.white,),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white,)),
            */
            ListTile(
                title: const Text('Help', style: const TextStyle(color: Colors.white),),
                leading: const Icon(Icons.camera, color: Colors.white,),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HelpScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Privacy', style: const TextStyle(color: Colors.white),),
              leading: const Icon(Icons.visibility, color: Colors.white,),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
              onTap: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyScreen()),
                );
              },
            ),
            ListTile(
                title: const Text('Terms and Conditions', style: TextStyle(color: Colors.white),),
                leading: const Icon(Icons.info, color: Colors.white,),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TermsAndConditionsScreen()),
                );
              },
            ),
            ListTile(
                title: const Text('About', style: TextStyle(color: Colors.white),),
                leading: const Icon(Icons.info, color: Colors.white,),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
            ),
          ]))
    ],);
  }
}
