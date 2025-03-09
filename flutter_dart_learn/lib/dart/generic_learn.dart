import 'oop_learn.dart';

/// 泛型学习
/// 泛型方法
/// 泛型类

class TestGeneric {
  void start() {
    //泛型
    Cache<String> cache1 = Cache();
    cache1.setItem('cache1', '参数'); //泛型作用：类型检查约束类比：List<String>
    String? string1 = cache1.getItem('cache1');
    print(string1);

    Cache<int> cache2 = Cache();
    cache2.setItem('cache2', 10086);
    int? int1 = cache2.getItem('cache2');
    print(int1);

    Member<Student> member = Member(Student('', '', 20));
    print(member.fixedAge());
  }
}

///泛型：
///通俗理解：泛型主要是解决类、接口、方法的复用性、以及对不特定数据类型的支持

///泛型类
///泛型作用：提高代码服用度
class Cache<T> {
  final Map<String, T> _cached = Map();

  /// 泛型方法
  void setItem(String key, T value) {
    _cached[key] = value;
  }

  T? getItem(String key) {
    return _cached[key];
  }
}

///泛型限定
///有时候你在实现类似通用接口的泛型中，期望的类型是某些特定类型时，这时可以使用类型约束
class Member<T extends Person> {
  T _person;

  ///泛型作用：约束参数类型
  Member(this._person);

  String fixedAge() {
    return 'fixed:${_person.age}';
  }
}
