import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/lab_controller.dart';
import 'package:sonocare_partner2/data/model/response/lab_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';

class LabTestEditScreen extends StatefulWidget {
  LabTestEditScreen({Key? key}) : super(key: key);

  @override
  State<LabTestEditScreen> createState() => _LabTestEditScreenState();
}

class _LabTestEditScreenState extends State<LabTestEditScreen> {
  final testNameController = TextEditingController();
  final testFeeController = TextEditingController();
  LabCategoryModel? selectedLabCategory;
  bool update = false;
  int index = 0;

  @override
  void initState() {
    if(Get.arguments!=null){
      update = true;
      LabTestModel labTest = Get.arguments['labTest'];
      index = Get.arguments['index'];
      testNameController.text=labTest.name;
      testFeeController.text=labTest.fee;
      selectedLabCategory = labTest.labCategory;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        const BackGround(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(title: const Padding(
            padding: EdgeInsets.only(left: 0.0, top: 10.0, bottom: 20.0),
            child: Text('Lab Test', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),),
          ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
                onTap: ()=>Get.back(),
                child: Image.asset(Images.backArrowIcon)),
          ),
          body: GetBuilder<LabController>(builder: (labController) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ListView(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: testNameController,
                          validator: null,
                          enabled: true,
                          obscureText: false,
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(
                                color: Colors.grey
                            ),
                            hintText: 'Enter Test Name',
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
                    ),
                    const SizedBox(height: 16,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: testFeeController,
                          validator: null,
                          enabled: true,
                          obscureText: false,
                          decoration: const InputDecoration(
                            //labelText: 'Enter your username',
                            hintStyle: TextStyle(
                                color: Colors.grey
                            ),
                            hintText: 'Enter Test Fee',
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
                    ),
                    const SizedBox(height: 18,),
                    Container(
                      margin: const EdgeInsets.all(3.0),
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: const BorderRadius.all(Radius.circular(10))

                      ),
                      child: DropdownButton<LabCategoryModel>(
                        isExpanded: true,
                        dropdownColor: ColorResources.COLOR_PURPLE_DEEP,
                        underline: Container(color: Colors.transparent),
                        items: labController.labCategories.map((LabCategoryModel LabCategory) {
                          return DropdownMenuItem<LabCategoryModel>(
                            value: LabCategory,
                            child: Text(LabCategory.name, style: const TextStyle(color: Colors.white),),
                          );
                        }).toList(),
                        onChanged: (labCategory){
                          setState(() {
                            selectedLabCategory=labCategory;
                          });
                        },
                        value: selectedLabCategory??labController.labCategories[0],
                      ),
                    ),

                    labController.loadingLab?
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                        ],
                      ),
                    )
                        :Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 0, top: 20, bottom: 10),
                      child: Row(
                        children: [
                          Expanded(child: normalButton(
                              backgroundColor: ColorResources.COLOR_PURPLE_MID,
                              button_text: update?'Update':'submit'.tr,
                              primaryColor: ColorResources.COLOR_WHITE,
                              fontSize: 16,
                              onTap: () async {
                                if(selectedLabCategory!= null){
                                  if(update){
                                    labController.updateLabTests(index:index, labTest: LabTestModel(id: '', name: testNameController.text, fee: testFeeController.text, labCategory: selectedLabCategory)).then((response){
                                      if(response){
                                        Get.back();
                                      }
                                    });
                                  }else{
                                    labController.addLabTests(labTest: LabTestModel(id: '', name: testNameController.text, fee: testFeeController.text, labCategory: selectedLabCategory)).then((response){
                                      if(response){
                                        Get.back();
                                      }
                                    });
                                  }
                                }
                              }
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ],
    );
  }
}
