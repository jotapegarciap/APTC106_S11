import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {

  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('Counter: $count', style: TextStyle(color: Colors.white, fontSize: 30))),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          count++;
        });
        //print(count);
      },
      child: Icon(Icons.add),
      ),
    );
  }
}