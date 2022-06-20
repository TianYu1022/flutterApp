import 'dart:convert';
import 'package:flutter/material.dart';

import 'log_utils.dart';

/// json 格式转化工具类

class JsonUtils {
  /// 单纯的Json格式输出打印
  static void printJson(Object object) {
    try {
      JsonEncoder encoder = const JsonEncoder.withIndent('  ');
      var encoderString = encoder.convert(object);
      LogUtils.i(encoderString, tag: "json:");
    } catch (e) {
      LogUtils.e(e, tag: "json:");
    }
  }

  /// 单纯的Json格式输出打印
  static void printJsonEncode(Object object) {
    try {
      var encoderString = json.encode(object);
      LogUtils.i(encoderString, tag: "json:");
    } catch (e) {
      LogUtils.e(e, tag: "json:");
    }
  }

  /// 将对象[值]转换为JSON字符串
  /// Converts object [value] to a JSON string.
  static String? encodeObj(dynamic value) {
    return value == null ? null : json.encode(value);
  }

  /// 转换JSON字符串到对象s
  /// Converts JSON string [source] to object.
  static T? getObj<T>(String source, T Function(Map v) f) {
    if (source.isEmpty) return null;
    try {
      Map map = json.decode(source);
      return f(map);
    } catch (e) {
      debugPrint('JsonUtils convert error, Exception：${e.toString()}');
    }
    return null;
  }

  /// 转换JSON字符串或JSON映射[源]到对象
  /// Converts JSON string or JSON map [source] to object.
  static T? getObject<T>(dynamic source, T Function(Map v) f) {
    if (source == null || source.toString().isEmpty) return null;
    try {
      Map map;
      if (source is String) {
        map = json.decode(source);
      } else {
        map = source;
      }
      return f(map);
    } catch (e) {
      debugPrint('JsonUtils convert error, Exception：${e.toString()}');
    }
    return null;
  }

  /// 转换JSON字符串列表[源]到对象列表
  /// Converts JSON string list [source] to object list.
  static List<T>? getObjList<T>(String source, T Function(Map v) f) {
    if (source.isEmpty) return null;
    try {
      List list = json.decode(source);
      return list.map((value) {
        if (value is String) {
          value = json.decode(value);
        }
        return f(value);
      }).toList();
    } catch (e) {
      debugPrint('JsonUtils convert error, Exception：${e.toString()}');
    }
    return null;
  }

  /// 转换JSON字符串或JSON映射列表[源]到对象列表
  /// Converts JSON string or JSON map list [source] to object list.
  static List<T>? getObjectList<T>(dynamic source, T Function(Map v) f) {
    if (source == null || source.toString().isEmpty) return null;
    try {
      List list;
      if (source is String) {
        list = json.decode(source);
      } else {
        list = source;
      }
      return list.map((value) {
        if (value is String) {
          value = json.decode(value);
        }
        return f(value);
      }).toList();
    } catch (e) {
      debugPrint('JsonUtils convert error, Exception：${e.toString()}');
    }
    return null;
  }

  /// get List
  static List<T>? getList<T>(dynamic source) {
    List list;
    if (source is String) {
      list = json.decode(source);
    } else {
      list = source;
    }
    return list.map((v) {
      return v as T;
    }).toList();
  }

  /// [object]  解析的对象
  /// [deep]  递归的深度，用来获取缩进的空白长度
  /// [isObject] 用来区分当前map或list是不是来自某个字段，则不用显示缩进。单纯的map或list需要添加缩进
  static String toJson(dynamic object, {int deep = 0, bool isObject = false}) {
    var buffer = StringBuffer();
    var nextDeep = deep + 1;
    if (object is Map) {
      var list = object.keys.toList();
      if (!isObject) {
        //如果map来自某个字段，则不需要显示缩进
        buffer.write(getDeepSpace(deep));
      }
      buffer.write("{");
      if (list.isEmpty) {
        //当map为空，直接返回‘}’
        buffer.write("}");
      } else {
        buffer.write("\n");
        for (int i = 0; i < list.length; i++) {
          buffer.write("${getDeepSpace(nextDeep)}\"${list[i]}\":");
          buffer.write(toJson(object[list[i]], deep: nextDeep, isObject: true));
          if (i < list.length - 1) {
            buffer.write(",");
            buffer.write("\n");
          }
        }
        buffer.write("\n");
        buffer.write("${getDeepSpace(deep)}}");
      }
    } else if (object is List) {
      if (!isObject) {
        //如果list来自某个字段，则不需要显示缩进
        buffer.write(getDeepSpace(deep));
      }
      buffer.write("[");
      if (object.isEmpty) {
        //当list为空，直接返回‘]’
        buffer.write("]");
      } else {
        buffer.write("\n");
        for (int i = 0; i < object.length; i++) {
          buffer.write(toJson(object[i], deep: nextDeep));
          if (i < object.length - 1) {
            buffer.write(",");
            buffer.write("\n");
          }
        }
        buffer.write("\n");
        buffer.write("${getDeepSpace(deep)}]");
      }
    } else if (object is String) {
      //为字符串时，需要添加双引号并返回当前内容
      buffer.write("\"$object\"");
    } else if (object is num || object is bool) {
      //为数字或者布尔值时，返回当前内容
      buffer.write(object);
    } else {
      //如果对象为空，则返回null字符串
      buffer.write("null");
    }
    return buffer.toString();
  }

  ///获取缩进空白符
  static String getDeepSpace(int deep) {
    var tab = StringBuffer();
    for (int i = 0; i < deep; i++) {
      tab.write("\t");
    }
    return tab.toString();
  }
}
