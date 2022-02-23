import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';

class ReferScreen extends StatelessWidget {
  ReferScreen({Key? key}) : super(key: key);

  String shareMessage = "Hey, I use SonoCare to consult health care professionals regarding my health from the comfort of my home. They have vetted health care professional. Give it a try using my code ";
  String appLink = "Sign up using this link http://sonocare.com";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackGround(),
        /*
        Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height/3*2+50,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70), bottomRight: const Radius.circular(70)),
            color: ColorResources.COLOR_PURPLE_MID,
          ),
        ),
        */
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: const Icon(Icons.category, color: Colors.transparent,),
            actions: [const Icon(Icons.cancel, size: 50,), const SizedBox(width: 30,)],),
          body: SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Center(child: Text('Refer Friends / Family to Earn', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),)),
                      const SizedBox(height: 20,),
                      Image.asset('assets/icons/gift_icon.png'),
                      const SizedBox(height: 20,),
                      const Center(child: Text('Your friends get a 100 point for Sign Up, and you also get a 100 times point too everytime', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400, height: 1.6), textAlign: TextAlign.justify,)),
                      const SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2)
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                 Text('Your Refferal Code', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),),
                                 SizedBox(height: 4,),
                                 Text('ABCDE123', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),),
                              ],),
                            ),
                            SizedBox(height: 70, child: Container(color: Colors.white, width: 2,),),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                              child: Text('Copy\nCode', style: TextStyle(color: Colors.white, height: 1.4),),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Center(child: Text('Share your referral code via', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),)),
                      ),
                      /*
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: ColorResources.COLOR_PURPLE_DEEP,
                            ),
                            child: const Text('Facebook', style: TextStyle(color: Colors.white),),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: ColorResources.COLOR_PURPLE_DEEP,
                            ),
                            child: const Text('Whatsapp', style: TextStyle(color: Colors.white),),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: ColorResources.COLOR_PURPLE_DEEP,
                            ),
                            child: const Text('Instagram', style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ],),
                      */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        GestureDetector(
                          onTap: (){
                            String shareTXT = shareMessage+'ABCDE123'+'. '+appLink;
                            Share.share(shareTXT);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: ColorResources.COLOR_PURPLE_MID,
                              ),
                              child: const Text('Share My Code', style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                      ],),
                      const SizedBox(height: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text('Frequently Asked Questions', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w700),),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('What is refer and Earn?', style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w400),),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('How it Works?', style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w400),),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('Where Can i use this Points?', style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w400),),
                          ),

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, right: 0, top: 20, bottom: 10),
                        child: Row(
                          children: [
                            Expanded(child: normalButton(
                                backgroundColor: ColorResources.COLOR_PURPLE_MID,
                                button_text: 'Dashboard',
                                primaryColor: ColorResources.COLOR_WHITE,
                                fontSize: 16,
                                onTap: () async {
                                  Get.toNamed('/');
                                }
                            )),
                          ],
                        ),
                      ),
                    ],),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
