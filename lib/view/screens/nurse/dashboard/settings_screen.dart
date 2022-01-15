import 'package:flutter/material.dart';


class SettingsScreenDash extends StatelessWidget {
  const SettingsScreenDash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: [
      //DarkBackGround(),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(children: [
            ListTile(title: const Text('Notification', style: TextStyle(color: Colors.white),),leading: const Icon(Icons.notifications, color: Colors.white,), trailing: Switch(onChanged: (bool value) {  }, value: true,activeColor: Colors.green,)),
            const ListTile(title: Text('Account Settings', style: TextStyle(color: Colors.white),),leading: Icon(Icons.person, color: Colors.white,), trailing: Icon(Icons.arrow_forward_ios, color: Colors.white,)),
            ListTile(
                title: const Text('Privacy', style: TextStyle(color: Colors.white),),
                leading: const Icon(Icons.visibility, color: Colors.white,),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
                onTap: (){
                  /*
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrivacyScreen()),
                  );
                  */
                },
            ),
            ListTile(
                title: const Text('Security', style: TextStyle(color: Colors.white),),
                leading: const Icon(Icons.lock, color: Colors.white,),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
                onTap: (){
                  /*
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgetPasswordScreen()),
                  );
                  */
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
                  /*
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpScreen()),
                );
                */
              },
            ),
            ListTile(
                title: const Text('About', style: TextStyle(color: Colors.white),),
                leading: const Icon(Icons.info, color: Colors.white,),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
              onTap: (){
                  /*
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutScreen()),
                );
                */
              },
            ),
          ]))
    ],);
  }
}
