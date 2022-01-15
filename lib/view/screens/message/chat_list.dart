import 'package:flutter/material.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/textField.dart';
import 'package:sonocare_partner2/view/base/textFieldNotStyled.dart';
import 'package:sonocare_partner2/view/screens/message/chat_detail.dart';

class ChatListScreen extends StatelessWidget {
  ChatListScreen({Key? key}) : super(key: key);
  int numOfMessages = 0;
  final textField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: [
      const BackGround(),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text('Message'),
            elevation: 0,
            leading: GestureDetector(
                onTap: ()=>Navigator.pop(context),
                child: Image.asset(Images.backArrowIcon)),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: textFieldNotStyled(textController: textField,),
              ),
              if(numOfMessages>0)Column(
                children: List.generate(numOfMessages, (index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatDetailScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(const Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                  image:DecorationImage(
                                    fit:BoxFit.fill,
                                    image: AssetImage("assets/dummy/profile_dummy.png"),
                                  )
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Dr. Prince David', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                                const SizedBox(height: 8,),
                                Row(
                                  children: [
                                    const Text('Operand of null-aware operation', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400,),),
                                  ],
                                ),
                              ],)
                          ],),
                        ),
                      ),
                    ),
                  );
                }),),
              if(numOfMessages==0)Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: const Text('You have no messages', style: TextStyle(color: Colors.white),),
                  )
                ],)
            ],),
          )
      ),
    ],);
  }
}
