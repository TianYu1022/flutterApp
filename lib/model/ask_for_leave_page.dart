import 'package:flutter/material.dart';
import 'package:number1/model/theme_colors.dart';

import 'bottom_dialog.dart';

///请假页面
class AskForLeavePage extends StatefulWidget {
  @override
  _AskForLeaveState createState() => _AskForLeaveState();
}

class _AskForLeaveState extends State<AskForLeavePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset("assets/images/ic_back.png"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "请假",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ThemeColors.color333333),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: AskForLeavePageContent(),
      ),
    );
  }
}

class AskForLeavePageContent extends StatefulWidget {
  @override
  _AskForLeavePageContentState createState() => _AskForLeavePageContentState();
}

class _AskForLeavePageContentState extends State<AskForLeavePageContent> {
  ///通过TextEditingController获取当前输入的内容
  final _inputText = TextEditingController();

  var options = ["病假", "婚假", "产假"];
  var listIf = ["是", "否"];

  var askForLeaveTypeStr = "请假类型";
  var canSelfOrder = "是否可接自己返修单";
  var startTime = "开始时间";
  var endTime = "结束时间";
  var duration = "时长(天)";
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                child: const Text(
                  "请假事由",
                  style:
                      TextStyle(fontSize: 16, color: ThemeColors.color333333),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                height: 200,
                margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: const BorderDirectional(
                      top: BorderSide(
                          width: 0.5,
                          style: BorderStyle.solid,
                          color: ThemeColors.color999999),
                      bottom: BorderSide(
                          width: 0.5,
                          style: BorderStyle.solid,
                          color: ThemeColors.color999999),
                      start: BorderSide(
                          width: 0.5,
                          style: BorderStyle.solid,
                          color: ThemeColors.color999999),
                      end: BorderSide(
                          width: 0.5,
                          style: BorderStyle.solid,
                          color: ThemeColors.color999999),
                    ),
                    color: Colors.white),
                // color: Colors.red,
                constraints:
                    BoxConstraints(maxHeight: 200, maxWidth: double.infinity),
                child: TextField(
                  focusNode: focusNode,
                  controller: _inputText,
                  onChanged: (str) {
                    print("输入了: $str");
                  },

                  ///输入完成时回调
                  onEditingComplete: () {
                    print("onEditingComplete");
                  },

                  ///点击键盘回车时的回调并获取当前输入的内容
                  onSubmitted: (str) {
                    print("onSubmitted : ${_inputText.text}");
                  },

                  ///maxlines默认值是个1 所以如果想换行输入需要置为null
                  maxLines: null,
                  cursorRadius: Radius.circular(8),
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.start,
                  autofocus: false,
                  decoration: const InputDecoration(
                    ///是否填充
                    //filled: true,

                    ///获得焦点时的边框样式
                    //   focusedBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(4),
                    //       borderSide: BorderSide(
                    //           width: 0.5,
                    //           style: BorderStyle.solid,
                    //           color: ThemeColors.color999999)),
                    focusedBorder: InputBorder.none,

                    ///默认提示问题
                    hintText: "请输入请假事由，文字100字以内",

                    ///提示问题颜色
                    hintStyle:
                        TextStyle(fontSize: 14, color: ThemeColors.color999999),

                    ///输入文字颜色
                    labelStyle:
                        TextStyle(fontSize: 14, color: ThemeColors.color333333),
                    border: InputBorder.none,

                    ///边框样式
                    // border: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(4),
                    //     borderSide: BorderSide(
                    //         width: 0.5,
                    //         style: BorderStyle.solid,
                    //         color: ThemeColors.color999999))
                  ),
                ),
              ),
              ColoredBox(
                color: ThemeColors.colorF5F6F8,
                child: SizedBox(
                  width: double.infinity,
                  height: 8,
                ),
              ),

              ///GestureDetector可点击组件
              ///
              ///请假类型
              GestureDetector(
                onTap: () {
                  ///使输入框失去焦点
                  focusNode.unfocus();
                  BottomDialog.showBasicModalBottomSheet(context, options,
                      pressed: (str) {
                    ///更新状态
                    setState(() {
                      askForLeaveTypeStr = str;
                      print("请假类型：$str");
                    });
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          child: Text(
                            askForLeaveTypeStr,
                            style: TextStyle(
                                fontSize: 14, color: ThemeColors.color333333),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        flex: 4,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: <Widget>[
                            Text(
                              "请选择",
                              style: TextStyle(
                                  fontSize: 14, color: ThemeColors.color999999),
                            ),
                            Image.asset("assets/images/ic_right_back.png"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ColoredBox(
                color: ThemeColors.colorF5F6F8,
                child: SizedBox(
                  width: double.infinity,
                  height: 8,
                ),
              ),

              ///InkWell 可点击组件
              ///是否可以自接单  todo 有个问题 把有状态的组件抽取出来后，状态没有更新
              InkWell(
                onTap: _onClickListener,
                child: TitleProvider(
                    title: canSelfOrder, child: AskForLeaveItem()),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                color: ThemeColors.colorF5F6F8,
                child: SizedBox(
                  width: double.infinity,
                  height: 0.8,
                ),
              ),

              ///开始时间
              GestureDetector(
                onTap: () {
                  BottomDialog.showBasicModalBottomSheet(context, [
                    "2022年2月14日",
                    "2022年2月15日",
                    "2022年2月16日",
                    "2022年2月17日"
                  ], pressed: (str) {
                    setState(() {
                      startTime = str;
                    });
                  });
                },
                child:
                    TitleProvider(title: startTime, child: AskForLeaveItem()),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                color: ThemeColors.colorF5F6F8,
                child: SizedBox(
                  width: double.infinity,
                  height: 0.8,
                ),
              ),

              ///结束时间
              GestureDetector(
                onTap: () {
                  BottomDialog.showBasicModalBottomSheet(context, [
                    "2022年2月14日",
                    "2022年2月15日",
                    "2022年2月16日",
                    "2022年2月74日"
                  ], pressed: (str) {
                    setState(() {
                      endTime = str;
                    });
                  });
                },
                child: TitleProvider(title: endTime, child: AskForLeaveItem()),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                color: ThemeColors.colorF5F6F8,
                child: SizedBox(
                  width: double.infinity,
                  height: 0.8,
                ),
              ),

              ///时长
              GestureDetector(
                onTap: () {
                  BottomDialog.showBasicModalBottomSheet(
                      context, ["1天", "2天", "3天", "4天", "5天", "6天"],
                      pressed: (str) {
                    setState(() {
                      duration = str;
                    });
                  });
                },
                child: TitleProvider(title: duration, child: AskForLeaveItem()),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                color: ThemeColors.colorF5F6F8,
                child: SizedBox(
                  width: double.infinity,
                  height: 0.8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///是否可接自己返修单点击事件
  void _onClickListener() {
    BottomDialog.showBasicModalBottomSheet(context, listIf, pressed: (str) {
      setState(() {
        canSelfOrder = str;
      });
    });
  }
}

class AskForLeaveItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mTitle = TitleProvider.of(context).title;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Align(
              child: Text(
                mTitle,
                style: TextStyle(fontSize: 14, color: ThemeColors.color333333),
              ),
              alignment: Alignment.centerLeft,
            ),
            flex: 4,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              children: <Widget>[
                Text(
                  "请选择",
                  style:
                      TextStyle(fontSize: 14, color: ThemeColors.color999999),
                ),
                Image.asset("assets/images/ic_right_back.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///需要传递的数据 包括点击事件 BLoC最简单的用法
class TitleProvider extends InheritedWidget {
  final String title;

  const TitleProvider({
    required this.title,
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static TitleProvider of(BuildContext context) {
    final TitleProvider? result =
        context.dependOnInheritedWidgetOfExactType<TitleProvider>();
    assert(result != null, 'No CounterProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TitleProvider old) {
    return true;
  }
}
