import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:sonocare_partner2/data/model/response/state_model.dart';
import 'package:sonocare_partner2/data/repository/state_repo.dart';

class ProfileFormController extends GetxController implements GetxService {
  ProfileFormController() {
    //_notification = authRepo.isNotificationActive();
  }
  String? gender;
  String? country;
  String? state;
  String? lga;
  //SpecialtyModel? specialty;

  String? referredBy;

  List<StateModel> get states => _states;
  List<LGAModel> get lgas => _lgas;
  StateModel get selectedState => _selectedState;
  LGAModel get selectedLGA => _selectedLGA;

  bool stateLoading = false;
  bool lgaLoading = false;
  List<StateModel> _states = [StateModel(id: -1, name: "Choose a state")];
  List<LGAModel> _lgas = [LGAModel(name: "Choose ..", id: -1)];//[LGAModel(title: "Choose ..", id: -1)];
  StateModel _selectedState = StateModel(id: -1, name: "Choose a state");
  LGAModel _selectedLGA = LGAModel(name: "Choose ..", id: -1);

  StateModel? selectedState2;

  getStates({selectedState=-1, selectedLGA=-1}) async {
    stateLoading =true;
    if(_states.length<2){
      List<StateModel> response = await getState_v1();
      print(response);
      _states=[StateModel(id: -1, name: "Choose a state")];
      _states = List.from(_states)..addAll(response);
      if(selectedState!=-1){
        for( var i = 0 ; i < _states.length; i++ ) {
          if(_states[i].id==_selectedState){
            _selectedState = _states[i];
            List<LGAModel> response = await getLGA_v1(_states[i].id);
            _lgas=[LGAModel(name: "Choose ..", id: -1)];
            _lgas = List.from(_lgas)..addAll(response);
            print('----56-${_lgas.length}');
          }
        }
      }
      if(selectedLGA!=-1){
        print('----56-${_lgas.length}');
        for( var i = 0 ; i < _lgas.length; i++ ) {
          if(_lgas[i].id==selectedLGA){
            _selectedLGA = _lgas[i];
            print('----56-${_selectedLGA.name}');
          }
        }
      }
    }
    if(selectedState>-1){
      _selectedState = _states[selectedState];
      print('----------------');
      print(_selectedState);
    }
    stateLoading =false;
    update();
  }

  onSelectedState(StateModel stateModelPAC,) async {
    //_lgas = [LGAModel(title: "Choose ..", id: -1)];
    _selectedState = stateModelPAC;
    lgaLoading=true;
    update();
    List<LGAModel> response = await getLGA_v1(stateModelPAC.id);
    _lgas=[LGAModel(name: "Choose ..", id: -1)];
    _lgas = List.from(_lgas)..addAll(response);
    if(_lgas.isNotEmpty){
      _selectedLGA = _lgas[0];
    }

    lgaLoading=false;
    update();
  }

  selectState(StateModel stateName){
    selectedState2 = stateName;
    update();
  }

  onSelectedLGA(LGAModel lgaModelPAC) {
    //setState(() => _selectedLGA = value);
    _selectedLGA = lgaModelPAC;
    update();
  }

  setReferredBy(referred){
    this.referredBy=referredBy;
    update();
  }
  setGender(gender){
    this.gender = gender;
    update();
  }
  setCountry(country){
    this.country = country;
    update();
  }
  setState(state){
    this.state = state;
    update();
  }
  setLGA(lga){
    this.lga = lga;
    update();
  }

}
