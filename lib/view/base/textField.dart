import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  textField({ required this.hintText,  required this.label,  required this.icon, required this.controller, required this.validator, required this.onChanged, this.obscureText=false, this.enable=true});
  final TextEditingController controller;
  final Function() validator;
  bool obscureText = false;
  bool enable;
  String hintText = '';
  String label = '';
  Icon icon = const Icon(Icons.ac_unit);
  final Function() onChanged;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: icon,
              ),
              SizedBox(width: 1,child: Container(color: Colors.white,), height: 50,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, bottom: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(label==''?'TEST':label, textAlign: TextAlign.start, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
                      TextFormField(
                        controller: controller,
                         validator: validator(),
                        enabled: enable,
                        obscureText: obscureText,
                        style: TextStyle(color: Colors.white.withOpacity(.6)),
                        decoration: InputDecoration(
                          //labelText: 'Enter your username',
                          hintStyle: const TextStyle(
                            color: Colors.grey
                          ),
                          hintText: hintText!=''?hintText:'Enter your TEST',
                          contentPadding: const EdgeInsets.symmetric(vertical: 5), //Change this value to custom as you like
                          isDense: true, // and add this line
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                              style: BorderStyle.none
                            ),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                              style: BorderStyle.none
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],),
            SizedBox(width: MediaQuery.of(context).size.width,child: Container(color: Colors.white,), height: 1,),
          ],
    );
  }
}
