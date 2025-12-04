import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:my_mvvm/ui/tools/screen_size.dart';
import 'package:my_mvvm/app/app.locator.dart';
import 'package:my_mvvm/app/app.router.dart';
import 'package:my_mvvm/constants/app_strings.dart';

Future<void> main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  if (!kIsWeb) {
    if (Platform.isAndroid) {
      // ByteData data = await PlatformAssetBundle().load(
      //   Assets.ca.letsEncryptR3,
      // );
      // SecurityContext.defaultContext.setTrustedCertificatesBytes(
      //   data.buffer.asUint8List(),
      // );
    }
  }
  setupDependencies();
  runApp(const MyApp());
}

Future<void> setupDependencies() async {
  setupLocator();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFBF1)),
      title: AppStrings.appName,
      builder: (context, child) {
        ScreenSize.init(context);
        FlutterSmartDialog.init();
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(1)),
          child: child!,
        );
      },
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorObservers: [
        StackedService.routeObserver,
        FlutterSmartDialog.observer,
      ],
    );
  }
}




// stacked: ^3.5.0
//   http: ^1.6.0
//   stacked_services: ^1.6.0
//   shimmer_animation: ^2.2.2+1
//   flutter_screenutil: ^5.9.3
//   flutter_smart_dialog: ^4.9.8+9
//   shared_preferences: ^2.5.3

//stacked use for architecture
//network calling like http or dio
//stacked services used for stack route its same like an a name routeing for navigation
//shimmer loading time design
//flutter screeutil for creating responsive app
//flutter smart dialog used without build contecxt for everything
//shared preferences used to store user perferences

// dev-dependencies
// stacked_generator: ^2.0.0
//   build_runner: ^2.6.0
//   flutter_gen_runner: ^5.12.0

//it set under the flutterlints
// stack_generator used create an stacked route files it work on combine with stacked sevices
//flutter_gen_runner is used for creating shortcuts for assets
// build_ runner is used create an intermediate code generation

//next step copy on the asset dirctory from reference project and paste on my own project
//then paste all directory from lib then paste to our page
//replace the code from reference project main.dart to my project main.dart
//copy the below section of  flutter_gen_runner in yaml file then paste on same that in my own project under the flutter_gen_runner

//assets have ca or certificate file that will be used for encrypting and decrypting
//(dart run build_runner build --delete-conflicting-outputs) this command is used to generate intermediate code on the back ground 
//which means er can delete any pageview or anything else on the project that will be change on the app Router file


//when any change in project in page we want to run build_runner command and then run the project
//app_locator and app_router are auto generated code we dosent have modify in hands

