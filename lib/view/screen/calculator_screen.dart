import 'package:bmi/shared/componet/custom_text_filed.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var bmiScore;
  String? status;
  int? height;
  int? weight;
  TextEditingController heightController = TextEditingController();

  TextEditingController weightController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  GlobalKey<FormState> bmikey = GlobalKey();

  validationHeight(String value) {
    if (value.isEmpty) {
      return 'please enter your height';
    }
    if (int.parse(value) < 0) {
      return 'your height must be positive mumber';
    }
  }

  validationWeight(String value) {
    if (value.isEmpty) {
      return 'please enter your Weight';
    } else if (int.parse(value) < 0) {
      return 'your height must be positive mumber';
    }
  }

  CalculateBMI() {
    height = int.parse(heightController.value.text);
    weight = int.parse(weightController.value.text);
    bmiScore = (weight! / ((height! / 100) * (height! / 100))).toInt();
    // if (bmi >= 18.5 && bmi <= 25) {
    //   status = "Normal BMI";
    // } else if (bmi > 25 && bmi <= 30) {
    //   status = "Overweight";
    // } else if (bmi > 30) {
    //   status = "Obesity";
    // } else {
    //   status = "Under Weight";
    // }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldState,
      drawer: Drawer(
          backgroundColor: Colors.redAccent,
          child: Column(
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
            ],
          )),
      body: Form(
        key: bmikey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/images/bg.png"),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),

                    IconButton(
                      icon: Icon(Icons.menu, color: Colors.white, size: 30),
                      onPressed: () {
                        _scaffoldState.currentState!.openDrawer();
                      },
                    ),
                    // IconButton(
                    //   onPressed: () {
                    //     Scaffold.of(context).openDrawer();
                    //     // if (context.locale.toString() == 'ar') {
                    //     //   context.setLocale(Locale('en'));
                    //     // } else {
                    //     //   context.setLocale(Locale('ar'));
                    //     // }
                    //   },
                    //   icon: Icon(Icons.language),
                    // ),
                    Center(
                      child: Text(
                        "bmi_calculator".tr(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          fontFamily: 'Gabriela-Regular',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.15,
                        left: size.width * 0.06,
                        right: size.width * 0.06,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "height".tr(),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              fontFamily: 'Gabriela-Regular',
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          CustomeTextField(
                              title: 'height_cm'.tr(),
                              controller: heightController,
                              inputType: TextInputType.number,
                              validator: validationHeight),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Weight".tr(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                fontFamily: 'Gabriela-Regular'),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          CustomeTextField(
                              title: 'Weight_kg'.tr(),
                              controller: weightController,
                              inputType: TextInputType.number,
                              validator: validationWeight),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Date".tr(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                fontFamily: 'Gabriela-Regular'),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          TextField(
                            controller: dateController,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Color(0xFFA557FF),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Gabriela-Regular',
                                ),
                                hintText: "date".tr()),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate;
                              pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101));

                              if (pickedDate != null) {
                                print(pickedDate);
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(formattedDate);
                                setState(() {
                                  dateController.text = formattedDate;
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                          )
                          // TextFormField(
                          //   controller: dateController,
                          //   decoration: InputDecoration(
                          //       contentPadding: EdgeInsets.all(15),
                          //       hintText: 'Date'.tr(),
                          //       hintStyle: TextStyle(
                          //         fontSize: 14,
                          //         fontFamily: 'Gabriela-Regular',
                          //       ),
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(15),
                          //       )),
                          //   onTap: ()async{
                          //     DateTime date=DateTime.now();
                          //     DateTime? pickedDate=await showDatePicker(context: context, initialDate:date , firstDate: DateTime(2000), lastDate: DateTime(2100));
                          //     if(pickedDate== null)return;
                          //     setState(() {
                          //       date=pickedDate;
                          //     });
                          //   },
                          // ),
                          // CustomeTextField(
                          //     title: 'Date'.tr(),
                          //     controller: dateController,
                          //     inputType: TextInputType.datetime,
                          //     validator: validationWeight,
                          // //onTap:
                          //    ),
                          ,
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                bmikey.currentState!.validate();
                                CalculateBMI();
                                //save();
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => ScoreScreen(
                                //               bmiScore: bmiScore,
                                //               height: heightController.text,
                                //               weight: weightController.text,
                                //               date: dateController.text,
                                //             )));

                                setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFA557FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding: EdgeInsets.all(13),
                              ),
                              child: Text(
                                'Calculate'.tr(),
                                style: TextStyle(
                                  fontFamily: 'Gabriela-Regular',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ),
                          Text("Result $bmiScore "),
                          // Center(
                          //   child: Text(
                          //     bmi == null ? 'No Result' : bmi!.toString(),
                          //     style: const TextStyle(fontSize: 50),
                          //     textAlign: TextAlign.center,
                          //   ),
                          // ),
                          // Center(child: Text(status!)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// class CalculatorScreen extends StatefulWidget {
//   CalculatorScreen({super.key});

//   @override
//   State<CalculatorScreen> createState() => _CalculatorScreenState();
// }

// class _CalculatorScreenState extends State<CalculatorScreen> {
//   TextEditingController controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("h".tr()),
//       ),
//       body: Column(
//         children: [
//           IconButton(
//             onPressed: () {
//               if (context.locale.toString() == 'ar') {
//                 context.setLocale(Locale('en'));
//               } else {
//                 context.setLocale(Locale('ar'));
//               }
//             },
//             icon: Icon(Icons.language),
//           ),
//           CustomeTextField(
//               title: 'الطول',
//               controller: controller,
//               inputType: TextInputType.number,
//               validator: () {})
//         ],
//       ),
//     );
//   }
// }
