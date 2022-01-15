import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/screens/auth/forget_password.dart';
import 'package:sonocare_partner2/view/screens/settings/about_screen.dart';
import 'package:sonocare_partner2/view/screens/settings/help_screen.dart';
import 'package:sonocare_partner2/view/screens/settings/privacy_screen.dart';
import 'package:sonocare_partner2/view/screens/wallet/wallet_settings.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
            title: const Text('Settings', style: TextStyle(color: Colors.white),),
            elevation: 0,
          ),
          body: ListView(children: [
            ListTile(title: const Text('Notification', style: TextStyle(color: Colors.white),),leading: const Icon(Icons.notifications, color: Colors.white,), trailing: Switch(onChanged: (bool value) {  }, value: true,activeColor: Colors.green,)),
            ListTile(
                title: const Text('Account Settings',
                  style: TextStyle(color: Colors.white),),
                leading: const Icon(Icons.person, color: Colors.white,),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WalletSettings()),
                  );
                },
            ),
            ListTile(
                title: const Text('Privacy', style: TextStyle(color: Colors.white),),
                leading: const Icon(Icons.visibility, color: Colors.white,),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PrivacyScreen()),
                  );
                },
            ),
            ListTile(
                title: const Text('Security', style: TextStyle(color: Colors.white),),
                leading: const Icon(Icons.lock, color: Colors.white,),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
                onTap: (){
                  Get.toNamed('/forget-password');
                },
            ),
            const ListTile(
                title: Text('Ads', style: TextStyle(color: Colors.white),),
                leading: Icon(Icons.all_out_sharp, color: Colors.white,),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white,)),
            ListTile(
                title: const Text('Help', style: TextStyle(color: Colors.white),),
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
