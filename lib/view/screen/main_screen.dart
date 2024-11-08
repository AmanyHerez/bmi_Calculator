import 'package:bmi/model/bn_model.dart';
import 'package:bmi/shared/componet/custom_text_filed.dart';
import 'package:bmi/view/screen/calculator_screen.dart';
import 'package:bmi/view/screen/history_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<BnModel> _bnScreen = <BnModel>[
    const BnModel(widget: HistoryScreen()),
    BnModel(widget: CalculatorScreen()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bnScreen[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: "History"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate), label: "Calculator"),
          ]),
    );
  }
}
