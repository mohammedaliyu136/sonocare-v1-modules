import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/pharmacy_controller.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/screens/pharmacy/request/widgets/search_text_field.dart';

class PharmacyRequestListScreen extends StatefulWidget {
  const PharmacyRequestListScreen({Key? key}) : super(key: key);

  @override
  State<PharmacyRequestListScreen> createState() => _PharmacyRequestListScreenState();
}

class _PharmacyRequestListScreenState extends State<PharmacyRequestListScreen> {

  @override
  void initState() {
    Get.find<PharmacyController>().getPharmacyRequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackGround(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(title: const Padding(
            padding: EdgeInsets.only(left: 0.0, top: 10.0, bottom: 20.0),
            child: Text('Pharmacy Requests', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),),
          ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
                onTap: ()=>Get.back(),
                child: Image.asset(Images.backArrowIcon)),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 0, bottom: 10),
                  child: SearchTextFieldNotStyled(),
                ),
                const SizedBox(height: 8,),
                Expanded(
                  child: GetBuilder<PharmacyController>(builder: (pharmacyController) {
                    if(pharmacyController.loadingPharmacy){
                      return const Center(child: Text('Loading...'),);
                    }else if(pharmacyController.pharmacyRequests.isEmpty){
                      return const Center(child: Text('You don\'t have any requests yet.'),);
                    }else{
                      return ListView.builder(
                          itemCount: pharmacyController.pharmacyRequests.length,
                          itemBuilder: (context, index) {
                            if(pharmacyController.pharmacyRequests.length-1==index){
                              return Column(children: [
                                GestureDetector(
                                  onTap: (){Get.toNamed('/pharmacy/request/accept', arguments: pharmacyController.pharmacyRequests[index]);},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Row(children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(100)),
                                            ),
                                            child: Image.network(
                                              '',
                                              fit: BoxFit.cover,
                                              loadingBuilder: (context, child, loadingProgress) {
                                                if (loadingProgress == null) return child;

                                                return const Center(child: Text('Loading...'));
                                                // You can use LinearProgressIndicator or CircularProgressIndicator instead
                                              },
                                              errorBuilder: (context, error, stackTrace) =>
                                              //Text('Some errors occurred!'),
                                              Image.asset("assets/dummy/profile_dummy.png"),
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(pharmacyController.pharmacyRequests[index].name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                                              const SizedBox(height: 10,),
                                              Row(
                                                children: [
                                                  Text(pharmacyController.pharmacyRequests[index].date, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                                  const SizedBox(width: 20,),
                                                  Text(pharmacyController.pharmacyRequests[index].time, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                                ],
                                              ),
                                            ],)
                                        ],),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 70,)
                              ],);
                            }
                            return GestureDetector(
                              onTap: (){
                                Get.toNamed('/pharmacy/request/accept', arguments: pharmacyController.pharmacyRequests[index]);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Row(children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(100)),
                                        ),
                                        child: Image.network(
                                          '',
                                          fit: BoxFit.cover,
                                          loadingBuilder: (context, child, loadingProgress) {
                                            if (loadingProgress == null) return child;

                                            return const Center(child: Text('Loading...'));
                                            // You can use LinearProgressIndicator or CircularProgressIndicator instead
                                          },
                                          errorBuilder: (context, error, stackTrace) =>
                                          //Text('Some errors occurred!'),
                                          Image.asset("assets/dummy/profile_dummy.png"),
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(pharmacyController.pharmacyRequests[index].name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                                          const SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              Text(pharmacyController.pharmacyRequests[index].date, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                              const SizedBox(width: 20,),
                                              Text(pharmacyController.pharmacyRequests[index].time, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                            ],
                                          ),
                                        ],)
                                    ],),
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                  }
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: ColorResources.COLOR_PURPLE_DEEP,
            child: const Icon(Icons.add, color: Colors.white),
            onPressed: ()=>Get.toNamed('/pharmacy/product/list'),
          ),
        ),
      ],
    );
  }
}
