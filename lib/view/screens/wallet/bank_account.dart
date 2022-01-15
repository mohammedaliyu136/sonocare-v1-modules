import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/controller/wallet_controller.dart';
import 'package:sonocare_partner2/data/model/response/account_model.dart';
import 'package:sonocare_partner2/data/model/response/response_model.dart';
import 'package:sonocare_partner2/util/app_constants.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/custom_snackbar.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';

class BankAccountScreen extends StatefulWidget {
  const BankAccountScreen({Key? key}) : super(key: key);

  @override
  _BankAccountScreenState createState() {
    return _BankAccountScreenState();
  }
}

class _BankAccountScreenState extends State<BankAccountScreen> {
  final bankNameController = TextEditingController();
  final accountNameController = TextEditingController();
  final accountNumberController = TextEditingController();
  final bankCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
            title: const Text('Bank Account Info'),
            elevation: 0,
            leading: GestureDetector(
                onTap: ()=>Navigator.pop(context),
                child: Image.asset(Images.backArrowIcon)),
          ),
          body: GetBuilder<WalletController>(builder: (walletController) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(children: [
                  TextField(
                    textInputAction: TextInputAction.next,
                    controller: bankNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Bank Name',
                      contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    textInputAction: TextInputAction.next,
                    controller: accountNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Account Name',
                      contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    controller: accountNumberController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Account Number',
                      contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    controller: bankCodeController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Bank Code',
                      contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  if(walletController.isLoading)Row(mainAxisAlignment: MainAxisAlignment.center, children: const [CircularProgressIndicator(color: Colors.red,),],),
                  if(!walletController.isLoading)normalButton(
                      backgroundColor: ColorResources.COLOR_PURPLE_MID,
                      button_text: 'Submit',
                      primaryColor: ColorResources.COLOR_WHITE,
                      fontSize: 16, onTap: () async {
                        AccountInfoModel accountInfo = AccountInfoModel(
                            accountName: accountNameController.text,
                            accountNumber: accountNumberController.text,
                            bankCode: bankCodeController.text,
                            accountBank: bankNameController.text);
                        String accountType = Get.find<AuthController>().accountType;
                        String url = '';
                        if(accountType=='Lab'){
                          url = AppConstants.LAB_UPDATE_ACCOUNT_INFO;
                        }else if(accountType=='Pharmacy'){
                          url = AppConstants.PHARMACY_UPDATE_ACCOUNT_INFO;
                        }else if(accountType=='Delivery'){
                          url = AppConstants.DELIVERY_UPDATE_ACCOUNT_INFO;
                        }else if(accountType=='Doctor'){
                          url = AppConstants.DOCTOR_UPDATE_ACCOUNT_INFO;
                        }else if(accountType=='Nurse'){
                          url = AppConstants.NURSE_UPDATE_ACCOUNT_INFO;
                        }
                        await walletController.setAccount(accountInfo, url).then((ResponseModel response){
                          if(response.isSuccess){
                            showCustomSnackBar(response.message, isError: false);
                            Get.back();
                            /*
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DashboardScreen()),
                            );
                            */
                          }
                        });

                  })
                ],),
              );
            }
          ),
        ),
      ],
    );
  }
}