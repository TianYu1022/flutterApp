import 'package:flutter/material.dart';
import 'package:number1/demo/bolc/application_bloc.dart';
import 'package:number1/demo/bolc/bloc_provider.dart';
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
import '../demo/alert_dialog_demo.dart';
import '../demo/animation/animation_demo.dart';
import '../demo/bolc/bloc_demo.dart';
import '../demo/bottom_sheet_demo.dart';
import '../demo/button_demo.dart';
import '../demo/camera/camera_demo.dart';
import '../demo/checkbox_demo.dart';
import '../demo/chip_demo.dart';
import '../demo/click_button_demo.dart';
import '../demo/data_table_demo.dart';
import '../demo/date_demo.dart';
import '../demo/floating_action_button_demo.dart';
import '../demo/flexible/geeksfor_geeks.dart';
import '../demo/flexible/geeksfor_geeks1.dart';
import '../demo/flexible/geeksfor_geeks2.dart';
import '../demo/http/http_demo.dart';
import '../demo/read_more_text_demo.dart';
import '../test/home_page.dart';
import 'ask_for_leave_page.dart';

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
          ListItem(title: "AskForLeavePage", page: AskForLeavePage()),
          ListItem(title: "Home", page: Home()),

          ListItem(
              title: "CameraDemo",
              page: CameraDemo(title: 'Image Picker Example')),

          ListItem(title: "ReadMoreTextDemo", page: ReadMoreTextDemo()),

          ListItem(title: "GeeksforGeeks2 响应式不超出屏幕", page: GeeksforGeeks2()),
          ListItem(title: "GeeksforGeeks1", page: GeeksforGeeks1()),
          ListItem(title: "GeeksforGeeks", page: GeeksforGeeks()),

          // BlocProvider(bloc: ApplicationBloc(), child: ListItem(title: "ClickButtonDemo 可点击控件", page: const ClickButtonDemo())),
          ListItem(
              title: "ClickButtonDemo 可点击控件",
              page: BlocProvider(
                  bloc: ApplicationBloc(), child: const ClickButtonDemo())),

          ListItem(title: "测试各种控件摆放位置", page: HomePage()),

          ListItem(title: "AnimationDemo 动画", page: AnimationDemo()),

          ListItem(title: "HttpDemo 网络请求列表", page: HttpDemo()),

          ListItem(title: "BlocDemo BLoC响应式编程", page: BlocDemo()),

          ListItem(title: "RxDatrDemo", page: RxDatrDemo()),

          ListItem(title: "StreamDemo", page: StreamDemo()),
          ListItem(title: "StateManagementDemo", page: StateManagementDemo()),
          ListItem(
              title: "StateManagementLessDemo",
              page: StateManagementLessDemo()),

          ///-------------------------------- Material风格组件 --------------------------------
          ListItem(title: "StepperDemo 步骤组件", page: StepperDemo()), //步骤
          ListItem(title: "CardDemo 卡片布局", page: CardDemo()),
          ListItem(
              title: "PaginatedDataTableDemo 分页显示表格数据",
              page: PaginatedDataTableDemo()), //分页显示表格数据
          ListItem(title: "DataTableDemo 数据表格", page: DataTableDemo()), //数据表格
          ListItem(title: "ChipDemo label 控件", page: ChipDemo()), //label 控件
          ListItem(
              title: "ExpansionPanelDemo 收缩面板",
              page: ExpansionPanelDemo()), //收缩面板
          ListItem(title: "SnackBarDemo 提示操作栏", page: SnackBarDemo()), //提示操作栏
          ListItem(
              title: "BottomSheetDemo 底部可滑动弹窗",
              page: BottomSheetDemo()), //底部可滑动弹窗
          ListItem(
              title: "AlertDialogDemo 提示对话框", page: AlertDialogDemo()), //提示对话框
          ListItem(title: "SimpleDialogDemo", page: SimpleDialogDemo()),
          ListItem(title: "DateDemo", page: DateDemo()),
          ListItem(title: "SliderDemo", page: SliderDemo()),
          ListItem(title: "SwitchDemo", page: SwitchDemo()),
          ListItem(title: "RadioDemo", page: RadioDemo()),
          ListItem(title: "CheckboxDemo", page: CheckboxDemo()),
          ListItem(title: "FromDemo", page: FromDemo()), //表单
          ListItem(title: "ButtonDemo", page: ButtonDemo()),
          ListItem(
              title: "FloatingActionButton", page: FloatingActionButtonDemo()),
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
