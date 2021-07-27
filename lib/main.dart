import 'package:flutter/material.dart';
import "package:flutter/services.dart" show rootBundle;

import "package:yaml/yaml.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFde3939),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map items = {};

  Future getYaml() async {
    final yamlString =
        await rootBundle.loadString("assets/yaml_files/menu.yaml");
    final yamlMap = loadYaml(yamlString);
    setState(() {
      items = yamlMap;
    });
  }

  @override
  void initState() {
    getYaml();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SambaPOS"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                print("Pressed Button");
                print(items["menus"][0]["items"][0]["image"]);
              },
              child: Text("Print"),
            ),
            Text(items["menus"][0]["items"][0]["image"]),
            Image.asset(items["menus"][0]["items"][0]["image"]),
          ],
        ),
      ),
    );
  }
}
