/// 面试对象学习

class Student extends Person {
  //变量的定义
  String _school; //通过下划线来标识私有字段（变量）
  String city;
  String country;
  String name;
  static Student instance;

  ///构造方法
  ///this.school初始化自有参数
  ///name,age交给父类进行初始化
  ///city为可选参数
  ///country设有默认参数(默认参数属于可选参数)
  ///(可选参数要放在最后,且用{}包起来)
  Student(this._school, String name, int age,
      {this.city, this.country = 'china'})
      //:super(name, age);
      //初始化列表 (构造器的 : )  除了调用父类构造器，在子类构造器方法体之前，你也可以初始化实例变量，不同的初始化变量之间用逗号分隔开
      : name = '$country  $city',
        //如果父类没有默认构造方法（无参构造方法），则需要在初始化列表中调用父类构造方法进行初始化
        super(name, age) {
    //构造方法体不是必须的,这里演示一下怎么使用
    print('构造方法体不是必须的');
  }

  ///命名构造方法：[类名.方法名]
  ///使用命名构造方法为类实现多个构造方法
  ///注意要跟原来Student继承Person一样对弗雷的构造方法初始化
  Student.cover(Student stu) : super(stu.name, stu.age) {
    //命名构造方法同样有构造方法体
    print('命名构造方法');
  }

  ///命名工厂构造方法  factory [类名.方法名]
  ///场景:  网络请求返回的数据转换成模型
  ///它可以有返回值，而且不需要将类的final变量作为参数，是提供一种灵活获取类对象的方式。
  factory Student.stu(Student stu) {
    return Student(stu._school, stu.name, stu.age,
        city: stu.city, country: stu.country);
  }

  //可以为私有字段设置getter来让外界获取到私有字段
  // ignore: unnecessary_getters_setters
  String get school => _school;

  //可以为私有字段设置setter来控制外界对私有字段的修改
  // ignore: unnecessary_getters_setters
  set school(String value) {
    _school = value;
  }
}

/// Dart 类,所有类都继承自Object
class Person {
  String name;
  int age;

  ///标准的构造方法
  Person(this.name, this.age);
}

///  工厂构造方法演示
class Logger {
  static Logger _cache;

  ///  工厂构造方法：
  ///  不仅仅是构造方法，更是一种模式
  ///  有时候为了返回一个之前已经创建的缓存对象，原始的构造方法已经不能满足要求
  ///  那么可以使用工厂模式来定义构造方法
  factory Logger() {
    if (_cache == null) {
      _cache = Logger._internal();
    }
    /// 不管创建多少个Logger return 返回的是同一个对象,
    /// 因此我们也可以看作是单例
    return _cache;
  }
  //命名构造函数
  Logger._internal();

  void log(String msg) {
    print(msg);
  }
}
