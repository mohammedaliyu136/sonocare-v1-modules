import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/lab_controller.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/textFieldNotStyled.dart';
import 'package:sonocare_partner2/view/screens/lab/category/widgets/search_text_field.dart';

class LabCategoryScreen extends StatefulWidget {
  const LabCategoryScreen({Key? key}) : super(key: key);

  @override
  State<LabCategoryScreen> createState() => _LabCategoryScreenState();
}

class _LabCategoryScreenState extends State<LabCategoryScreen> {

  final searchCategoryController = TextEditingController();
  @override
  void initState() {
    Get.find<LabController>().getLabCategories();
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
            child: Text('Lab Categories', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),),
          ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                GetBuilder<LabController>(builder: (labController) {
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
                GetBuilder<LabController>(builder: (labController) {
                    if(labController.loadingLab){
                      return const Center(child: Text('Loading...'),);
                    }else if(labController.labCategories.isEmpty){
                      return const Center(child: Text('You don\'t have any requests yet.'),);
                    }else{
                      return Expanded(
                          child: ListView.builder(
                            itemCount: labController.labCategories.length,
                            itemBuilder: (context, index) {
                              if(labController.labCategories.length-1==index){
                                return Column(children: [
                                  GestureDetector(
                                    onTap: (){Get.toNamed('/lab/tests', arguments: {'labCategory':labController.labCategories[index], 'index':index});},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(8.0)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Center(child: Text(labController.labCategories[index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 70,)
                                ],);
                              }
                              return GestureDetector(
                                onTap: (){Get.toNamed('/lab/tests', arguments: {'labCategory':labController.labCategories[index], 'index':index});},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8.0)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Center(child: Text(labController.labCategories[index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)),
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
              Get.toNamed('/lab/category/edit');
            },
          ),
        ),
      ],
    );
  }
}
