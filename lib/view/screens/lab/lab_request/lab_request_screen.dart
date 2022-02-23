import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/lab_controller.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/screens/lab/lab_request/widgets/search_text_field.dart';

class LabRequestsScreen extends StatefulWidget {
  const LabRequestsScreen({Key? key}) : super(key: key);

  @override
  State<LabRequestsScreen> createState() => _LabRequestsScreenState();
}

class _LabRequestsScreenState extends State<LabRequestsScreen> {
  final searchCategoryController = TextEditingController();
  @override
  void initState() {
    Get.find<LabController>().getLabRequests();
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
            child: Text('Lab Requests', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),),
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
                  child: GetBuilder<LabController>(builder: (labController) {
                    if(labController.loadingLab){
                      return const Center(child: Text('Loading...'),);
                    }else if(labController.labRequests.isEmpty){
                      return const Center(child: Text('You don\'t have any requests yet.'),);
                    }else{
                      return ListView.builder(
                        itemCount: labController.labRequests.length,
                        itemBuilder: (context, index) {
                          if(labController.labRequests.length-1==index){
                            return Column(children: [
                              GestureDetector(
                                onTap: (){Get.toNamed('/lab/request/accept', arguments: labController.labRequests[index]);},
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
                                            Text(labController.labRequests[index].name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                                            const SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Text(labController.labRequests[index].date, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                                const SizedBox(width: 20,),
                                                Text(labController.labRequests[index].time, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
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
                              Get.toNamed('/lab/request/accept', arguments: labController.labRequests[index]);
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
                                        Text(labController.labRequests[index].name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                                        const SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            Text(labController.labRequests[index].date, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                            const SizedBox(width: 20,),
                                            Text(labController.labRequests[index].time, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                          ],
                                        ),
                                      ],)
                                  ],),
                                ),
                              ),
                            ),
                          );
                        });
                      /*
                      return ListView(children: [
                        GestureDetector(
                          onTap: (){
                            Get.toNamed('/lab/request/accept');
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                                      //image:DecorationImage(
                                      //  fit:BoxFit.fill,
                                      //  image: AssetImage("assets/dummy/profile_dummy.png"),
                                      // )
                                    ),
                                    child: Image.network(
                                      '',
                                      fit: BoxFit.cover,
                                      loadingBuilder: (context, child, loadingProgress) {
                                        if (loadingProgress == null) return child;

                                        return const Center(child: const Text('Loading...'));
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
                                      const Text('patientName', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                                      const SizedBox(height: 10,),
                                      Row(
                                        children: const [
                                          Text('getDate()', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                          SizedBox(width: 20,),
                                          Text('getTime()', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                        ],
                                      ),
                                    ],)
                                ],),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                                    //image:DecorationImage(
                                    //  fit:BoxFit.fill,
                                    //  image: AssetImage("assets/dummy/profile_dummy.png"),
                                    // )
                                  ),
                                  child: Image.network(
                                    '',
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;

                                      return const Center(child: const Text('Loading...'));
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
                                    const Text('patientName', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: const [
                                        Text('getDate()', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                        SizedBox(width: 20,),
                                        Text('getTime()', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                      ],
                                    ),
                                  ],)
                              ],),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                                    //image:DecorationImage(
                                    //  fit:BoxFit.fill,
                                    //  image: AssetImage("assets/dummy/profile_dummy.png"),
                                    // )
                                  ),
                                  child: Image.network(
                                    '',
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;

                                      return const Center(child: const Text('Loading...'));
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
                                    const Text('patientName', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: const [
                                        Text('getDate()', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                        SizedBox(width: 20,),
                                        Text('getTime()', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                      ],
                                    ),
                                  ],)
                              ],),
                            ),
                          ),
                        ),
                      ],);
                      */
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
            onPressed: ()=>Get.toNamed('/lab/categories'),
          ),
        ),
      ],
    );
  }
}
