import 'package:bmi/pages/bmiresult.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailsScreen extends StatefulWidget {
  final String userName;
  const DetailsScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String gender = "";
  final _ageEditController = TextEditingController();
  final _weightEditController = TextEditingController();
  final _heightEditController = TextEditingController();
  int age = 0;
  int weight = 0;
  int height = 0;
  @override
  Widget build(BuildContext context) {
    String name = widget.userName;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
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
                children: [
                  Text("Hi $name!",
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                ],
              )),
          Container(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Text(
                            "Age",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Flexible(
                          child: TextField(
                              controller: _ageEditController,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(204, 244, 248, 1)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  filled: true,
                                  fillColor: Color.fromRGBO(204, 244, 248, 1))),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Text(
                            "Weight",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Flexible(
                          child: TextField(
                              controller: _weightEditController,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  hintText: "In Kgs",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(204, 244, 248, 1)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  filled: true,
                                  fillColor: Color.fromRGBO(204, 244, 248, 1))),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Text(
                            "Height",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Flexible(
                          child: TextField(
                              controller: _heightEditController,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  hintText: "In Cms",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(204, 244, 248, 1)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  filled: true,
                                  fillColor: Color.fromRGBO(204, 244, 248, 1))),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Text(
                            "Gender",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                RadioListTile(
                                    title: const Text("Male"),
                                    value: "Male",
                                    groupValue: gender,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value.toString();
                                      });
                                    }),
                                RadioListTile(
                                    title: const Text("Female"),
                                    value: "Female",
                                    groupValue: gender,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value.toString();
                                      });
                                    }),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 25),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(53, 210, 233, 1),
                          padding: const EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Container(
                          width: 200,
                          child: const Center(
                            child: Text(
                              "Calculate your BMI",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          )),
                      onPressed: () {
                        print(gender);
                        if (_ageEditController.text.isEmpty ||
                            _weightEditController.text.isEmpty ||
                            _heightEditController.text.isEmpty ||
                            gender.isEmpty) {
                          showToast();
                        } else {
                          age = int.parse(_ageEditController.text);
                          weight = int.parse(_weightEditController.text);
                          height = int.parse(_heightEditController.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => BMIResult(
                                      name: widget.userName,
                                      age: age,
                                      weight: weight,
                                      height: height,
                                      gender: gender))));
                        }
                      },
                    ),
                  )
                ],
              ))
        ],
      )),
    );
  }

  void showToast() => Fluttertoast.showToast(
      msg: "Please Fill all Details",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0);
}
