import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String value = "";

  String checkShape() {
    final int? number = int.tryParse(value);
    if (number == null) {
      return "Error: input value is not is not valid";
    } else {
      bool square = false;
      bool triangle = false;
      if (sqrt(number) % 1 == 0) {
        square = true;
      }
      int count = 1;
      int sum = 0;
      while (number > sum) {
        sum = sum + count;
        count += 1;
        if (number == sum) {
          triangle = true;
          break;
        }
      }

      return "The value is ${(!square) ? "not " : ""}a square , and the value is ${(!triangle) ? "not " : ""}a triangle";
    }
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: (double.tryParse(value) == null) ? const Text("Error") : Text(value),
      content: Text(checkShape()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Number Shapes")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Text("Please input a number to check if it is a square or a triangle",
                style: TextStyle(fontSize: 20)),
            TextField(
              onChanged: (String input) {
                setState(() {
                  value = input;
                });
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildPopupDialog(context),
          );
        },
        tooltip: 'Check Number',
        child: const Icon(Icons.check),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
