import 'package:flutter/material.dart';
import 'package:sonocare_partner2/data/model/response/language_model.dart';
import 'package:sonocare_partner2/util/app_constants.dart';

class LanguageRepo {
  List<LanguageModel> getAllLanguages({required BuildContext context}) {
    return AppConstants.languages;
  }
}
