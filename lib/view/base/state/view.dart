
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/profile_form_controller.dart';
import 'package:sonocare_partner2/data/model/response/state_model.dart';
import 'package:sonocare_partner2/util/color_resources.dart';

class StateView extends StatefulWidget {
  int selectedState = -1;
  int selectedLGA = -1;
  StateView({Key? key, required this.selectedState, required this.selectedLGA});

  @override
  _StateViewState createState() {
    return _StateViewState(this.selectedState, this.selectedLGA);
  }
}

class _StateViewState extends State<StateView> {
  int var_selectedState = -1;
  int var_selectedLGA = -1;
  _StateViewState(this.var_selectedState, this.var_selectedLGA);
  List<String> _states = ["Choose a state"];
  List<String> _lgas = ["Choose .."];
  String _selectedState = "Choose a state";
  String _selectedLGA = "Choose ..";

  StateModel sel_State = StateModel(id: -1, name: "Choose a state");


  getAllStates() {
    //_states = List.from(_states)..addAll(repo.getState_v1());
  }

  @override
  void initState() {
    //repo.getState_v1();
    //print(repo.getStates());
    //_states = List.from(_states)..addAll(repo.getStates());
    //getAllStates();
    /*
    _states = List.from(_states)..addAll(repo.getState_v1());
    if(var_selectedState!=''){
      print("------------------9009");
      setState(() {
        _selectedState = var_selectedState;
        _lgas = List.from(_lgas)..addAll(repo.getLocalByState(_selectedState));
        _selectedLGA = var_selectedLGA;
      });
    }
    */
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onSelectedState(String value) {
    setState(() {
      _selectedLGA = "Choose ..";
      _lgas = ["Choose .."];
      print('---------------');
      print(value);
      _selectedState = value;
      //_lgas = List.from(_lgas)..addAll(repo.getLocalByState(value));
    });
  }

  void _onSelectedLGA(String value) {
    setState(() => _selectedLGA = value);
    print('==============');
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    //ProfileFormController

    return GetBuilder<ProfileFormController>(builder: (profileFormController) {
          print('-----${profileFormController.lgas.length}');
          print('-----${profileFormController.lgas[0]}');
          print('---67--${profileFormController.selectedLGA}');
          if(profileFormController.stateLoading){
            return Text("Loading States...", style: TextStyle(color: Colors.white),);
          }
          return Column(children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:0.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.location_on, color: Colors.white,),
                      ),
                      SizedBox(width: 1,child: Container(color: Colors.white,), height: 64,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, bottom: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('State', textAlign: TextAlign.start, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),

                              DropdownButton<StateModel>(
                                isExpanded: true,
                                dropdownColor: ColorResources.COLOR_PURPLE_DEEP,
                                underline: Container(color: Colors.transparent),
                                items: profileFormController.states.map((StateModel dropDownStringItem) {
                                  return DropdownMenuItem<StateModel>(
                                    value: dropDownStringItem,
                                    child: Text(dropDownStringItem.name, style: TextStyle(color: Colors.white),),
                                  );
                                }).toList(),
                                onChanged: (value) async {
                                  profileFormController.onSelectedState(value!);
                                },
                                value: profileFormController.selectedState.id==-1?profileFormController.states[0]:profileFormController.selectedState,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width,child: Container(color: Colors.white,), height: 1,),
                ],
              ),
            ),

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:0.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.location_on, color: Colors.white,),
                      ),
                      SizedBox(width: 1,child: Container(color: Colors.white,), height: 65,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, bottom: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('LGA', textAlign: TextAlign.start, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),),
                              if(profileFormController.lgaLoading)Text("Loading LGAs...", style: TextStyle(color: Colors.white),),
                              if(!profileFormController.lgaLoading)DropdownButton<LGAModel>(
                                isExpanded: true,
                                dropdownColor: ColorResources.COLOR_PURPLE_DEEP,
                                underline: Container(color: Colors.transparent),
                                items: profileFormController.lgas.map((LGAModel dropDownStringItem) {
                                  return DropdownMenuItem<LGAModel>(
                                    value: dropDownStringItem,
                                    child: Text(dropDownStringItem.name, style: TextStyle(color: Colors.white),),
                                  );
                                }).toList(),
                                onChanged: (value){
                                  print("#########${value}");
                                  profileFormController.onSelectedLGA(value!);
                                },
                                value: profileFormController.lgas.length==1?profileFormController.lgas[0]:profileFormController.selectedLGA,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width,child: Container(color: Colors.white,), height: 1,),
                ],
              ),
            ),
          ],);
        }
    );
  }
}