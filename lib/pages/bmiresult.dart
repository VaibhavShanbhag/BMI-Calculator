import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BMIResult extends StatefulWidget {
  final String name;
  final String gender;
  final int age;
  final int weight;
  final int height;
  const BMIResult(
      {Key? key,
      required this.name,
      required this.age,
      required this.weight,
      required this.height,
      required this.gender})
      : super(key: key);

  @override
  State<BMIResult> createState() => _BMIResultState();
}

class _BMIResultState extends State<BMIResult> {
  int bmiInfo = 0;
  String bmiWeightInfo = "";
  Color bmiColor = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    final heightInM = widget.height / 100;
    final bmiResultInt = widget.weight / ((heightInM) * (heightInM));
    final bmiResult =
        (widget.weight / ((heightInM) * (heightInM))).toStringAsFixed(1);

    if (bmiResultInt <= 16.0) {
      bmiInfo = 1;
      bmiWeightInfo = "You are Very Severly UnderWeight";
      bmiColor = const Color.fromRGBO(0, 162, 253, 1);
    }
    if (bmiResultInt >= 16.0 && bmiResultInt <= 16.9) {
      bmiInfo = 2;
      bmiWeightInfo = "You are Severly UnderWeight";
      bmiColor = const Color.fromRGBO(83, 214, 255, 1);
    }
    if (bmiResultInt >= 17.0 && bmiResultInt <= 18.4) {
      bmiInfo = 3;
      bmiWeightInfo = "You are UnderWeight";
      bmiColor = const Color.fromRGBO(134, 229, 250, 1);
    }
    if (bmiResultInt >= 18.5 && bmiResultInt <= 24.9) {
      bmiInfo = 4;
      bmiWeightInfo = "You have Normal Body Weight";
      bmiColor = const Color.fromRGBO(76, 200, 133, 1);
    }
    if (bmiResultInt >= 25.0 && bmiResultInt <= 29.9) {
      bmiInfo = 5;
      bmiWeightInfo = "You are OverWeight";
      bmiColor = const Color.fromRGBO(237, 231, 53, 1);
    }
    if (bmiResultInt >= 30.0 && bmiResultInt <= 34.9) {
      bmiInfo = 6;
      bmiWeightInfo = "You have Obese Class I Body Weight";
      bmiColor = const Color.fromRGBO(255, 169, 3, 1);
    }
    if (bmiResultInt >= 35.0 && bmiResultInt <= 39.9) {
      bmiInfo = 7;
      bmiWeightInfo = "You have Obese Class II Body Weight";
      bmiColor = const Color.fromRGBO(254, 91, 0, 1);
    }
    if (bmiResultInt >= 39.9) {
      bmiInfo = 8;
      bmiWeightInfo = "You have Obese Class II Body Weight";
      bmiColor = const Color.fromRGBO(255, 41, 41, 1);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  padding: const EdgeInsets.only(left: 30),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(33, 225, 157, 1),
                          Color.fromRGBO(53, 211, 229, 1)
                        ],
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Your BMI Result",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ],
                  )),
              Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      child: CircularPercentIndicator(
                        radius: 75.0,
                        animationDuration: 1000,
                        lineWidth: 12.0,
                        animation: true,
                        percent: bmiResultInt / widget.weight,
                        center: Text(
                          "$bmiResult",
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        backgroundColor: Colors.grey,
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: bmiColor,
                      ),
                    ),
                    Text(
                      bmiWeightInfo,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(204, 244, 248, 1),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                const Text(
                                  "Age",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "${widget.age}",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                const Text(
                                  "Weight",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "${widget.weight} Kg",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                const Text(
                                  "Height",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "${widget.height} Cm",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 2),
                                  width: 25,
                                  height: 23,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(0, 162, 253, 1)),
                                ),
                                Container(
                                  width: 310,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: bmiInfo == 1 ? bmiColor : null,
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Very Severly Underweight",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500)),
                                      Text("<16",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 2),
                                  width: 25,
                                  height: 23,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(83, 214, 255, 1)),
                                ),
                                Container(
                                  width: 310,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: bmiInfo == 2 ? bmiColor : null,
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Severly Underweight",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500)),
                                      Text("16.0-16.9",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 2),
                                  width: 25,
                                  height: 23,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(134, 229, 250, 1)),
                                ),
                                Container(
                                  width: 310,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: bmiInfo == 3 ? bmiColor : null,
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Underweight",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500)),
                                      Text("17.0-18.4",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 2),
                                  width: 25,
                                  height: 23,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(76, 200, 133, 1)),
                                ),
                                Container(
                                  width: 310,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: bmiInfo == 4 ? bmiColor : null,
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Normal",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500)),
                                      Text("18.5-24.9",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 2),
                                  width: 25,
                                  height: 23,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(237, 231, 53, 1)),
                                ),
                                Container(
                                  width: 310,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: bmiInfo == 5 ? bmiColor : null,
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Overweight",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500)),
                                      Text("25.0-29.9",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 2),
                                  width: 25,
                                  height: 23,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(255, 169, 3, 1)),
                                ),
                                Container(
                                  width: 310,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: bmiInfo == 6 ? bmiColor : null,
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Obese Class I",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500)),
                                      Text("30.0-34.9",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 2),
                                  width: 25,
                                  height: 23,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(254, 91, 0, 1)),
                                ),
                                Container(
                                  width: 310,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: bmiInfo == 7 ? bmiColor : null,
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Obese Class II",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500)),
                                      Text("35.0-39.9",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 2),
                                  width: 25,
                                  height: 23,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(255, 41, 41, 1)),
                                ),
                                Container(
                                  width: 310,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: bmiInfo == 8 ? bmiColor : null,
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Obese Class III",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500)),
                                      Text(">39.9",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
