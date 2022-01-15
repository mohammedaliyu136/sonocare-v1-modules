//LabTestProvider

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sonocare_partner2/data/model/response/response_model.dart';
import 'package:sonocare_partner2/data/model/response/review_model.dart';
import 'package:sonocare_partner2/data/repository/review_repo.dart';

class ReviewsController extends GetxController implements GetxService {
  final ReviewsRepo reviewsRepo;
  ReviewsController({required this.reviewsRepo}) {
    //_notification = authRepo.isNotificationActive();
  }
  List<ReviewModel> reviews = [];


  bool _isLoadingReviews = false;

  bool get isLoadingReviews => _isLoadingReviews;

  int totalReviews = 0;
  double totalRating = 0.0;

  Future<ResponseModel> getReviews({url}) async {
    double singleRatingComp = 0.0;
    _isLoadingReviews = true;
    update();
    ResponseModel _responseModel;

    Response response = await reviewsRepo.getReviews(url);
    _isLoadingReviews = false;
    if (response.statusCode == 200) {
      var responseBody = response.body['data'];
      totalReviews = responseBody.length;
      reviews = [];
      for( var i = 0 ; i < responseBody.length; i++ ) {
        singleRatingComp += double.parse(responseBody[i]['rating']);
        reviews.add(ReviewModel.fromJson(responseBody[i]));
      }
      totalRating = singleRatingComp/totalReviews;
      _responseModel = ResponseModel(true, 'successful');
    } else {
      _responseModel = ResponseModel(false, 'errorMessage');
    }
    update();
    return _responseModel;
  }
}