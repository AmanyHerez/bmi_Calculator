import 'package:bmi/route/routes.dart';
import 'package:bmi/shared/style/color_manger.dart';
import 'package:flutter/material.dart';


class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, AppRoutes.MAIN);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: AppColor.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image(image: AssetImage('asset/images/logo.png'),width: 200,height: 200,)),
            ],
          )
      ),
    );
  }
}
