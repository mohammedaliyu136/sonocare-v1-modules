import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/hospital_controller.dart';
import 'package:sonocare_partner2/controller/lab_controller.dart';
import 'package:sonocare_partner2/controller/hospital_controller.dart';
import 'package:sonocare_partner2/data/model/response/lab_model.dart';
import 'package:sonocare_partner2/data/model/response/hospital_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/textFieldNotStyled.dart';
import 'package:sonocare_partner2/view/screens/hospital/service/widgets/search_text_field.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final searchCategoryController = TextEditingController();
  late HospitalCategoryModel hospitalCategory;

  @override
  void initState() {
    //hospitalCategory = Get.arguments;
    //Get.find<HospitalController>().getHospitalServices(hospitalCategoryModel: hospitalCategory);
    Get.find<HospitalController>().getHospitalServices();
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
            child: Text('Services', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),),
          ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: GestureDetector(
                onTap: ()=>Navigator.pop(context),
                child: Image.asset(Images.backArrowIcon)),
            /*
            actions: [
              IconButton(onPressed: ()=>Get.toNamed('/hospital/category/edit', arguments: hospitalCategory), icon: const Icon(Icons.edit))
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
                GetBuilder<HospitalController>(builder: (hospitalController) {
                  if(hospitalController.loadingHospital){
                    return const Center(child: Text('Loading...'),);
                  }else if(hospitalController.hospitalServices.isEmpty){
                    return const Center(child: Text('You don\'t have any Service yet.'),);
                  }else{
                    return Expanded(
                        child: ListView.builder(
                          itemCount: hospitalController.hospitalServices.length,
                          itemBuilder: (context, index) {
                            if(hospitalController.hospitalServices.length-1==index){
                              return Column(children: [
                                GestureDetector(
                                  onTap: (){Get.toNamed('/hospital/service/edit', arguments: {'service': hospitalController.hospitalServices[index], 'index':index});},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8.0)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Row(
                                          children: [
                                            Text(hospitalController.hospitalServices[index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 70,)
                              ],);
                            }
                            return GestureDetector(
                              onTap: (){Get.toNamed('/hospital/service/edit', arguments: {'service': hospitalController.hospitalServices[index], 'index':index});},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Row(
                                      children: [
                                        Text(hospitalController.hospitalServices[index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                                      ],
                                    ),
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
            onPressed: () {Get.toNamed('/hospital/service/edit');},
          ),
        ),
      ],
    );
  }
}
