import 'dart:convert';

import 'package:covid_vaccine_slots/ShowSlots.dart';
import 'package:covid_vaccine_slots/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vaccination',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

TextEditingController pinController = TextEditingController();
TextEditingController dateController = TextEditingController();
String dropdownValue = '01';
String url =
    "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=${pinController.text}&date=${dateController.text}-$dropdownValue-2021";

class _MyHomePageState extends State<MyHomePage> {
  List slots = [];
  bool isLoading = false;

  getSlotdata() async {
    setState(() {
      isLoading = true;
    });
    await http.get(Uri.parse(url)).then(
      (value) async {
        Map result = json.decode(value.body);
        slots = result["sessions"];
        print(slots);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ShowSlots(
              showData: slots,
            ),
          ),
        );
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            backgroundColor: Colors.white60,
            body: const Loading(),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: SingleChildScrollView(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "assets/vaccination.jpg",
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          )),
                      const SizedBox(height: 36),
                      TextFormField(
                        keyboardType: TextInputType.datetime,
                        controller: pinController,
                        decoration: const InputDecoration(
                          hintText: "PinCode",
                          labelText: "PinCode",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.datetime,
                              controller: dateController,
                              decoration: const InputDecoration(
                                hintText: "Date",
                                labelText: "Date",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                isExpanded: true,
                                style: const TextStyle(color: Colors.black),
                                underline: Container(
                                  height: 2,
                                  color: Colors.white,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: <String>[
                                  '01',
                                  '02',
                                  '03',
                                  '04',
                                  '05',
                                  '06',
                                  '07',
                                  '08',
                                  '09',
                                  '10',
                                  '11',
                                  '12',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: getSlotdata,
                        child: const Text("GetData"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
