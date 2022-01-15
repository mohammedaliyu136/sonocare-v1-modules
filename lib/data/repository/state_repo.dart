import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sonocare_partner2/data/model/response/state_model.dart';

getState_v1() async {
  var url = Uri.parse('https://sonocare.app/api/getAllState');
  var response = await http.get(url);
  //var states = jsonDecode(response.body)['getAllState'].map((val)=>val['title']).toList();
  List<StateModel> states = [];
  for (var i = 0; i < jsonDecode(response.body)['getAllState'].length; i++) {
    //StateModel.fromJson(jsonDecode(response.body)['getAllState'][i]);
    states.add(StateModel.fromJson(jsonDecode(response.body)['getAllState'][i]));
  }
  return states;
}

getLGA_v1(id) async {
  var url = Uri.parse('https://sonocare.app/api/getLGAByStateID?state_id=${id}');
  var response = await http.post(url);
  //var states = jsonDecode(response.body)['getAllState'].map((val)=>val['title']).toList();
  print(response.statusCode);
  print(response.body);
  List<LGAModel> lgas = [];
  for (var i = 0; i < jsonDecode(response.body)['LGA'].length; i++) {
    lgas.add(LGAModel.fromJson(jsonDecode(response.body)['LGA'][i]));
  }
  return lgas;
}