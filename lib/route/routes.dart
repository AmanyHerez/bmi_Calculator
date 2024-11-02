import 'package:bmi/view/screen/main_screen.dart';
import 'package:bmi/view/screen/splach_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes{
  static const String SPLACH="/";
  static const String MAIN="main";
  static Map<String ,Widget Function(BuildContext)> getPageRoutes(context){
  return {
    AppRoutes.SPLACH:(context)=>SplachScreen(),
    AppRoutes.MAIN:(context)=>MainScreen(),
  };
}
}

