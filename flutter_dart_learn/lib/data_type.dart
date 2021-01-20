import 'package:flutter/material.dart';

class DataType extends StatefulWidget {
  @override
  _DataTypeState createState() => _DataTypeState();
}

class _DataTypeState extends State<DataType> {
  @override
  Widget build(BuildContext context) {
    _numType();
    _stringType();
    _boolType();
    return Container(
      child: Text('常用数据类型,请看控制台输出'),
    );
  }

  ///数字类型
  void _numType() {
    print('---------------------numType---------------------------');
    num num1 = -1.0; //num是数字类型的父类，有两个子类 int 和 double。
    num num2 = 2;
    int int1 = 3; //只能是整数
    double d1 = 1.68; //双精度）浮点数
    print("num1:$num1 num2:$num2 int1:$int1 double:$d1");
    print('num1 绝对值:  ${num1.abs()}'); //求绝对值
    print('num1 转 int:  ${num1.toInt()}'); //转换成int
    print('num1 转 Double:  ${num1.toDouble()}'); //转换成Double
  }

  ///字符串类型
  void _stringType() {
    print('---------------------stringType---------------------------');
    String str1 = '字符串', str2 = "双引号"; //字符串定义,单引号,双引号都可以
    String str3 = 'st1:$str1 str2:$str2 (双引号内)'; //字符串拼接
    String str5 = '常用数据类型，请看控制台输出';
    String str4 = 'st1:' + str1 + 'str2:' + str2 + ' (加号拼接字符串)'; //字符串拼接
    print(str3);
    print(str4);
    //原始字符串,不需要转义写法
    String str6 = r" '单引号' ";
    //String str7 = r' '单引号' '; //只能双引号套单引号或者反之用法
    print("原始字符串 $str6");
    //多行字符串
    String str8 = ''' 恩恩额,换行
    第二行了 ''';
    print('多行字符串:   $str8');
    //常用方法
    print('字符串截取:  ${str5.substring(1, 5)}'); //字符串截取
    print(r'获取 "类型" 在指定字符串的位置:  ' + str5.indexOf('类型').toString()); //获取指定字符串位置
    print('保留 3.12345 小数后3位: ' + 3.12345.toStringAsFixed(3)); //保留精度 3.123
    String str9 = "a,d,d d,c,,";
    List<String> spiltList = str9.split(","); //使用，分割，返回的是一个数组
    print('按,号分隔返回数组 --> 数组:  $spiltList   length:  ${spiltList.length}');
    String str10 = "abba";
    print('正则切割字符串,返回数组:   ${str10.split(new RegExp(r"b*"))}'); //正则切割字符串,返回数组
    //判断是否包含或以xxx开始
    String str11 = "aaabbbccc";
    print("判断是否包含xxx:  ${str11.contains("cc")}"); //true
    print("判断是否包含或以xxx开始:  ${str11.startsWith("aa")}"); //true
    print("判断是否包含或以xxx开始(index为3开始判断):  ${str11.startsWith("aa", 3)}"); //false 从index=3开始判断
    String str12 = "abcdeab";
    print("abcdeab 替换 ab 为 cc  :   ${str12.replaceAll("ab", "cc")}"); //cccdecc 替换全部符合条件的
    print("abcdeab 替换第一个ab 为 dd  :  ${str12.replaceFirst("ab", "dd")}"); //ddcdeab 只替换第一个符合条件的
  }

  ///布尔类型，Dart 是强 bool 类型检查，只有bool 类型的值是true 才被认为是true
  void _boolType() {
    print('---------------------boolType---------------------------');
    bool success = true, fail = false;
    print(success);
    print(fail);
    print(success || fail); //true
    print(success && fail); //false
  }
}
