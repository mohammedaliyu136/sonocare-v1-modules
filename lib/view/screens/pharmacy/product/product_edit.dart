import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/lab_controller.dart';
import 'package:sonocare_partner2/controller/pharmacy_controller.dart';
import 'package:sonocare_partner2/data/model/response/lab_model.dart';
import 'package:sonocare_partner2/data/model/response/pharmacy_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/base/textField.dart';
import 'package:sonocare_partner2/view/base/textFieldNotStyled.dart';

class PharmacyProductEditScreen extends StatefulWidget {
  const PharmacyProductEditScreen({Key? key}) : super(key: key);

  @override
  State<PharmacyProductEditScreen> createState() => _PharmacyProductEditScreenState();
}

class _PharmacyProductEditScreenState extends State<PharmacyProductEditScreen> {
  final productNameController = TextEditingController();

  final productCostController = TextEditingController();
  late PharmacyProductModel product;
  bool update = false;

  @override
  void initState() {
    if(Get.arguments!=null){
      update = true;
      product = Get.arguments;
      productNameController.text=product.name;
      productCostController.text = "200";
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
            child: Text('Product', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),),
          ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: GetBuilder<PharmacyController>(builder: (pharmacyController) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ListView(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: productNameController,
                          validator: null,
                          enabled: true,
                          obscureText: false,
                          decoration: const InputDecoration(
                            //labelText: 'Enter your username',
                            hintStyle: TextStyle(
                                color: Colors.grey
                            ),
                            hintText: 'Enter Product Name',
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
                          controller: productCostController,
                          validator: null,
                          enabled: true,
                          obscureText: false,
                          decoration: const InputDecoration(
                            //labelText: 'Enter your username',
                            hintStyle: TextStyle(
                                color: Colors.grey
                            ),
                            hintText: 'Enter Product Fee',
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

                    pharmacyController.loadingPharmacy?
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
                              button_text: Get.arguments==null?'submit'.tr:'Update',
                              primaryColor: ColorResources.COLOR_WHITE,
                              fontSize: 16,
                              onTap: () async {
                                pharmacyController.addPharmacyProduct(pharmacyProduct: PharmacyProductModel(id: '', name: productNameController.text, pharmacyCategory: PharmacyCategoryModel(id: '', name: ''))).then((response){
                                  if(response){
                                    Get.back();
                                  }
                                });
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
