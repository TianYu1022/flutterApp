import 'package:flutter/material.dart';
import 'package:number1/demo/card_demo.dart';
import 'package:number1/demo/expansion_panel.dart';
import 'package:number1/demo/form_demo.dart';
import 'package:number1/demo/paginated_data_table_demo.dart';
import 'package:number1/demo/popup_menu_button_demo.dart';
import 'package:number1/demo/radio_demo.dart';
import 'package:number1/demo/rxdart/rxdate_demo.dart';
import 'package:number1/demo/simple_dialog_demo.dart';
import 'package:number1/demo/slider_demo.dart';
import 'package:number1/demo/snack_bar_demo.dart';
import 'package:number1/demo/state/state_management_demo.dart';
import 'package:number1/demo/stepper_demo.dart';
import 'package:number1/demo/stream/stream_demo.dart';
import 'package:number1/demo/state/state_management_less_demo.dart';
import 'package:number1/demo/switch_demo.dart';
import 'package:number1/main.dart';
import 'alert_dialog_demo.dart';
import 'animation/animation_demo.dart';
import 'bolc/bloc_demo.dart';
import 'bottom_sheet_demo.dart';
import 'button_demo.dart';
import 'checkbox_demo.dart';
import 'chip_demo.dart';
import 'data_table_demo.dart';
import 'date_demo.dart';
import 'floating_action_button_demo.dart';
import 'http/http_demo.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MaterialComponents"),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(title: "Home", page: Home()),

          ListItem(title: "AnimationDemo", page: AnimationDemo()),

          ListItem(title: "HttpDemo", page: HttpDemo()),

          ListItem(title: "BlocDemo", page: BlocDemo()),

          ListItem(title: "RxDatrDemo", page: RxDatrDemo()),

          ListItem(title: "StreamDemo", page: StreamDemo()),
          ListItem(title: "StateManagementDemo", page: StateManagementDemo()),
          ListItem(title: "StateManagementLessDemo", page: StateManagementLessDemo()),
          ///-------------------------------- Material风格组件 --------------------------------
          ListItem(title: "StepperDemo", page: StepperDemo()), //步骤
          ListItem(title: "CardDemo", page: CardDemo()),
          ListItem(title: "PaginatedDataTableDemo", page: PaginatedDataTableDemo()), //分页显示表格数据
          ListItem(title: "DataTableDemo", page: DataTableDemo()), //数据表格
          ListItem(title: "ChipDemo", page: ChipDemo()), //label 控件
          ListItem(title: "ExpansionPanelDemo", page: ExpansionPanelDemo()), //收缩面板
          ListItem(title: "SnackBarDemo", page: SnackBarDemo()), //提示操作栏
          ListItem(title: "BottomSheetDemo", page: BottomSheetDemo()), //底部可滑动弹窗
          ListItem(title: "AlertDialogDemo", page: AlertDialogDemo()), //提示对话框
          ListItem(title: "SimpleDialogDemo", page: SimpleDialogDemo()),
          ListItem(title: "DateDemo", page: DateDemo()),
          ListItem(title: "SliderDemo", page: SliderDemo()),
          ListItem(title: "SwitchDemo", page: SwitchDemo()),
          ListItem(title: "RadioDemo", page: RadioDemo()),
          ListItem(title: "CheckboxDemo", page: CheckboxDemo()),
          ListItem(title: "FromDemo", page: FromDemo()), //表单
          ListItem(title: "ButtonDemo", page: ButtonDemo()),
          ListItem(title: "FloatingActionButton", page: FloatingActionButtonDemo()),
          ListItem(title: "PopupMenuButtonDemo", page: PopupMenuButtonDemo()),
        ],
      ),
    );
  }
}

///列表视图
class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({required this.title, required this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}
