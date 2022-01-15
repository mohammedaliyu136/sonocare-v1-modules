import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/screens/welcome/welcome_screen.dart';
class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getLoginType();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getLoginType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user_login_type = await prefs.getString('user_login_type')??'';

    if(user_login_type.length>1){
      //Provider.of<AppProviderNurse>(context, listen: false).setFire();
      //Provider.of<AppProviderNurse>(context, listen: false).setContext(context);
      //if(user_login_type=='doctor'){
      //  Provider.of<AuthProvider>(context, listen: false).getUserDetail(context: context);
      //}
      //if(user_login_type=='nurse'){
      //  Provider.of<NurseAuthProvider>(context, listen: false).getUserDetail(context: context);
      //}
    }else{
      await Future.delayed(const Duration(seconds: 1));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: ColorResources.COLOR_PURPLE_DEEP,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Row(
              children: [
                Image.asset(Images.scope),
              ],
            ),
          ],),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                  Image.asset(Images.main_logo),
                    /*
                    Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 20),
                    child: Text('welcome_to_SonoCare_your_health_is_our_priority'.tr, style: const TextStyle(
                        height: 2,
                        color: ColorResources.COLOR_WHITE,
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                    ), textAlign: TextAlign.center,),
                  ),
                    */
                    const Center(child: CircularProgressIndicator())
                ],),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
