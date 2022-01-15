import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/lab_controller.dart';
import 'package:sonocare_partner2/data/model/response/lab_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/textFieldNotStyled.dart';
import 'package:sonocare_partner2/view/screens/lab/test/widgets/search_text_field.dart';

class LabTestScreen extends StatefulWidget {
  LabTestScreen({Key? key}) : super(key: key);

  @override
  State<LabTestScreen> createState() => _LabTestScreenState();
}

class _LabTestScreenState extends State<LabTestScreen> {
  final searchCategoryController = TextEditingController();
  late LabCategoryModel labCategory;
  int index = 0;

  @override
  void initState() {
    labCategory = Get.arguments['labCategory'];
    index = Get.arguments['index'];
    Get.find<LabController>().getLabTests(labCategory: labCategory);
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
            child: GetBuilder<LabController>(builder: (labController) {
                return Text(Get.find<LabController>().labCategories[index].name, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),);
              }
            ),
          ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(onPressed: ()=>Get.toNamed('/lab/category/edit', arguments: {'labCategory':labCategory, 'index':index}), icon: const Icon(Icons.edit))
            ],
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
                GetBuilder<LabController>(builder: (labController) {
                  if(labController.loadingLab){
                    return const Center(child: Text('Loading...'),);
                  }else if(labController.labCategories.isEmpty){
                    return const Center(child: Text('You don\'t have any requests yet.'),);
                  }else{
                    return Expanded(
                        child: ListView.builder(
                          itemCount: labController.labTests.length,
                          itemBuilder: (context, index) {
                            if(labController.labTests.length-1==index){
                              return Column(children: [
                                GestureDetector(
                                  onTap: (){Get.toNamed('/lab/tests/edit', arguments: {'labTest':labController.labTests[index], 'index':index});},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8.0)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Center(child: Text(labController.labTests[index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 70,)
                              ],);
                            }
                            return GestureDetector(
                              onTap: (){Get.toNamed('/lab/tests/edit', arguments: {'labTest':labController.labTests[index], 'index':index});},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.0)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Center(child: Text(labController.labTests[index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)),
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
            onPressed: () {Get.toNamed('/lab/tests/edit');},
          ),
        ),
      ],
    );
  }
}
