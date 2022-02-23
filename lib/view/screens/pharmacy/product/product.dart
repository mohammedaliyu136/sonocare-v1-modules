import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/lab_controller.dart';
import 'package:sonocare_partner2/controller/pharmacy_controller.dart';
import 'package:sonocare_partner2/data/model/response/lab_model.dart';
import 'package:sonocare_partner2/data/model/response/pharmacy_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/textFieldNotStyled.dart';
import 'package:sonocare_partner2/view/screens/pharmacy/product/widgets/search_text_field.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final searchCategoryController = TextEditingController();
  late DrugCategoryModel pharmacyCategory;

  @override
  void initState() {
    //pharmacyCategory = Get.arguments;
    //Get.find<PharmacyController>().getPharmacyProducts(pharmacyCategoryModel: pharmacyCategory);
    Get.find<PharmacyController>().getPharmacyProducts();
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
          appBar: AppBar(title: Padding(
            padding: const EdgeInsets.only(left: 0.0, top: 10.0, bottom: 20.0),
            child: Text('Products', style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),),
          ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
                onTap: ()=>Navigator.pop(context),
                child: Image.asset(Images.backArrowIcon)),
            /*
            actions: [
              IconButton(onPressed: ()=>Get.toNamed('/pharmacy/category/edit', arguments: pharmacyCategory), icon: const Icon(Icons.edit))
            ],
            */
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 0, bottom: 10),
                  child: SearchTextFieldNotStyled(),
                ),
                const SizedBox(height: 2,),
                GetBuilder<PharmacyController>(builder: (pharmacyController) {
                  if(pharmacyController.loadingPharmacy){
                    return const Center(child: Text('Loading...'),);
                  }else if(pharmacyController.pharmacyProducts.isEmpty){
                    return const Center(child: Text('You don\'t have any products yet.'),);
                  }else{
                    return Expanded(
                        child: ListView.builder(
                          itemCount: pharmacyController.pharmacyProducts.length,
                          itemBuilder: (context, index) {
                            if(pharmacyController.pharmacyProducts.length-1==index){
                              return Column(children: [
                                GestureDetector(
                                  onTap: (){Get.toNamed('/pharmacy/product/edit', arguments: pharmacyController.pharmacyProducts[index]);},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8.0)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Center(child: Text(pharmacyController.pharmacyProducts[index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 70,)
                              ],);
                            }
                            return GestureDetector(
                              onTap: (){Get.toNamed('/pharmacy/product/edit', arguments: pharmacyController.pharmacyProducts[index]);},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Center(child: Text(pharmacyController.pharmacyProducts[index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)),
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
            onPressed: () {Get.toNamed('/pharmacy/product/edit');},
          ),
        ),
      ],
    );
  }
}
