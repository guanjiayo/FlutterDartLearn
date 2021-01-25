import 'package:flutter/material.dart';

import 'dart/function_learn.dart';
import 'dart/generic_learn.dart';
import 'dart/oop_learn.dart';

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
    //_oopLearn();
    //_functionLearn();
    _genericLearn();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        //todo https://segmentfault.com/a/1190000019716289 ListView
        child: ListView(
          children: <Widget>[
            //DataType(),
          ],
        ),
      ),
    );
  }

  void _oopLearn() {
    print('------------------oopLearn---------------------------');
    Logger log1 = Logger();
    Logger log2 = Logger();
    print(log1==log2);

    //创建Student的对象
    Student stu1 = Student('清华', 'Jack', 18);
    stu1.school = '985';
    print(stu1.toString());

    Student stu2 = Student('北大', 'Tom', 16, city: '上海', country: '中国');
    print(stu2.toString());

    //抽象类
    StudyFlutter sf = StudyFlutter();
    sf.study();

  }

  void _functionLearn() {
    TestFunction testFunction = TestFunction();
    testFunction.start();
  }

  void _genericLearn() {
    TestGeneric testGeneric = TestGeneric();
    testGeneric.start();
  }
}
