import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/controller/wallet_controller.dart';
import 'package:sonocare_partner2/util/app_constants.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:sonocare_partner2/view/base/normalButton.dart';
import 'package:sonocare_partner2/view/screens/wallet/wallet_settings.dart';

class Alerts {
  static showAlertDialog(BuildContext context, requestAmountController, url) {
    AlertDialog alert = AlertDialog(
      title: const Text("Request Withdrawal"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            controller: requestAmountController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Amount',
              contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorResources.COLOR_PURPLE_DEEP),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorResources.COLOR_PURPLE_MID),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: normalButton(
              button_text: 'Withdraw',
              fontSize: 16,
              primaryColor: ColorResources.COLOR_WHITE,
              backgroundColor: ColorResources.COLOR_PURPLE_DEEP,
              onTap: (){
                //walletController.withDrawFunds(token, amount).then((value) => null);
                //Alerts.showAlertDialog(context);
                Get.find<WalletController>().withDrawFunds(requestAmountController.text, url);
                requestAmountController.text='';
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final requestAmountController = TextEditingController();

  @override
  void initState() {
    String accountType = Get.find<AuthController>().accountType;
    String url = '';
    if(accountType=='Lab'){
      url = AppConstants.LAB_GET_TRANSACTIONS;
    }else if(accountType=='Pharmacy'){
      url = AppConstants.PHARMACY_GET_TRANSACTIONS;
    }else if(accountType=='Delivery'){
      url = AppConstants.DELIVERY_GET_TRANSACTIONS;
    }else if(accountType=='Doctor'){
      url = AppConstants.DOCTOR_GET_TRANSACTIONS;
    }else if(accountType=='Nurse'){
      url = AppConstants.NURSE_GET_TRANSACTIONS;
    }
    Get.find<WalletController>().getTransactions(url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: [
      const BackGround(),
      Padding(
        padding: const EdgeInsets.only(bottom:0.0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
                onTap: ()=>Navigator.pop(context),
                child: Image.asset(Images.backArrowIcon)),
            title: const Text('Wallet', style: TextStyle(color: Colors.white),),
            elevation: 0,
            actions: [
              GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WalletSettings()),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 18.0, ),
                    child: Icon(Icons.settings),
                  ))
            ],
          ),
          body: GetBuilder<WalletController>(builder: (walletController) {
              return GetBuilder<AuthController>(builder: (authController) {
                  return ListView(children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              //width: MediaQuery.of(context).size.width-200,
                              decoration: BoxDecoration(
                                color: ColorResources.COLOR_WHITE,
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(20))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 30,),
                                  const Text('Balance', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
                                  const SizedBox(height: 5,),
                                  Text('₦${authController.userInfoModel!.wallet}', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w700, color: Colors.black),),
                                    const SizedBox(height: 20,),
                                  const Text('Account Type', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.black),),
                                  Text(authController.userInfoModel!.doctorType, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
                                    const SizedBox(height: 5,),
                                    if(walletController.isLoading)Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [CircularProgressIndicator(color: Colors.red,),],),
                                    ),
                                    if(!walletController.isLoading)
                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: normalButton(
                                        button_text: 'Withdraw',
                                        fontSize: 16,
                                        primaryColor: ColorResources.COLOR_WHITE,
                                        backgroundColor: ColorResources.COLOR_PURPLE_DEEP,
                                        onTap: (){
                                          String accountType = Get.find<AuthController>().accountType;
                                          String url = '';
                                          if(accountType=='Lab'){
                                            url = AppConstants.LAB_WITHDRAW;
                                          }else if(accountType=='Pharmacy'){
                                            url = AppConstants.PHARMACY_WITHDRAW;
                                          }else if(accountType=='Delivery'){
                                            url = AppConstants.DELIVERY_WITHDRAW;
                                          }else if(accountType=='Doctor'){
                                            url = AppConstants.DOCTOR_WITHDRAW;
                                          }else if(accountType=='Nurse'){
                                            url = AppConstants.NURSE_WITHDRAW;
                                          }
                                          Alerts.showAlertDialog(context, requestAmountController, url);
                                        },
                                    ),
                                  )
                                ],),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:18.0, left: 30, bottom: 10),
                      child: Row(
                        children: const [
                          Text('Transaction History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white)),
                        ],
                      ),
                    ),
                    GetBuilder<WalletController>(builder: (walletController) {
                          if(walletController.isLoading){
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 20.0),
                                  child: Text('Loading transactions', style: TextStyle(color: Colors.white),),
                                )
                              ],);
                          }else{
                            if(walletController.transactions.length==0){
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: Text('You have no past transactions', style: TextStyle(color: Colors.white),),
                                  )
                                ],);
                            }else{
                              return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(walletController.transactions.length, (index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                                      child: Column(children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: Colors.transparent,
                                                ),
                                                borderRadius: const BorderRadius.all(Radius.circular(10))
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(18.0),
                                              child: Row(children: [
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      border: Border.all(
                                                        color: Colors.transparent,
                                                      ),
                                                      borderRadius: const BorderRadius.all(Radius.circular(100))
                                                  ),
                                                ),
                                                const SizedBox(width: 10,),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(walletController.transactions[index].type, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                                                        const SizedBox(width: 20,),
                                                        Text(walletController.transactions[index].status, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w800),)
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10,),
                                                    Row(
                                                      children: [
                                                        Text(walletController.transactions[index].createdAT, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                                        const SizedBox(width: 30,),
                                                        Text('₦'+walletController.transactions[index].amount, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                                                      ],
                                                    ),
                                                  ],)
                                              ],),
                                            ),
                                          ),
                                        ),
                                      ],),
                                    );
                                  }));
                            }
                          }
                          return const Text('');
                        }),
                  ],);
                }
              );
            }
          ),
        ),
      ),
    ],);
  }
}
