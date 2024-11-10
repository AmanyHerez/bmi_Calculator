import 'package:flutter/cupertino.dart';

import '../model/bn_model.dart';
import '../view/screen/calculator_screen.dart';
import '../view/screen/history_screen.dart';

class BmiProvider extends ChangeNotifier{
  //*************************** Bottom Navigation Bar ********************************//
  int currentIndex=0;
  final List<BnModel> bnScreen = <BnModel>[
    const BnModel(widget: HistoryScreen()),
    BnModel(widget: CalculatorScreen()),
  ];
  changeBottomNavigationBar(int index){
    currentIndex=index;
    notifyListeners();
  }
  //*********************************************************************************//
}