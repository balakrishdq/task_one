// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:task_one/AssociatedDrug.dart';

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
  @override
  void initState() {
    getAllProblem();
    super.initState();
  }

  Future<List<AssociatedDrug>> getAllProblem() async {
    List<AssociatedDrug> problemList = [];
    var apiURl = 'https://run.mocky.io/v3/5c648026-c95a-4cf8-9a14-79f13cfb29d3';
    var response = await http.get(Uri.parse(apiURl));
    if (response.statusCode == 200) {
      var data = await jsonDecode(response.body.toString());
      problemList = data.map((problems) => AssociatedDrug.fromJson(problems));

      print(problemList);
    }
    return problemList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
