import 'package:flutter/material.dart';
import 'package:flutter_dart_learn/data_type.dart';

import 'oop_learn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart语言学习',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Dart语言学习'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    _oopLearn();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        //todo https://segmentfault.com/a/1190000019716289 ListView
        child: ListView(
          children: <Widget>[
            DataType(),
          ],
        ),
      ),
    );
  }

  void _oopLearn() {
    //创建Student的对象
    Student stu1 = Student('清华', 'Jack', 18);
    stu1.school = '985';
    print(stu1.toString());

    print('------------------oopLearn---------------------------');

    Logger log1 = Logger();
    Logger log2 = Logger();
    print(log1==log2);

  }
}
