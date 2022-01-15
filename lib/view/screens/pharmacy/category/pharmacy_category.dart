import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/lab_controller.dart';
import 'package:sonocare_partner2/controller/pharmacy_controller.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/screens/pharmacy/category/widgets/search_text_field.dart';

class PharmacyCategoryScreen extends StatefulWidget {
  const PharmacyCategoryScreen({Key? key}) : super(key: key);

  @override
  State<PharmacyCategoryScreen> createState() => _PharmacyCategoryScreenState();
}

class _PharmacyCategoryScreenState extends State<PharmacyCategoryScreen> {

  final searchCategoryController = TextEditingController();
  @override
  void initState() {
    Get.find<PharmacyController>().getPharmacyCategories();
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
            child: Text('Pharmacy Categories', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),),
          ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                GetBuilder<PharmacyController>(builder: (pharmacyController) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 10),
                      child: SearchTextFieldNotStyled(),
                    );
                  }
                ),
                const SizedBox(height: 2,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: const [
                      SizedBox(width: 2,),
                      Text('Categories', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),),
                    ],
                  ),
                ),
                const SizedBox(height: 2,),
                GetBuilder<PharmacyController>(builder: (pharmacyController) {
                    if(pharmacyController.loadingPharmacy){
                      return const Center(child: Text('Loading...'),);
                    }else if(pharmacyController.pharmacyCategories.isEmpty){
                      return const Center(child: Text('You don\'t have any category yet.'),);
                    }else{
                      return Expanded(
                          child: ListView.builder(
                            itemCount: pharmacyController.pharmacyCategories.length,
                            itemBuilder: (context, index) {
                              if(pharmacyController.pharmacyCategories.length-1==index){
                                return Column(children: [
                                  GestureDetector(
                                    onTap: (){Get.toNamed('/pharmacy/product/list', arguments: pharmacyController.pharmacyCategories[index]);},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(8.0)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Center(child: Text(pharmacyController.pharmacyCategories[index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 70,)
                                ],);
                              }
                              return GestureDetector(
                                onTap: (){Get.toNamed('/pharmacy/product/list', arguments: pharmacyController.pharmacyCategories[index]);},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8.0)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Center(child: Text(pharmacyController.pharmacyCategories[index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)),
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                      );
                    }
                  }
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: ColorResources.COLOR_PURPLE_DEEP,
            child: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Get.toNamed('/pharmacy/category/edit');
            },
          ),
        ),
      ],
    );
  }
}
