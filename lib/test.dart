import 'package:flutter/material.dart';

class MyTestApp extends StatefulWidget {
  const MyTestApp({Key? key}) : super(key: key);

  @override
  State<MyTestApp> createState() => _MyTestAppState();
}

class _MyTestAppState extends State<MyTestApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test111'),
      ),
      body: Center(
        child: Text('daklshfajhfjaksdf'),
      ),
    );
  }
}
