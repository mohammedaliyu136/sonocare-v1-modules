import 'package:flutter/material.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/screens/wallet/bank_account.dart';

class WalletSettings extends StatefulWidget {
  const WalletSettings({Key? key}) : super(key: key);

  @override
  _WalletSettingsState createState() {
    return _WalletSettingsState();
  }
}

class _WalletSettingsState extends State<WalletSettings> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
            title: const Text('Wallet Settings', style: TextStyle(color: Colors.white),),
            elevation: 0,
          ),
          body: ListView(children: [
            ListTile(
                title: const Text('Bank Account', style: TextStyle(color: Colors.white),),
                leading: const Icon(Icons.person, color: Colors.white,),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
              onTap: (){
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BankAccountScreen()),
                );
              },
            ),
          ]))
    ],);
  }
}