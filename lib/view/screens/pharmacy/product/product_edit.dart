import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/lab_controller.dart';
import 'package:sonocare_partner2/controller/pharmacy_controller.dart';
import 'package:sonocare_partner2/data/model/response/lab_model.dart';
import 'package:sonocare_partner2/data/model/response/pharmacy_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
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
  final nameController = TextEditingController();

  final unitPriceController = TextEditingController();
  final packetPriceController = TextEditingController();
  final descriptionController = TextEditingController();
  final dosageController = TextEditingController();
  DrugTypeModel? drugType;
  DrugBrandModel? drugBrand;
  DrugCategoryModel? drugCategory;// = DrugCategoryModel(id: '', name: 'Antigout agents');

  late PharmacyProductModel product;
  bool update = false;
  int categoryIndex = 0;
  int brandIndex = 0;
  int typeIndex = 0;

  @override
  void initState() {
    if(Get.arguments!=null){
      update = true;
      product = Get.arguments;
      nameController.text=product.name;
      unitPriceController.text = product.unitPrice.toString();
      packetPriceController.text = product.packPacketPrice.toString();
      descriptionController.text = product.description.toString();
      dosageController.text = product.dosage.toString();
      /*
      if(product.category != null){
        drugCategory = product.category!;
        for( var i = 0 ; i < Get.find<PharmacyController>().mPharmacyCategories.length; i++ ) {
          if(product.category!.name==Get.find<PharmacyController>().mPharmacyCategories[i].name){
            categoryIndex=i;
            break;
          }
        }
      }
      if(product!= null){
        drugBrand = product.brand;
        for( var i = 0 ; i < Get.find<PharmacyController>().mPharmacyBrands.length; i++ ) {
          if(product.brand.name==Get.find<PharmacyController>().mPharmacyBrands[i].name){
            brandIndex=i;
            break;
          }
        }
      }
      if(product.type != null){
        drugType = product.type;
        for( var i = 0 ; i < Get.find<PharmacyController>().mPharmacyTypes.length; i++ ) {
          if(product.type.name==Get.find<PharmacyController>().mPharmacyTypes[i].name){
            typeIndex=i;
            break;
          }
        }
      }
      */
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
            leading: GestureDetector(
                onTap: ()=>Navigator.pop(context),
                child: Image.asset(Images.backArrowIcon)),
          ),
          body: GetBuilder<PharmacyController>(builder: (pharmacyController) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ListView(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Text('Name', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: nameController,
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
                        ),
                      ],
                    ),
                    const SizedBox(height: 16,),
                    Row(
                      children: [
                        const Text('Unit Price', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: unitPriceController,
                                validator: null,
                                enabled: true,
                                obscureText: false,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  //labelText: 'Enter your username',
                                  hintStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  hintText: 'Enter Product Unit Price',
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
                        ),
                      ],
                    ),
                    const SizedBox(height: 16,),
                    Row(
                      children: [
                        const Text('Packet Price', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: packetPriceController,
                                validator: null,
                                enabled: true,
                                obscureText: false,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  //labelText: 'Enter your username',
                                  hintStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  hintText: 'Enter Pack / Packet Price',
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
                        ),
                      ],
                    ),
                    const SizedBox(height: 16,),
                    Row(
                      children: [
                        const Text('Description', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: descriptionController,
                                validator: null,
                                enabled: true,
                                minLines: 2,
                                maxLines: 10,
                                obscureText: false,
                                decoration: const InputDecoration(
                                  //labelText: 'Enter your username',
                                  hintStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  hintText: 'Enter Description',
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
                        ),
                      ],
                    ),
                    const SizedBox(height: 16,),
                    Row(
                      children: [
                        const Text('Dosage', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: dosageController,
                                validator: null,
                                enabled: true,
                                obscureText: false,
                                decoration: const InputDecoration(
                                  //labelText: 'Enter your username',
                                  hintStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  hintText: 'Enter Dosage',
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
                        ),
                      ],
                    ),
                    const SizedBox(height: 18,),
                    Row(
                      children: [
                        const Text('Type', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            padding:  const EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButton<DrugTypeModel>(
                              isExpanded: true,
                              dropdownColor: ColorResources.COLOR_PURPLE_DEEP,
                              underline: Container(color: Colors.transparent),
                              items: pharmacyController.drugTypes.map((DrugTypeModel drugType) {
                                return DropdownMenuItem<DrugTypeModel>(
                                  value: drugType,
                                  child: Text(drugType.name, style: const TextStyle(color: Colors.white),),
                                );
                              }).toList(),
                                onChanged: (value){
                                  setState(() {
                                    drugType = value!;
                                    typeIndex=0;
                                  });
                                },
                              value: drugType??pharmacyController.drugTypes[0]
                            )
                              //value: typeIndex!=0?pharmacyController.pharmacyTypes[typeIndex]:drugType!=null?drugType:pharmacyController.pharmacyTypes[0]                            )//typeIndex!=0?pharmacyController.pharmacyTypes[typeIndex]:drugType!=null?drugType:pharmacyController.pharmacyTypes[0]),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18,),
                    Row(
                      children: [
                        const Text('Brand', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            padding:  const EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButton<DrugBrandModel>(
                              isExpanded: true,
                              dropdownColor: ColorResources.COLOR_PURPLE_DEEP,
                              underline: Container(color: Colors.transparent),
                              items: pharmacyController.drugBrands.map((DrugBrandModel drugBrand) {
                                return DropdownMenuItem<DrugBrandModel>(
                                  value: drugBrand,
                                  child: Text(drugBrand.name, style: const TextStyle(color: Colors.white),),
                                );
                              }).toList(),
                                onChanged: (value){
                                  setState(() {
                                    drugBrand = value!;
                                    brandIndex=0;
                                  });
                                },
                                value: drugBrand??pharmacyController.drugBrands[0],
                                //value: brandIndex==0?drugBrand??pharmacyController.drugBrands[0]:pharmacyController.drugBrands[typeIndex]//brandIndex!=0?pharmacyController.pharmacyBrands[brandIndex]:drugBrand
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18,),
                    Row(
                      children: [
                        const Text('Category', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            padding:  const EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButton<DrugCategoryModel>(
                              isExpanded: true,
                              dropdownColor: ColorResources.COLOR_PURPLE_DEEP,
                              underline: Container(color: Colors.transparent),
                              items: pharmacyController.pharmacyCategories.map((DrugCategoryModel drugCategory) {
                                return DropdownMenuItem<DrugCategoryModel>(
                                  value: drugCategory,
                                  child: Text(drugCategory.name, style: const TextStyle(color: Colors.white),),
                                );
                              }).toList(),
                              onChanged: (value){
                                setState(() {
                                  drugCategory = value!;
                                  categoryIndex=0;
                                });
                              },
                              value: drugCategory??pharmacyController.pharmacyCategories[categoryIndex],
                              //value: categoryIndex!=0?pharmacyController.pharmacyCategories[categoryIndex]:drugCategory
                            ),
                          ),
                        ),
                      ],
                    ),

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

                                pharmacyController.addPharmacyProduct(pharmacyProduct: PharmacyProductModel(
                                    id: '', name: nameController.text,
                                    category: drugCategory??pharmacyController.pharmacyCategories[0],
                                    dosage: dosageController.text, packPacketPrice: double.parse(packetPriceController.text),
                                    description: descriptionController.text, unitPrice: double.parse(unitPriceController.text),
                                    type: drugType??pharmacyController.drugTypes[0], brand: drugBrand??pharmacyController.drugBrands[0]
                                )).then((response){
                                  if(response){
                                    Get.back();
                                  }
                                });

                              }
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50,)
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
