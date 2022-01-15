import 'package:flutter/material.dart';
import 'package:sonocare_partner2/view/base/textField.dart';
import 'package:sonocare_partner2/view/base/textFieldNotStyled.dart';

class ChatListScreenDash extends StatelessWidget {
  ChatListScreenDash({Key? key}) : super(key: key);
  int numOfMessages = 0;
  final textField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: [
      //BackGround(),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: textFieldNotStyled(textController: textField,),
              ),
              if(numOfMessages>0)Column(
                children: List.generate(3, (index) {
                  return GestureDetector(
                    onTap: (){
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                  image:DecorationImage(
                                    fit:BoxFit.fill,
                                    image: AssetImage("assets/dummy/profile_dummy.png"),
                                  )
                              ),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Dr. Prince David', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                                SizedBox(height: 8,),
                                Row(
                                  children: [
                                    Text('Operand of null-aware operation', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,),),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text('You have no messages', style: TextStyle(color: Colors.white),),
                  )
                ],)
            ],),
          )
      ),
    ],);
  }
}
