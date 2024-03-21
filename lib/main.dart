import 'package:flutter/material.dart';
import 'package:schoolmanagement/app/app.bottomsheets.dart';
import 'package:schoolmanagement/app/app.dialogs.dart';
import 'package:schoolmanagement/app/app.locator.dart';
import 'package:schoolmanagement/app/app.router.dart';
import 'package:schoolmanagement/themes/app_theme.dart';
import 'package:stacked_services/stacked_services.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Management',
      theme: AppTheme.getAppTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
