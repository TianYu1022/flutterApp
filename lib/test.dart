import 'package:flutter/material.dart';

void main() {
  // testFunction(sex: "男");
  // C().a();
  // C().b();
  // TestFunction._fun2().user();
  // TestFunction.fun1();
}

class TestFunction {
  static void fun1() {}

  TestFunction._fun2() {
    initFun();
  }

  void initFun() {
    debugPrint("睚眦 => 初始化");
  }

  void user() {
    debugPrint("睚眦 => 初始化后使用");
  }
}

void testFunction({dynamic name, int? age = 18, required String? sex}) {
  debugPrint("name = $name    age = $age    sex = $sex");
  // testFuncatoin2(name as int);
}

void testFuncation1(name, int age, String sex) {
  debugPrint("name = $name    age = $age    sex = $sex");
}

void testFuncatoin2(int age) {
  debugPrint("testFuncatoin2 = $age");
}

class A {
  void a() {
    debugPrint("睚眦 => A");
  }
}

class B {
  void b() {
    debugPrint("睚眦 => B");
  }
}

///作为mixins的类只能继承自object，不能继承其他类
///作为mixins的类不能有构造函数
///一个类可以mixins多个mixins类
///mixins不是继承，也不是接口，而是一种全新特性
class C with A, B {}
