import 'package:bmi/provider/bmi_provider.dart';
import 'package:bmi/route/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<BmiProvider>(create: (context){
        return BmiProvider();
      })],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:AppRoutes.SPLACH ,
        routes: AppRoutes.getPageRoutes(context),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}