import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_one/Problems.dart';

class HomeScreen extends StatefulWidget {
  final String name, email;
  HomeScreen({
    Key? key,
    required this.email,
    required this.name,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Problems>> getData() async {
    List<Problems> list;
    String link =
        "https://run.mocky.io/v3/5c648026-c95a-4cf8-9a14-79f13cfb29d3";
    var res = await http.get(Uri.parse(link));
    print(res.body);

    var data = json.decode(res.body);
    var rest = data["problems"] as List;
    print(rest);
    list = rest.map<Problems>((json) => Problems.fromMap(json)).toList();
    print("List Size : ${list.length}");

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              Text(
                '${widget.name}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              Text(
                '${widget.email}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// print(data[0]['Diabetes'][0]['medications'][0]['medicationsClasses'][0]
//     ['className'][0]['associatedDrug'][0]['name']);
// print(data[0]['Diabetes'][0]['medications'][0]['medicationsClasses'][0]
//     ['className'][0]['associatedDrug'][0]['dose']);
// print(data[0]['Diabetes'][0]['medications'][0]['medicationsClasses'][0]
//     ['className'][0]['associatedDrug'][0]['strength']);


  // getAllProblems() async {
  //   var apiURl = 'https://run.mocky.io/v3/5c648026-c95a-4cf8-9a14-79f13cfb29d3';
  //   var response = await http.get(Uri.parse(apiURl));
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> map =
  //         await jsonDecode(response.body) as Map<String, dynamic>;
  //     List data = map["problems"];
  //     print(data[0]['Diabetes'][0]['medications'][0]['medicationsClasses'][0]
  //         ['className'][0]['associatedDrug'][0]['name']);
  //   } else {
  //     throw Exception('error');
  //   }
  //   setState(() {
  //     data;
  //   });
  //   return data;
  // }