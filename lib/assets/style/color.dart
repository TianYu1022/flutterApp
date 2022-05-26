/*
 * @author: wanglin 
 * @since: 2022-04-26 10:56:19 
 * @desc: 全局颜色 
 * @remark: 相关备注 
 */
// import 'dart:ui' show Color;
import 'package:flutter/painting.dart';
// import 'package:management_cockpit/utils/tools.Dart';
// 颜色类
class TColor {
  TColor._();
  // 主文字颜色，用于页面标题/重要信息
  static const Color baseColor = Color(0xFF1E346A);
  // 副文字颜色，用于常规信息/辅助信息/次要信息
  static const Color grayColor = Color(0xFF96A6B7);
  // 暗文字色，用于暗文字/失效文字
  static const Color mutedColor = Color(0xFFBFBFBF);
  // 暗文字色，用于暗文字/失效文字
  static const Color ashColor = Color(0xFF8AA6C1);
  // 主体蓝色
  static const Color blueColor = Color(0xFF4870FF);
  // 边框，阴影颜色
  static const Color borderColor = Color(0xFFEAEEF1);
  // 页面背景色
  static const Color compColor = Color(0xFFF0F3FB);
  // 按钮禁用
  static const Color btnGrayColor = Color(0xFFD8D8E2);
}