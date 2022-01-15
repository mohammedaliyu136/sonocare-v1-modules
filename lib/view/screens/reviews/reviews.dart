import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/auth_controller.dart';
import 'package:sonocare_partner2/controller/reviews_controller.dart';
import 'package:sonocare_partner2/data/model/response/review_model.dart';
import 'package:sonocare_partner2/util/app_constants.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
//my_patient_screen
class RatingModel{
  String name = '';
  double rating = 0.0;
  String message = '';
  String days = '';
  RatingModel({required this.name, required this.rating, required this.message, required this.days});
}
class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  List<RatingModel> ratings = [
    RatingModel(name: 'Ewada Omakwu', rating: 4.0, message: 'I like the app and the interface is easy to navigate. Also option of being able to choose a doctor of your choice based on price and specialty makes it great. But , there should be space a person can search or request for a specialist in a particular health care need one would be recommended. That will be great.', days: '1 days ago'),
    RatingModel(name: 'Emmanuel Adepoju', rating: 5.0, message: 'The doctor was professional and very easy to converse with. The voice feature wasn\'t working so that was a bummer, we had to make do with just the chat feature. The UI is user friendly and pretty easy to navigate The UX could use some improvements. Being able to reply specific messages for example, being able to copy messages if the former isn\'t', days: '2 days ago'),
    RatingModel(name: 'Euginho Cortez', rating: 3.5, message: 'Smooth sign-up process. Well-designed layout. I ordered medication and got it in some hours. App works rather well.', days: '10 days ago'),
    RatingModel(name: 'Tudix- Arewa', rating: 3.0, message: 'I don\'t really understand this app, because I was having a trouble after the registration is about to be done, it asks about my country and clicked the following line underneath \'Nigeria\' my country, yet, it keeps loading and brings an error. Why is it so?', days: '20 days ago'),
  ];

  @override
  void initState() {
    String accountType = Get.find<AuthController>().accountType;
    String url = '';// /api/docreviews
    if(accountType=='Lab'){
      url = AppConstants.LAB_GET_REVIEW;
    }else if(accountType=='Pharmacy'){
      url = AppConstants.PHARMACY_GET_REVIEW;
    }else if(accountType=='Delivery'){
      url = AppConstants.DELIVERY_GET_REVIEW;
    }else if(accountType=='Doctor'){
      url = AppConstants.DOCTOR_GET_REVIEW;
    }else if(accountType=='Nurse'){
      url = AppConstants.NURSE_GET_REVIEW;
    }
    Get.find<ReviewsController>().getReviews(url: url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: [
      const DarkBackGround(),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Reviews'),
          elevation: 0,
          leading: GestureDetector(
              onTap: ()=>Navigator.pop(context),
              child: Image.asset(Images.backArrowIcon)),
        ),
        //body: Center(child: Text('Reviews Screen is in progress...', style: TextStyle(color: Colors.white, fontSize: 16),),)
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<ReviewsController>(builder: (reviewController) {
                if(reviewController.isLoadingReviews){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [CircularProgressIndicator(color: Colors.red,),],),
                    ],
                  );
                }else{
                  if(reviewController.totalRating.toString()=='NaN'){
                    return const Center(child: Text('You don\'t any reviews.', style: TextStyle(color: Colors.white, fontSize: 18),));
                  }else{
                    return ListView(children: [
                      Column(children: [
                        Text(reviewController.totalRating.toString(), style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3.0),
                            child: stars_list(rating: reviewController.totalRating, size:24)
                        ),
                        Text('based on ${reviewController.totalReviews} reviews', style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.7)
                        ),),
                      ],),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                        child: SizedBox(height: 2, width: MediaQuery.of(context).size.width, child: Container(color: Colors.white.withOpacity(0.1),),),
                      ),
                      reviews_list(ratings:reviewController.reviews)
                    ],);
                  }
                }
            }
          ),
        ),
      ),
    ],);
  }
}

reviews_list({required List<ReviewModel> ratings}) {
  return Column(
    children: ratings.map((ReviewModel rating){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(100))
            ),
            child: const Icon(Icons.account_circle_rounded, size: 50, color: Colors.white,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(rating.patientName, style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),),
                const SizedBox(height: 1.5,),
                stars_list(rating: double.parse(rating.rating))
              ],),
          ),
          const Spacer(),
          Align(
              alignment: Alignment.bottomCenter,
              child: Text(rating.createdAT, style: TextStyle(color: Colors.white.withOpacity(0.7)),textAlign: TextAlign.center,)),
        ],),
        const SizedBox(height: 8,),
        Text(rating.comment,
          maxLines: 4, overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
          style: TextStyle(
            height: 1.35,
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,),
        )
      ],),
    );
  }).toList(),);
}

stars_list({required double rating, double? size}){
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Icon(Icons.star, color: rating>0?const Color(0xFFEF7822):Colors.grey, size: size??18,),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Icon(Icons.star, color: rating>1.9?const Color(0xFFEF7822):Colors.grey, size: size??18,),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Icon(Icons.star, color: rating>2.9?const Color(0xFFEF7822):Colors.grey, size: size??18,),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Icon(Icons.star, color: rating>3.9?const Color(0xFFEF7822):Colors.grey, size: size??18,),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Icon(Icons.star, color: rating>4.9?const Color(0xFFEF7822):Colors.grey, size: size??18,),
      ),
      size==null?Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(rating.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
      ):const SizedBox(height: 0,)
    ],
  );
}
