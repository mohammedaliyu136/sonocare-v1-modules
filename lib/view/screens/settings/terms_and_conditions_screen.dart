import 'package:flutter/material.dart';
import 'package:sonocare_partner2/util/color_resources.dart';
import 'package:sonocare_partner2/util/images.dart';
import 'package:sonocare_partner2/view/base/background.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionsScreen> createState() => _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  bool isLoading = true;
  late WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: [
      const DarkBackGround(),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
                onTap: ()=>Navigator.pop(context),
                child: Image.asset(Images.backArrowIcon)),
            title: const Text('Terms and Conditions', style: TextStyle(color: Colors.white),),
            elevation: 0,
          ),
          body: Stack(
            children: [
              WebView(
                initialUrl: 'https://sonocare.com.ng/terms-conditions/',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller = webViewController;
                },
                onPageFinished: (String url) {
                  print('Page finished loading: $url');
                  setState(() {
                    isLoading = false;
                  });
                },
                onProgress: (int progress) {
                  print('WebView is loading (progress : $progress%)');
                },
              ),
              if(isLoading)Container(height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,color: ColorResources.COLOR_PURPLE_DEEP,),
              if(isLoading)Align(
                  alignment: Alignment.center,
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [CircularProgressIndicator(color: Colors.red,),],)),
            ],
          ),
      )
    ],);
  }
}
