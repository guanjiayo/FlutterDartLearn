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
    _listType();
    _mapType();
    _tips();
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
    print(
        "判断是否包含或以xxx开始(index为3开始判断):  ${str11.startsWith("aa", 3)}"); //false 从index=3开始判断
    String str12 = "abcdeab";
    print(
        "abcdeab 替换 ab 为 cc  :   ${str12.replaceAll("ab", "cc")}"); //cccdecc 替换全部符合条件的
    print(
        "abcdeab 替换第一个ab 为 dd  :  ${str12.replaceFirst("ab", "dd")}"); //ddcdeab 只替换第一个符合条件的
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

  ///List集合
  void _listType() {
    print('---------------------listType---------------------------');

    ///集合初始化的方式
    //list 和 list1 都是不限定长度，不限定类型，可添加任意类型的数据
    //如果List内元素都为int,会直接变成智能转型为 List<int> 集合
    List list = [1, 2, 3, '集合']; //初始化时，添加元素
    print(list);
    var list1 = [];
    List<int> list2 = [];
    // list2 = list;//错误做法，类型转换错误
    List list3 = [];
    list3.add('list3'); //通过add方法添加元素
    list3.addAll(list);
    print('List集合add添加元素:   $list3');
    List list4 = List.generate(3, (index) => index * 2);
    print(list4);

    ///遍历集合的方式
    print('------------------遍历集合for方式---------------------------');
    for (int i = 0; i < list.length; i++) {
      print(list[i]);
    }
    print('------------------遍历集合高级for方式---------------------------');
    for (var o in list) {
      print(o);
    }
    print('------------------遍历集合forEach---------------------------');
    list.forEach((val) {
      print(val);
    });
    print('集合反序:   ${list.reversed}');

    var list5 = [1, 2, 3, '集合'];
    list5.insert(1, "元素");
    print(r"[1, 2, 3, '集合']  在下标为 1 插入元素:   " + list5.toString());

    var list6 = [5, 'b', 'c'];
    list6.insertAll(1, list5);
    print(r"[5,'b','c']  在下标为 1 插入list5 所有元素:   " + list6.toString());

    List<String> list7 = ["a", "a", "a"];
    List<String> list8 = ["b", "b"];
    list7.addAll(list8);
    print("list7 合并 list8 元素:   $list7");

    List list9 = ['a', 'b', 'c', 'd', 1, 2, 3];
    list9.remove('a');
    print(r'精确删除 a 元素:   ' + list9.toString());

    List list10 = ['a', 'b', 'c', 'd', 1, 2, 3];
    list10.removeAt(3);
    print(r'删除下标为3的元素:   ' + list10.toString());

    List list11 = ['a', 'b', 'c', 'd', 1, 2, 3];
    list11.removeRange(0, 2); //删除索引从0-2的元素 含头不含尾
    print('删除索引从0-2的元素 含头不含尾:    $list11');
    list11.removeWhere((element) {
      return element == 1;
    }); //根据条件 筛选，这里表示删除元素值为1的元素
    print('条件筛选删除值为1的元素:   $list11');
    list11.removeWhere((element) => element == 2); //条件只有一个表达式时，可以用箭头函数简化写法
    print('条件筛选删除值为2的元素(简化版写法):   $list11');

    List<int> list12 = [1, 2, 3, 4, 5, 6];
    list12.retainWhere((element) => (element > 3));
    print('条件筛选>3的值返回,会修改原数组:   $list12');

    List list13 = [1, 2, 3, 4, 5, 6, 7, 8];
    list13.where((element) => (element > 5));
    print('条件筛选>3的值返回,会修改原数组:   $list13');

    List list14 = ['a', 'b', 'c', 'd', 1, 2, 3];
    //从索引0处开始查找指定元素，返回指定元素的索引
    print('精确搜索元素2对应的索引值:    ${list14.indexOf(2)}');
    //从索引3处开始查找指定元素，如果存在返回元素索引，否则返回-1
    print('精确搜索元素a对应的索引值,从索引3处开始查找:    ${list14.indexOf('a', 3)}');
    //判断list元素中是否有任何一个元素满足给定的条件，如果满足返回true 否则false
    bool result = list14.contains("d");
    print('非for循环方式,判断指定元素是否在list集合内:    $result');

    List<int> list15 = [1, 2, 3, 4, 5, 6, 7, 8];
    List<int> list16 = list15.sublist(1); //从指定索引截取List
    List<int> list17 = list15.sublist(1, 3); //从指定索引截取List  含头不含尾
    print('从索引 1 截取,返回新List:    $list16');
    print('从索引 1 到索引3 截取,返回新List(不包含索引3的元素):    $list17');

    List list18 = ['a', 'b', 'c', 'd', 1, 2, 3];
    String join = list18.join(',');
    print('用 , 号,将集合的元素拼接,返回字符串:   $join');
  }

  ///map是将key和value相关联的对象，key和value都可以是任何类型的对象，并且key是唯一的如果key重复后面添加的key会替换前面的
  void _mapType() {
    print('------------------mapType---------------------------');

    ///Map初始化
    Map names = {'xiaoming': '小明', 'xiaohong': '小红'};
    print('Map 初始化1 :    $names');
    //Map ages = {};
    Map ages = new Map();
    ages['xiaoming'] = 16;
    ages['xiaohong'] = 18;
    print('Map 初始化2 :    $ages');

    print(names['xiaoming']); //获取姓名
    print(names.keys); //获取所有的key： (name, age)  toList可以转化为数组
    print(names.values); //获取所有的内容: (张三, 102)    toList可以转化为数组
    print('map 是否为空:   $names.isEmpty'); //是否为空:  false
    print('map 是否不为空:   $names.isNotEmpty'); //是否不为空:   true
    print('map 集合长度:   ${names.length}'); //map集合长度

    Map map1=new Map();
    map1.addAll({
      "张三":"18",
      "李四":"20",
      "王五":"50"
    });
    print("添加多个元素:   $map1");
    map1.remove("张三");
    print('删除元素:   $map1');

    print('判断map是否包含叫 李四 的元素:   ${map1.containsKey("李四")}');

    print('------------------map遍历---------------------------');
    ///Map遍历
    ages.forEach((k, v) {
      print(' forEach方式   key:  $k    value:   $v');
    });
    Map ages2 = ages.map((k, v) {
      //迭代生成一个新Map
      return MapEntry(v, k);
    });
    print('key,value 交换,重新生成map   $ages2');
    for (var key in ages.keys) {
      print(' for方式   key:  $key   value:   ${ages[key]}');
    }

  }

  ///科普小知识：dynamic、var、Object三者的区别
  ///dynamic：是所有Dart对象的基础类型， 在大多数情况下，通常不直接使用它，
  ///通过它定义的变量会关闭类型检查，这意味着 dynamic x = 'hal';x.foo();
  ///这段代码静态类型检查不会报错，但是运行时会crash，因为x并没有foo()方法，所以建议大家在编程时不要直接使用dynamic；
  ///var：是一个关键字，意思是“我不关心这里的类型是什么。”，系统会自动推断类型runtimeType；
  ///Object：是Dart对象的基类，当你定义：Object o=xxx；时这时候系统会认为o是个对象，你可以调用o的toString()和hashCode()方法
  ///因为Object提供了这些方法，但是如果你尝试调用o.foo()时，静态类型检查会进行报错；
  ///综上不难看出dynamic与Object的最大的区别是在静态类型检查上；
  void _tips() {
    print('------------------tips---------------------------');

    dynamic x = 'hal';
    print(x.runtimeType);
    print(x);
    x = 123;
    print(x);
    print(x.runtimeType);
    var a = 'hal';
    //a = 123;//你可以改变 x的类型，但是无法改变 a的类型
    print(a.runtimeType);
    print(a);
    Object o1 = '11';
    print(o1.runtimeType);
    print(o1);
  }
}
