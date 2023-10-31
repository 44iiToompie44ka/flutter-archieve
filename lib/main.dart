import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/TreesData.dart';
import 'package:flutter_application_1/region.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffECEEEC),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xffECEEEC)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int treestotal = 0;
  int oxygentotal = 0;

  void requestPlant() {
    treestotal++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Озеленение Города"),
      ),
      body: Stack(
        children: [
          _body(),
          Align(
            alignment: Alignment.bottomCenter,
            child: _plantButton(),
          )
        ],
      ),
    );
  }

  _plantButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 44, left: 16, right: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Regions();
          }));
        },
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const Text(
            'Посадить дерево',
            style: TextStyle(color: Colors.white, fontSize: 22),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width / 2 - 32,
                child: Column(
                  children: [Text('Посажено'), Text("$treestotal")],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width / 2 - 32,
                child: Column(
                  children: [
                    Text('Кислорода Произведено'),
                    Text("~$oxygentotal т")
                  ],
                ),
              ),
            ),
          ],
        ),
        const Padding(
            padding: EdgeInsets.only(left: 16), child: Text('Твои деревья')),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
              child: Column(children: [
            TreesData(
              Variety: "test",
              Value: 21,
            ),
            TreesData(
              Variety: "test32",
              Value: 32,
            )
          ])),
        )
      ],
    );
  }
}
