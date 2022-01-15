import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonocare_partner2/controller/localization_controller.dart';
import 'package:sonocare_partner2/controller/splash_controller.dart';
import 'package:sonocare_partner2/controller/theme_controller.dart';
import 'package:sonocare_partner2/helper/route_helper.dart';
import 'package:sonocare_partner2/theme/dark_theme.dart';
import 'package:sonocare_partner2/theme/light_theme.dart';
import 'package:sonocare_partner2/util/app_constants.dart';
import 'package:sonocare_partner2/util/messages.dart';

import 'package:sonocare_partner2/helper/get_di.dart' as di;
import 'package:url_strategy/url_strategy.dart';


Future<void> main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> _languages = await di.init();

  runApp(MyApp(languages: _languages));
}

class MyApp extends StatelessWidget {

  final Map<String, Map<String, String>> languages;
  const MyApp({Key? key, required this.languages}) : super(key: key);


  void _route() {
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetBuilder<LocalizationController>(builder: (localizeController) {
        return GetBuilder<SplashController>(builder: (splashController) {
          return GetMaterialApp(
            title: AppConstants.APP_NAME,
            debugShowCheckedModeBanner: false,
            navigatorKey: Get.key,
            // scrollBehavior: MaterialScrollBehavior().copyWith(
            //   dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
            // ),
            theme: themeController.darkTheme ? dark : light,
            locale: localizeController.locale,
            translations: Messages(languages: languages),
            fallbackLocale: Locale(AppConstants.languages[0].languageCode, AppConstants.languages[0].countryCode),
            initialRoute: GetPlatform.isWeb ? RouteHelper.getInitialRoute() : RouteHelper.getSplashRoute(),
            getPages: RouteHelper.routes,
            defaultTransition: Transition.topLevel,
            transitionDuration: Duration(milliseconds: 500),
          );
        });
      });
    });
  }
}
