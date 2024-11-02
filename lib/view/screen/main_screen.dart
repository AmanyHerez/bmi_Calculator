import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("h".tr()),
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {
              if (context.locale.toString() == 'ar') {
                context.setLocale(Locale('en'));
              } else {
                context.setLocale(Locale('ar'));
              }
            },
            icon: Icon(Icons.language),
          ),
          // ElevatedButton(
          //   onPressed: (){
          //     context.resetLocale();
          //   },
          //   child: Text("convert"),
          // )
        ],
      ),
    );
  }
}
