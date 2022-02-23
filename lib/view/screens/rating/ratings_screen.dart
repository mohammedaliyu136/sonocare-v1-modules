import 'package:flutter/material.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/screens/refer/refer_screen.dart';

class RateScreen extends StatefulWidget {
  RateScreen({Key? key}) : super(key: key);

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  final rateDetailController = TextEditingController();

  double rateVal = 0;

  setRatingStar(val){
    setState(() {
      rateVal=val;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: [
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Center(child: Text('Rate Patient', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),)),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                GestureDetector(onTap: ()=>setRatingStar(1.0),child: Icon(Icons.star, size: 50, color: rateVal>0.0?Colors.deepOrange:Colors.grey,)), SizedBox(width: 10,),
                GestureDetector(onTap: ()=>setRatingStar(2.0),child: Icon(Icons.star, size: 50, color: rateVal>1.0?Colors.deepOrange:Colors.grey,)), SizedBox(width: 10,),
                GestureDetector(onTap: ()=>setRatingStar(3.0),child: Icon(Icons.star, size: 50, color: rateVal>2.0?Colors.deepOrange:Colors.grey,)), SizedBox(width: 10,),
                GestureDetector(onTap: ()=>setRatingStar(4.0),child: Icon(Icons.star, size: 50, color: rateVal>3.0?Colors.deepOrange:Colors.grey,)), SizedBox(width: 10,),
                GestureDetector(onTap: ()=>setRatingStar(5.0),child: Icon(Icons.star, size: 50, color: rateVal>4.0?Colors.deepOrange:Colors.grey,)), SizedBox(width: 10,),
              ],),
              const SizedBox(height: 20,),
              Row(
                children: const [
                  Text("Review", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),),
                ],
              ),
              const SizedBox(height: 5,),
              Container(
                padding: const EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TextFormField(
                  controller: rateDetailController,
                  validator: null,
                  enabled: true,
                  minLines: 4,
                  maxLines: 10,
                  obscureText: false,
                  decoration: const InputDecoration(
                    //labelText: 'Enter your username',
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    hintText: 'Enter Review Details',
                    contentPadding: EdgeInsets.symmetric(vertical: 5), //Change this value to custom as you like
                    isDense: true, // and add this line
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                          style: BorderStyle.none
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                          style: BorderStyle.none
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 0, top: 50, bottom: 10),
                child: Row(
                  children: [
                    Expanded(child: normalButton(
                        backgroundColor: ColorResources.COLOR_PURPLE_DEEP,
                        button_text: 'Submit',
                        primaryColor: ColorResources.COLOR_WHITE,
                        fontSize: 16,
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ReferScreen()),
                          );
                        }
                    )),
                  ],
                ),
              ),
                const SizedBox(height: 100,)
            ],),
          ),
        ),
      )
    ],);
  }
}
