import 'package:get/get.dart';
import 'package:sonocare_partner2/data/model/response/lab_model.dart';
import 'package:sonocare_partner2/data/model/response/response_model.dart';
import 'package:sonocare_partner2/data/repository/lab_repo.dart';

class LabController extends GetxController implements GetxService {
  final LabRepo labRepo;
  LabController({required this.labRepo});

  List<LabRequestsModel> labRequests = [];
  List<LabRequestsModel> labRequestsOld = [];
  List<LabCategoryModel> labCategories = [];
  List<LabTestModel> labTests = [];
  List<LabCategoryModel> labCategoriesOld = [];
  List<LabTestModel> labTestsOld = [];
  List<LabTestModel> labTestsSelected = [];

  bool loadingLab = false;

  Future<void> searchLabCategories({searchText})async {
    if(labCategoriesOld.isEmpty || labCategoriesOld.length==labCategories.length){
      labCategoriesOld = labCategories;
    }else{
      labCategories = labCategoriesOld;
    }
    labCategories = [];
    for( var i = 0 ; i < labCategoriesOld.length; i++ ) {
      if(labCategoriesOld[i].name.isCaseInsensitiveContainsAny(searchText)){
        labCategories.add(labCategoriesOld[i]);
      }
    }
    update();
  }
  Future<void> searchLabRequests({searchText})async {
    if(labRequestsOld.isEmpty || labRequestsOld.length==labRequests.length){
      labRequestsOld = labRequests;
    }else{
      labRequests = labRequestsOld;
    }
    labRequests = [];
    for( var i = 0 ; i < labRequestsOld.length; i++ ) {
      if(labRequestsOld[i].name.isCaseInsensitiveContainsAny(searchText)){
        labRequests.add(labRequestsOld[i]);
      }
    }
    update();
  }
  Future<void> searchLabTests({searchText})async {
    if(labTestsOld.isEmpty || labTestsOld.length==labTests.length){
      labTestsOld = labTests;
    }else{
      labTests = labTestsOld;
    }
    labTests = [];
    for( var i = 0 ; i < labTestsOld.length; i++ ) {
      if(labTestsOld[i].name.isCaseInsensitiveContainsAny(searchText)){
        labTests.add(labTestsOld[i]);
      }
    }
    update();
  }

  Future<void> getLabRequests() async {
    labRequests = [];
    loadingLab = true;
    await Future.delayed(const Duration(seconds: 3));
    for( var i = 0 ; i < 10; i++ ) {
      List<LabTestModel> tests = [];
      for( var t = 0 ; t < 5; t++ ) {
        tests.add(LabTestModel(name: 'Malaria $t', fee: '123', id: ''));
      }
      labRequests.add(LabRequestsModel(id: '$i', name: 'lab cat $i', tests: tests, image: '', patientProfile: PatientProfileModel(id: '', name: 'Mohammed Aliyu')));
    }
    loadingLab = false;
    update();
  }

  Future<void> getLabCategories() async {
    labCategories = [];
    loadingLab = true;
    /*
    await Future.delayed(const Duration(seconds: 3));
    for( var i = 0 ; i < 10; i++ ) {
      labCategories.add(LabCategoryModel(id: '$i', name: 'lab cat $i'));
    }
    print(labCategories);
    update();
    */
    ResponseModel _responseModel;

    String url = '/api/lab/labcategory';

    Response response = await labRepo.getLabCategories(url:url, );
    if (response.statusCode == 200) {
      var responseBody = response.body['data'];
      for( var i = 0 ; i < responseBody.length; i++ ) {
        labCategories.add(LabCategoryModel.fromJson(responseBody[i]));
      }
      update();
      _responseModel = ResponseModel(true, 'successful');
    } else {
      _responseModel = ResponseModel(false, 'errorMessage');
    }
    print(labCategories);
    loadingLab = false;

  }

  Future<bool> addLabCategory({required LabCategoryModel labCategoryModel})async {
    loadingLab = true;
    update();
    await Future.delayed(const Duration(seconds: 1));
    labCategories.add(labCategoryModel);
    labCategoriesOld = [];
    loadingLab = false;
    update();
    return true;
  }
  Future<bool> updateLabCategory({required int index, required LabCategoryModel labCategory})async {
    labCategories[index].name = labCategory.name;
    update();
    return true;
  }
  Future<void> deleteLabCategory({required LabCategoryModel labCategory})async {
    labCategories.remove(labCategory);
  }
  Future<void> getLabTests({required LabCategoryModel labCategory})async{
    labTests = [];
    loadingLab = true;


    ResponseModel _responseModel;

    String url = '/api/lab/labsub_cat';

    Response response = await labRepo.getLabTest(url:url, labCategory:labCategory.id);
    if (response.statusCode == 200) {
      var responseBody = response.body['data'];
      for( var i = 0 ; i < responseBody.length; i++ ) {
        LabTestModel labTestModel = LabTestModel.fromJson(responseBody[i], labCategory);
        print(labTestModel);
        /*
        for( var i = 0 ; i < labTestsSelected.length; i++ ) {
          if(labTestModel.labCategory!.id==labTestsSelected[i].labCategory!.id){
            if(labTestModel.name == labTestsSelected[i].name){
              labTestModel.selectLabTest();
            }
          }
        }*/
        labTests.add(labTestModel);
      }
      print(labTests);
      loadingLab = false;
      update();
      _responseModel = ResponseModel(true, 'successful');
    } else {
      _responseModel = ResponseModel(false, 'errorMessage');
    }
    /*

    for( var i = 0 ; i < 10; i++ ) {
      LabTestModel labTestModel = LabTestModel(id: '$i', name: 'lab test $i', labCategory: labCategory, fee: '123');
      for( var i = 0 ; i < labTestsSelected.length; i++ ) {
        if(labTestModel.labCategory!.id==labTestsSelected[i].labCategory!.id){
          if(labTestModel.id == labTestsSelected[i].id){
            labTestModel.selectLabTest();
          }
        }
      }
      labTests.add(labTestModel);
    }
    loadingLab = false;
     */
    //update();
  }
  Future<bool> addLabTests({required LabTestModel labTest}) async {
    loadingLab = true;
    update();
    await Future.delayed(const Duration(seconds: 3));
    labTests.add(labTest);
    labTestsOld = [];
    loadingLab = false;
    update();
    return true;
  }
  Future<bool> updateLabTests({required LabTestModel labTest, required int index}) async {
    labTests[index].name = labTest.name;
    labTests[index].fee = labTest.fee;
    labTests[index].labCategory = labTest.labCategory;
    update();
    return true;
  }
  deleteLabTests({required LabTestModel labTest}){
    labTests.remove(labTest);
  }

  selectTest({required int index}){
    if(!labTests[index].selected){
      labTests[index].selectLabTest();
      labTestsSelected.add(labTests[index]);
    }else{
      for( var i = 0 ; i < labTestsSelected.length; i++ ) {
        if(labTests[index].labCategory!.id==labTestsSelected[i].labCategory!.id){
          if(labTests[index].id == labTestsSelected[i].id){
            labTests[index].selectLabTest();
            labTestsSelected.removeAt(i);
          }
        }
      }
    }
    update();
  }
}
