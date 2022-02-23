import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/hospital_controller.dart';
import 'package:sonocare_partner2/controller/lab_controller.dart';

class SearchTextFieldNotStyled extends StatelessWidget {

  const SearchTextFieldNotStyled({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<HospitalController>(builder: (labController) {
      return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        child: TextField(
          onChanged: (val)=>labController.searchHospitalRequests(searchText: val),
          decoration: const InputDecoration(
            hintText: 'Search',
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
            prefixIcon: Icon(Icons.search),
          ),
        ),
      );
    }
    );
  }
}
