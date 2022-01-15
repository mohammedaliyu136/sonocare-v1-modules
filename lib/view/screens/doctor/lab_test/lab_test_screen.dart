import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/lab_controller.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/textFieldNotStyled.dart';
import 'package:sonocare_partner2/view/screens/doctor/lab_test/lab_test_successful_screen.dart';

import 'sub_cat_lab_test_screen.dart';

class LabTestScreen extends StatefulWidget {
  LabTestScreen({Key? key}) : super(key: key);

  @override
  State<LabTestScreen> createState() => _LabTestScreenState();
}

class _LabTestScreenState extends State<LabTestScreen> {
  final textf = TextEditingController();
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
        const DarkBackGround(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text('Lab Category'),
            elevation: 0,
            leading: GestureDetector(
                onTap: (){
                  Get.find<LabController>().labTestsSelected=[];
                  Navigator.pop(context);
                },
                child: Image.asset(Images.backArrowIcon)),
          ),
          body: GetBuilder<LabController>(builder: (labController) {
                if(labController.loadingLab){
                  return const Center(child: CircularProgressIndicator());
                }
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                    child: textFieldNotStyled(textController: textf,),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: const [
                        SizedBox(width: 20,),
                        Text('Categories', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: labController.labCategories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            labController.getLabTests(labCategory: labController.labCategories[index]);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SubLabTestScreen(index: index, labTest: labController.labCategories[index])),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
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
                  ),
                  if(labController.labTestsSelected.isNotEmpty)
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            //LabTestSuccessfulScreen
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                const LabTestSuccessfulScreen()), (Route<dynamic> route) => false);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ColorResources.COLOR_PURPLE_MID,
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Center(child: Text('Recommend ${labController.labTestsSelected.length} Tests', style: const TextStyle(
                                    color: ColorResources.COLOR_WHITE,
                                    fontSize: 20, fontWeight: FontWeight.w700),)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ],
              );
            }
          ),
        )
      ],
    );
  }
}
