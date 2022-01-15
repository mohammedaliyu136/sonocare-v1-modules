import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/controller/profile_form_controller.dart';
import 'package:sonocare_partner2/controller/verification_form_controller.dart';
import 'package:sonocare_partner2/data/model/response/profile_model.dart';
import 'package:sonocare_partner2/data/model/response/response_model.dart';
import 'package:sonocare_partner2/util/app_constants.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/custom_snackbar.dart';
import 'package:sonocare_partner2/view/base/gender.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/base/state/view.dart';
import 'package:sonocare_partner2/view/base/textField.dart';
import 'package:sonocare_partner2/view/screens/profile_setup/upload_image.dart';

class ProfileSetUPNurseScreen extends StatefulWidget {
  ProfileSetUPNurseScreen({this.upDateProfile=false});
  bool upDateProfile;

  @override
  _ProfileSetUPScreenState createState() {
    return _ProfileSetUPScreenState();
  }
}

class _ProfileSetUPScreenState extends State<ProfileSetUPNurseScreen> {
  _ProfileSetUPScreenState();
  bool _loading = false;
  bool loadedDate = false;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _otherNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _languageController = TextEditingController();
  final _feeController = TextEditingController();

  final _stateController = TextEditingController();
  final _lgaController = TextEditingController();
  final _imageController = TextEditingController();

  String date_of_birth = '';
  String country = '';
  String state = '';

  bool term_and_condition = false;

  int? _value = 42;

  @override
  void initState() {
    int stateId = Get.find<AuthController>().userInfoModel!.stateID==null?-1:int.parse(Get.find<AuthController>().userInfoModel!.stateID);
    int lgaId = Get.find<AuthController>().userInfoModel!.lgaID==null?-1:int.parse(Get.find<AuthController>().userInfoModel!.lgaID);
    Get.find<ProfileFormController>().getStates(selectedState: stateId, selectedLGA: lgaId);

    super.initState();
  }

  _loadData(BuildContext context) async {
    if(!loadedDate){

      _firstNameController.text = Get.find<AuthController>().userInfoModel!.firstName;
      _lastNameController.text = Get.find<AuthController>().userInfoModel!.lastName;
      _otherNameController.text = Get.find<AuthController>().userInfoModel!.otherName;
      _addressController.text = Get.find<AuthController>().userInfoModel!.address;
      _languageController.text = Get.find<AuthController>().userInfoModel!.language;
      _feeController.text = Get.find<AuthController>().userInfoModel!.serviceFee;
      _emailController.text = Get.find<AuthController>().userInfoModel!.email;
      _phoneNumberController.text = Get.find<AuthController>().userInfoModel!.phoneNumber;

      _stateController.text = Get.find<AuthController>().userInfoModel!.stateID;
      _lgaController.text = Get.find<AuthController>().userInfoModel!.lgaID;
      setState(() {
        loadedDate = true;
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    _loadData(context);
    // TODO: implement build
    return Stack(
      children: [
        const DarkBackGround(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text('Profile'),
            elevation: 0,
            leading: GestureDetector(
                onTap: ()=>Navigator.pop(context),
                child: Image.asset(Images.backArrowIcon)),
          ),
          body: GetBuilder<ProfileFormController>(builder: (profileFormController) {
              return GetBuilder<VerificationFormController>(builder: (verificationFormController) {
                  return GetBuilder<AuthController>(builder: (authController) {
                    return Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListView(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap:(){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const UploadImageScreen()),
                                          );
                                        },
                                        child: Container(
                                          height: 200,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(Radius.circular(200)),
                                            color: Colors.grey,

                                            image: DecorationImage(
                                              image: NetworkImage('https://sonocare.app'+authController.userInfoModel!.image),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                  decoration: const BoxDecoration(
                                                    borderRadius: BorderRadius.all(Radius.circular(300)),
                                                    color: ColorResources.COLOR_PURPLE_MID,
                                                  ),
                                                  child: const Padding(
                                                    padding: EdgeInsets.all(12.0),
                                                    child: Icon(Icons.camera_alt, size: 30, color: Colors.white,),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:10.0),
                                    child: textField(hintText: 'Enter your First Name', label:'First Name', icon: const Icon(Icons.account_circle_outlined, color: Colors.white,), controller: _firstNameController, validator: (){}, onChanged: (){},),
                                  ),
                                  const SizedBox(height: 15,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: textField(hintText: 'Enter your Last Name', label:'Last Name', icon: const Icon(Icons.account_circle_outlined, color: Colors.white,), controller: _lastNameController, validator: (){}, onChanged: (){}),
                                  ),
                                  const SizedBox(height: 15,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: textField(hintText: 'Enter your Other Name', label:'Other Name', icon: const Icon(Icons.account_circle_outlined, color: Colors.white,), controller: _otherNameController, validator: (){}, onChanged: (){}),
                                  ),
                                  const SizedBox(height: 15,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: textField(hintText: 'Enter your Address', label:'Address', icon: const Icon(Icons.location_on, color: Colors.white,), controller: _addressController, validator: (){}, onChanged: (){}),
                                  ),
                                  const SizedBox(height: 15,),
                                  if(authController.accountType=='Doctor')Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: textField(hintText: 'Enter your Language', label:'Language', icon: const Icon(Icons.location_on, color: Colors.transparent,), controller: _languageController, validator: (){}, onChanged: (){}),
                                  ),
                                  if(authController.accountType=='Doctor')const SizedBox(height: 15,),
                                  if(authController.accountType=='Nurse')Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: textField(hintText: 'Enter your Fee', label:'Fee', icon: const Icon(Icons.location_on, color: Colors.transparent,), controller: _feeController, validator: (){}, onChanged: (){}),
                                  ),
                                  if(authController.accountType=='Nurse')const SizedBox(height: 15,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: GenderView(selectedName: authController.userInfoModel!.gender.isEmpty?'Male':'${authController.userInfoModel!.gender[0].toUpperCase()}${authController.userInfoModel!.gender.substring(1)}', profile: true,),
                                  ),
                                  const SizedBox(height: 15,),
                                  //int.parse(Provider.of<AuthProvider>(context, listen: false).userInfoModel!.stateID)

                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: StateView(selectedState: authController.userInfoModel!.stateID.isEmpty?-1:int.parse(authController.userInfoModel!.stateID), selectedLGA: -1,),
                                  ),
                                  const SizedBox(height: 15,),
                                  if(_loading)Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [CircularProgressIndicator(color: Colors.red,),],),
                                  ),
                                  if(!_loading)Padding(
                                    padding: const EdgeInsets.only(left: 40.0, right: 40, top: 10, bottom: 10),
                                    child: Row(
                                      children: [
                                        Expanded(child: normalButton(
                                          backgroundColor: ColorResources.COLOR_PURPLE_MID,
                                          button_text: 'Update Profile',
                                          primaryColor: ColorResources.COLOR_WHITE,
                                          fontSize: 16,
                                          onTap: () async {
                                            if(_firstNameController.text.isEmpty){showCustomSnackBar('Please enter your first Name', isError: true); return true;}
                                            if(_lastNameController.text.isEmpty){showCustomSnackBar('Please enter your last Name', isError: true); return true;}
                                            if(_otherNameController.text.isEmpty){showCustomSnackBar('Please enter your other Name', isError: true); return true;}
                                            if(_addressController.text.isEmpty){showCustomSnackBar('Please enter your address', isError: true); return true;}
                                            if(profileFormController.selectedState.id==-1){showCustomSnackBar('Please enter your state', isError: true); return true;}
                                            if(profileFormController.selectedLGA.id==-1){showCustomSnackBar('Please enter your LGA', isError: true); return true;}
                                            setState(() {
                                              _loading=true;
                                            });
                                            int lgaID = 0;
                                            if(verificationFormController.selectedLGA.id==-1){
                                              lgaID = int.parse(Get.find<AuthController>().userInfoModel!.lgaID);
                                            }else{
                                              lgaID = verificationFormController.selectedLGA.id;
                                            }

                                            setState(() {
                                              _loading=true;
                                            });
                                            if(widget.upDateProfile){
                                              print('update');
                                              ProfileDoctorModel profileModelNurse = ProfileDoctorModel(
                                                  id: 1,//authController.userInfoModel!.id,
                                                  firstName: _firstNameController.text,
                                                  otherName: _otherNameController.text,
                                                  lastName: _lastNameController.text,
                                                  address: _addressController.text,
                                                  //language: '',
                                                  language: _languageController.text,
                                                  fee: _feeController.text,
                                                  lgaID: profileFormController.selectedLGA.id==-1?int.parse(authController.userInfoModel!.lgaID):profileFormController.selectedLGA.id,
                                                  gender: verificationFormController.gender??authController.userInfoModel!.gender,
                                                  stateID: profileFormController.selectedState.id==-1?int.parse(authController.userInfoModel!.stateID):profileFormController.selectedState.id);

                                              print('------------------------');
                                              print('------------------------');
                                              print(_feeController.text);
                                              print(profileModelNurse.toJson());
                                              String token = Get.find<AuthController>().token;
                                              print(profileModelNurse.toJson());
                                              await authController.updateUserInfo(profileModelNurse, token).then((ResponseModel response) async {
                                                if(response.isSuccess){
                                                  await Get.find<AuthController>().updateUser(
                                                      firstName:_firstNameController.text, lastName:_lastNameController.text, otherName:_otherNameController.text,
                                                      address:_addressController.text,
                                                      //stateID:Provider.of<AuthProvider>(context, listen: false).userInfoModel!.stateID,//verificationFormController.selectedState.id,
                                                      //lgaID:Provider.of<AuthProvider>(context, listen: false).userInfoModel!.lgaID//lgaID

                                                      lgaID: profileFormController.selectedLGA.id==-1?int.parse(authController.userInfoModel!.lgaID):profileFormController.selectedLGA.id,
                                                      gender: verificationFormController.gender??authController.userInfoModel!.gender,
                                                      stateID: profileFormController.selectedState.id==-1?int.parse(authController.userInfoModel!.stateID):profileFormController.selectedState!.id
                                                  );
                                                  setState(() {
                                                    _loading=false;
                                                  });
                                                  Get.back();
                                                }
                                              });
                                            }else{
                                              print('setUp');
                                              ProfileDoctorModel profileModelNurse = ProfileDoctorModel(
                                                  id: 1,//authController.userInfoModel!.id,
                                                  firstName: _firstNameController.text,
                                                  otherName: _otherNameController.text,
                                                  lastName: _lastNameController.text,
                                                  address: _addressController.text,

                                                  language: _languageController.text.isEmpty?'none':_languageController.text,
                                                  fee: _feeController.text.isEmpty?'0':_feeController.text,
                                                  //language: '',
                                                  lgaID: profileFormController.selectedLGA.id==-1?1:profileFormController.selectedLGA.id,
                                                  gender: verificationFormController.gender??'male',
                                                  stateID: profileFormController.selectedState.id==-1?1:profileFormController.selectedState.id);

                                              setState(() {
                                                _loading=true;
                                              });
                                              String accountType = Get.find<AuthController>().accountType;
                                              String url = '';
                                              if(accountType=='Lab'){
                                                url = AppConstants.LAB_UPDATE_PROFILE;
                                              }else if(accountType=='Pharmacy'){
                                                url = AppConstants.PHARMACY_UPDATE_PROFILE;
                                              }else if(accountType=='Delivery'){
                                                url = AppConstants.DELIVERY_UPDATE_PROFILE;
                                              }else if(accountType=='Doctor'){
                                                url = AppConstants.DOCTOR_UPDATE_PROFILE;
                                              }else if(accountType=='Nurse'){
                                                url = AppConstants.NURSE_UPDATE_PROFILE;
                                              }
                                              print(profileModelNurse.toJson());
                                              await authController.updateUserInfo(profileModelNurse, url).then((ResponseModel response) async {
                                                if(response.isSuccess){
                                                  Get.find<AuthController>().updateUser(
                                                      firstName:_firstNameController.text, lastName:_lastNameController.text, otherName:_otherNameController.text,
                                                      address:_addressController.text,
                                                      //stateID:Provider.of<AuthProvider>(context, listen: false).userInfoModel!.stateID,//verificationFormController.selectedState.id,
                                                      //lgaID:Provider.of<AuthProvider>(context, listen: false).userInfoModel!.lgaID//lgaID


                                                      lgaID: profileFormController.selectedLGA.id==-1?int.parse(authController.userInfoModel!.lgaID):profileFormController.selectedLGA.id,
                                                      gender: verificationFormController.gender??authController.userInfoModel!.gender,
                                                      stateID: profileFormController.selectedState.id==-1?int.parse(authController.userInfoModel!.stateID):profileFormController.selectedState.id
                                                  );
                                                  setState(() {
                                                    _loading=false;
                                                  });

                                                  Get.back();
                                                }
                                              });
                                            }

                                          },
                                        )),
                                      ],
                                    ),
                                  ),
                                ],),
                            ),
                          ],
                        ),
                      ),
                    );
                    }
                  );
                }
              );
            }
          ),
        ),
      ],
    );
  }
}
