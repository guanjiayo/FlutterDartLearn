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

  ///静态方法
  ///static 关键字修饰
  static doPrint(String str) {
    print('doPrint:$str');
  }

  @override
  String toString() {
    return 'name:$name school:${this._school},city:$city,country:$country ${super.toString()}';
  }
}

/// Dart 类,所有类都继承自Object
class Person {
  String name;
  int age;

  ///标准的构造方法
  Person(this.name, this.age);

  ///重写父类方法
  @override
  String toString() {
    return 'name:$name, age:$age';
  }
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

///-----------------抽象类--------------------

///继承抽象类要实现它的抽象方法，否则也需要将自己定义成抽象类
class StudyFlutter extends Study {
  @override
  void study() {
    print('Learning Flutter');
  }
}

///使用 abstract 修饰符来定义一个抽象类，该类不能被实例化。抽象类在定义接口的时候非常有用，实际上抽象中也包含一些实现
abstract class Study {
  void study();
}

class StudyChinese{
  String time;
}

///为类添加特征：mixins
///mixins 是在多个类层次结构中重用代码的一种方式

///mixins的特征：
///1. 继承 Object 类的子类(不能继承其他类)
///2. 不声明任何构造方法
///3. 不调用 super
/// Dart 类,所有类都继承自Object

///mixins 使用:
///在 with 关键字后面跟一个或多个 mixin 的名字(用逗号分开)，并且with要用在extends关键字之后

///场景: 符合mixins特征的类,使用了with的类,是不是就是能直接使用mixins特征类的一些实现方法或者属性之类的意思

class Test extends Person with Study,StudyChinese{
  Test(String name, int age) : super(name, age);

 @override
  void set time(String _time) {
    super.time = _time;
  }

  @override
  void study() {

  }

}




