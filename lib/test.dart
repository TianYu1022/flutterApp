import 'package:flutter/material.dart';

void main() {
  testFunction(sex: "男");
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