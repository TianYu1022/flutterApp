## 我的 Flutter 项目

[GitHub地址](git@github.com:TianYu1022/flutterApp.git)

[GitHub地址](https://github.com/TianYu1022/flutterApp)

- ## 2022.05.16

  ```
  创建仓库 提交代码 开始Flutter
  ```

- ## 2022.05.17

  ```csharp
  Drawer //侧滑抽屉 
  BottomNavigationBar //底部导航栏 
  Container //容器 
  Row //横向容器
  ```

- ## 2022.05.18

  ```csharp
  Column & Row (CSS 中 Flexbox)
  mainAxisAlignment //主轴 MainAxisAlignment.spaceBetween
  crossAxisAlignment //交叉轴 CrossAxisAlignment.stretch
  SizedBox() //可设置尺寸盒子
  alignment(0.0, 0.0) //对齐
  Stack //一摞widget children 中 Positioned() 可设置宽高
  AspectRatio() //宽高比 aspectRatio: 16.0 / 9.0
  ConstrainedBox //可设置最大 最小 宽高的 盒子 constraints: BoxConstraints(maxHeight: 200.0, maxWidth: 200.0)
  ```

  ```csharp
  CustomScrollView
  SliverList  
  SliverGrid
  ```

  ```csharp
  PageView //页面视图 PageController// 做一些设置
  GridView.count //scrollDirection: Axis.horizontal 滚动方式
  GridView.extent //网格布局创建的另一种方式
  ```

- ## 2022.05.19

  ```csharp
  routes: {"/about": (context) => PageDemo(title: "pushNamed 跳转")} //路由
  Navigator.pushNamed(context, "/about");
  initialRoute: "/",
  routes: {
     "/": (context) => NavigationDemo(),
       "/about": (context) => PageDemo(title: "pushNamed 跳转")
     }
  InkWell // 溅墨效果
  TextField //输入框
  TextEditingController //控制器
  Form //表单
  ScaffoldMessenger //弹框
  ```

- ## 2022.5.20

  ```csharp
  ListTile
  FloatingActionButton FloatingActionButton.extended //悬浮按钮
  BottomAppBar //底部工具栏
  ```

- ## 2022.05.21

  ```csharp
  ElevatedButton TextButton 
  OulineButton//描边按钮 
  Expanded//比例分配 
  ButtonBar 
  PopupMenuButton//弹出式菜单按钮
  Checkbox//复选框
  CheckboxListTile//带文字图标的复选框
  Radio//单选框
  RadioListTile//带文字图标的单选框
  Switch//开关
  SwitchListTile//带文字图标的开关
  Slider//滑动选择器
  ```

  #### [安装第三方包](https://pub.dev/)

  ```csharp
  //flutter异步程序
  Future<void> _selectTime() async {
    var timeOfDay =
        await showTimePicker(context: context, initialTime: selectedTime);
  
    if (timeOfDay == null) return;
  
    setState(() {
      selectedTime = timeOfDay;
    });
  }
  ```

  ```csharp
  SimpleDialog //对话框
  AlertDialog //提示对话框
  BottomSheet //底部可滑动弹窗
  showModalBottomSheet //不可点击其他区域底部可滑动弹窗
  SnackBar //底部提示
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Processing..."),
              action: SnackBarAction(
                label: "OK",
                onPressed: () {},
              ),
            ));
          }
  ExpansionPanel //收缩面板
  ```

  ```csharp
  Chip //label 小组件
  Wrap //包裹后不会超出屏幕
  Divider //分割线
  DataTableDemo //数据表格
  ```