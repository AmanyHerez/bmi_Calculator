import 'package:bmi/model/bn_model.dart';
import 'package:bmi/provider/bmi_provider.dart';
import 'package:bmi/shared/componet/custom_text_filed.dart';
import 'package:bmi/shared/style/color_manger.dart';
import 'package:bmi/model/bn_model.dart';
import 'package:bmi/view/screen/calculator_screen.dart';
import 'package:bmi/view/screen/history_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BmiProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: provider.bnScreen[provider.currentIndex].widget,
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: true,
            mouseCursor: MouseCursor.defer,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColor.primary,
            onTap: (int value) => provider.changeBottomNavigationBar(value),
            currentIndex: provider.currentIndex,
            selectedItemColor: Colors.white,
            selectedFontSize: 15,
            iconSize: 30,
            items: [
              BottomNavigationBarItem(
                backgroundColor: AppColor.primary,
                activeIcon: Icon(Icons.history),
                icon: Icon(Icons.history),
                label: "history".tr(),
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.calculate),
                icon: Icon(Icons.calculate_outlined),g
                label: "bmi_calculator".tr(),
              ),
            ],
          ),

        );
      },
    );
  }
}
