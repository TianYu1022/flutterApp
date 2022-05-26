import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../assets/style/color.dart';

void showToast({
  required String msg,
  String? time, // 时间长短
  String? position, // 位置
  double fontSize = 14,
  bgColor,
  textColor,
}) {
  var gravity = ToastGravity.CENTER;
  if(position == 'top') {
    gravity = ToastGravity.TOP;
  } else if(position == 'top_left') {
    gravity = ToastGravity.TOP_LEFT;
  } else if(position == 'top_right') {
    gravity = ToastGravity.TOP_RIGHT;
  } else if(position == 'center_left') {
    gravity = ToastGravity.CENTER_LEFT;
  } else if(position == 'center_right') {
    gravity = ToastGravity.CENTER_RIGHT;
  } else if(position == 'bottom') {
    gravity = ToastGravity.BOTTOM;
  } else if(position == 'bottom_left') {
    gravity = ToastGravity.BOTTOM_LEFT;
  } else if(position == 'bottom_right') {
    gravity = ToastGravity.BOTTOM_RIGHT;
  }

  Fluttertoast.showToast(
    msg: msg,
    toastLength: time == 'long' ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
    gravity: gravity,
    fontSize: fontSize,
    backgroundColor: bgColor ?? Color(0x90000000) ,
    textColor: textColor
  );
}

cancelToast() {
  Fluttertoast.cancel();
}

showModal({
  context,
  bool? showIcon,
  bool showCancelBtn = false,
  bool showConfirmBtn = true,
  String title = '提示',
  String content = '',
  dynamic? titleStyle,
  String? contentStyle,
  String confirmBtnText = '确认',
  String cancelBtnText = '取消',
  dynamic confirmBtnStyle,
  dynamic cancelBtnStyle
}) {
  // var other = {'left': '888'};
  // assert(other['left'] == '88');
  // var obg = Map<String, String>();
  // print('--------obg }');

  var titleAlign = TextAlign.left;
  var contentAlign = TextAlign.left;
  // if(titleStyle.textAlign == 'center') {
  //   titleAlign = TextAlign.center;
  // } else if(titleStyle.textAlign == 'right') {
  //   titleAlign = TextAlign.right;
  // }
  // if(contentStyle.textAlign == 'center') {
  //   contentAlign = TextAlign.center;
  // } else if(contentStyle.textAlign == 'right') {
  //   contentAlign = TextAlign.right;0
  // }
  showDialog(
    context: context,
    builder: (build) {
      return AlertDialog(
        title: Text(
          title,
          textAlign: titleAlign
        ),
        content: Text(
          content,
          textAlign: contentAlign
        ),
        actions: <Widget>[
          Offstage(
            offstage: !showConfirmBtn,
            child: Container(
              width: showCancelBtn ? 13/0.1 : double.infinity,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(TColor.blueColor)
                ),
                child: Text(confirmBtnText,
                  style: TextStyle(color: Colors.white)
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            )
          ),
          Offstage(
            offstage: !showCancelBtn,
            child: Container(
              width: showConfirmBtn ? 13/0.1 : double.infinity,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  side: MaterialStateProperty.all(BorderSide(color: TColor.borderColor)),
                ),
                child: Text(cancelBtnText,
                  style: TextStyle(color: TColor.ashColor)
                ),
                onPressed: () {
                  //关闭 返回true
                  Navigator.of(context).pop(true);
                },
              ),
            )
          )
        ],
      );
    }
  );
}