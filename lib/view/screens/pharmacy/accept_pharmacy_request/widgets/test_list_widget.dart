import 'package:flutter/material.dart';

testListWidget({required rowNumber, required rowText}){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3.0),
    child: Row(children: [
      //  26th May 2021 (09:00 AM - 10 PM)
      Expanded(child: Text('$rowNumber. $rowText', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white, letterSpacing: 1.1),))
    ],),
  );
}