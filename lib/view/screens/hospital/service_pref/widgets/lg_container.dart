import 'package:flutter/material.dart';



LGConatiner({required heading, required body, bgColorTXT = '', imageUrl}){
  var bgColor = Colors.white.withOpacity(0.56);
  if(bgColorTXT=='colored'){
    bgColor = const Color.fromRGBO(78, 0, 118, 0.47);
  }
  return Container(
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20))
    ),
    child: Row(children: [
      Expanded(
        flex: 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:14.0, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(heading, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(body, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.8), letterSpacing: 1.3, height: 1.5),),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset('assets/icons/right-arrow_icon.png'),
              )
            ],),
        ),
      )
    ],),
  );
}
