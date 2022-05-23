## 我的 Flutter 项目

[GitHub地址](https://github.com/TianYu1022/flutterApp)

# Material风格组件

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
  ListTile //带icon 标题 副标题 组件
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

- ## 2022.05.22

  ```csharp
  PaginatedDataTable //分页显示表格数据
  Card //卡片 默认原价4.0
  StepperDemo //步骤widget
  ```

  ```csharp
  ClipRRect( //子widget切圆角
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(4.0),
      topRight: Radius.circular(4.0)
    ,
    child: Image.network(post.imageUrl, fit: BoxFit.cover),
  )
  ```

# Flutter开发

- ## widget之间传递数据 StateManagementDemo & StateManagementLessDemo

  ```csharp
  InheritedWidget //直接把数据传递给需要的小部件 eg：StateManagementDemo
  ScopedModel //三方widget树传值
  ```

  [ScopedModel](https://pub.dev/packages/scoped_model)      [高版本flutter空安全设计后引用此包会报错，具体处理详见](https://stackoverflow.com/questions/64917744/cannot-run-with-sound-null-safety-because-dependencies-dont-support-null-safety)

- ## StreamDemo

  ```csharp
  stream //数据流forceRead
  ```

- ## [RxDart](https://pub.dev/packages/rxdart)

  ```csharp
  rx // Reactive Extensions 响应式编程中 加工处理数据的工具 eg：RxJava RxJs
  ```

- ## [BLoC开发架构](https://dzone.com/articles/how-to-develop-your-flutter-app-with-the-bloc-arch)

- ## [Http Dio](https://pub.dev/packages/dio)