import 'package:bmi/shared/componet/custom_text_filed.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController controller = TextEditingController();

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
          CustomeTextField(
              title: 'الطول',
              controller: controller,
              inputType: TextInputType.number,
              validator: () {})
        ],
      ),
    );
  }
}
