import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/lab_controller.dart';
import 'package:sonocare_partner2/data/model/response/lab_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/textFieldNotStyled.dart';
import 'package:sonocare_partner2/view/screens/doctor/lab_test/lab_test_successful_screen.dart';

class SubLabTestScreen extends StatefulWidget {
  LabCategoryModel labTest;
  int index = 0;
  SubLabTestScreen({Key? key, required this.labTest, required this.index}) : super(key: key);

  @override
  State<SubLabTestScreen> createState() => _SubLabTestScreenState();
}

class _SubLabTestScreenState extends State<SubLabTestScreen> {
  final textf = TextEditingController();

  @override
  void initState() {
    Get.find<LabController>().getLabTests(labCategory: widget.labTest);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const DarkBackGround(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(widget.labTest.name),
            elevation: 0,
            leading: GestureDetector(
                onTap: ()=>Navigator.pop(context),
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
                        Text('Sub Categories', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                        itemCount: labController.labTests.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              labController.selectTest(index: index);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: labController.labTests[index].selected?ColorResources.COLOR_PURPLE_MID:Colors.white,
                                    borderRadius: BorderRadius.circular(8.0)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Checkbox(value: labController.labTests[index].selected, onChanged: (val){}, checkColor: ColorResources.COLOR_PURPLE_DEEP,),
                                      Text(labController.labTests[index].name, style: TextStyle(
                                          color: labController.labTests[index].selected?ColorResources.COLOR_WHITE:Colors.black,
                                          fontSize: 20, fontWeight: FontWeight.w700),),
                                    ],
                                  ),
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
                          onTap: ()=>Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                            const LabTestSuccessfulScreen()), (Route<dynamic> route) => false),
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
