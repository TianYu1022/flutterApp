**Scaffold是 Fl** **utter**中的一个类，它提供了许多小部件，可以说是 Drawer、SnackBar、 [**BottomNavigationBar**](https://www.geeksforgeeks.org/flutter-an-introduction-to-the-open-source-sdk-by-google/)、FloatingActionButton、AppBar 等 API。Scaffold[将](https://www.geeksforgeeks.org/introduction-to-apis/)扩展或占据整个设备屏幕。它将占用可用空间。Scaffold 将提供一个[框架](https://www.geeksforgeeks.org/software-framework-vs-library/)来实现应用程序的基本材料设计布局。 

### **类层次结构：** 

```
Object
 ↳ Diagnosticable
   ↳ Diagnosticable Tree
     ↳ Widget
       ↳ StateFul Widget
         ↳ Scaffold
```

### **Scaffold 类的构造函数：**

```
  const Scaffold({
    Key? key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
  }) : assert(primary != null),
       assert(extendBody != null),
       assert(extendBodyBehindAppBar != null),
       assert(drawerDragStartBehavior != null),
       super(key: key);
```

### **Scaffold 类的属性：** 

- **appBar：**显示一个水平条，主要放置在*Scaffold*的顶部。*appBar*使用小部件*AppBar*，它有自己的属性，如高度、标题、亮度等。 

```dart
Widget build(BuildContext context)
{
return Scaffold(
	appBar: AppBar(
	title: Text('GeeksforGeeks'),
	),
```

![应用栏示例](https://media.geeksforgeeks.org/wp-content/uploads/20191225231624/Screenshot_1576607980-169x300.png)

- **body：**它将显示脚手架中的主要或主要内容。它位于*appBar*下方和*floatingActionButton*下方。默认情况下，body 内的小部件位于左下角。 

```dart
Widget build(BuildContext context)
{
return Scaffold(
	appBar: AppBar(
	title: Text('GeeksforGeeks'),
	),
	body: Center(
	child: Text("Welcome to GeeksforGeeks!!!",
		style: TextStyle(
		color: Colors.black,
		fontSize: 40.0,
		),
	),
	),
```

在此示例中，显示了文本*Welcome to GeeksforGeeks!!!* 在Body里。使用*Center*小部件在页面中心显示了文本。对于文本样式，使用了*TextStyle*小部件。 


![身体例子](https://media.geeksforgeeks.org/wp-content/uploads/20191225232615/body-example-169x300.png)

- **floatingActionButton：** *FloatingActionButton*是默认放置在右下角的按钮。*FloatingActionButton*是一个图标按钮，它浮动在屏幕内容的固定位置。如果我们滚动页面，它的位置不会改变，它会被固定。 

```dart
Widget build(BuildContext context)
{
return Scaffold(
	appBar: AppBar(title: Text('GeeksforGeeks')),
	body: Center(
		child: Text("Welcome to GeeksforGeeks!!!",
		style: TextStyle(
			color: Colors.black,
			fontSize: 40.0,
		),
		),
	),
	floatingActionButton: FloatingActionButton(
		elevation: 10.0,
		child: Icon(Icons.add),
		onPressed: (){
		// action on button press
		}
	);
}
```

此处的elevation属性用于为按钮提供阴影效果。*Icon*用于使用 Flutter SDK 中一些预加载的图标放置按钮的图标。onPressed *()*是一个函数，当按下按钮时将调用该函数，函数内部的语句将被执行。 


![浮动操作按钮示例](https://media.geeksforgeeks.org/wp-content/uploads/20191225233726/floatingActionButton-Example-169x300.png)

- **抽屉：** *抽屉*是显示在 Scaffold 侧面的滑块菜单或面板。用户必须根据定义的操作从左向右或从右向左滑动才能访问抽屉菜单。在 Appbar 中，抽屉的适当图标会自动设置在特定位置。打开抽屉的手势也是自动设置的。它由Scaffold处理。 

```dart
drawer: Drawer(
		child: ListView(
		children: const <Widget>[
		DrawerHeader(
			decoration: BoxDecoration(
			color: Colors.green,
			),
			child: Text(
			'GeeksforGeeks',
			style: TextStyle(
				color: Colors.green,
				fontSize: 24,
			),
			),
		),
		ListTile(
			title: Text('Item 1'),
		),
		ListTile(
			title: Text('Item 2'),
		),
		],
	),
	),
```

作为父小部件，采用*ListView*并在其中将面板分为两部分，标题和菜单。*DrawerHeader*用于修改面板的表头。在标题中，可以根据应用程序显示用户的图标或详细信息。使用*ListTile*将项目添加到菜单中。 


![抽屉示例](https://media.geeksforgeeks.org/wp-content/uploads/20191225235024/drawer-example-169x300.png)

还可以使用*ListTile的属性**前导*在项目之前添加图标，在其中必须使用*Icon*小部件。 **例子：**

```dart
ListTile(
	title
	: Text('Item 1'),
	leading
	: Icon(Icons.people), ),
	ListTile(
		title
		: Text('Item 2'),
		leading
		: Icon(Icons.mail), ),
```


![带有前导图标的项目的抽屉](https://media.geeksforgeeks.org/wp-content/uploads/20191226235206/drawer-with-items-having-icon-169x300.png)

- **bottomNavigationBar：** *bottomNavigationBar*就像 Scaffold 底部的菜单。在大多数应用程序中都看到了这个导航栏。可以在栏中添加多个图标或文本或两者作为项目。 

```dart
bottomNavigationBar
	: BottomNavigationBar(
		currentIndex : 0,
		fixedColor
		: Colors.green,
			items
		: [
			BottomNavigationBarItem(
				title
				: Text("Home"),
					icon
				: Icon(Icons.home), ),
			BottomNavigationBarItem(
				title
				: Text("Search"),
					icon
				: Icon(Icons.search), ),
			BottomNavigationBarItem(
				title
				: Text("Profile"),
					icon
				: Icon(Icons.account_circle), ),
		],
			onTap
		: (int indexOfItem){

		}),
```

使用*BottomNavigationBar*小部件来显示栏。对于活动图标的颜色，使用*fixedColor*属性。要在栏中添加项目，使用*BottomNavigationBarItems*小部件，在其中提供文本和图标。对于点击项目执行的操作，有*onTap(int indexOfItem)*函数，它根据项目的索引位置工作。 


![底部导航栏](https://media.geeksforgeeks.org/wp-content/uploads/20191227001057/bottomNavigationBar-169x300.png)

- **backgroundColor：**用于设置整个*Scaffold*小部件的颜色。
- **floatingActionButtonAnimator：**用于提供动画来移动*floatingActionButton*。
- **primary：**判断*Scaffold*是否显示。
- **drawerScrimColor：**用于定义抽屉打开时主要内容的颜色。
- **bottomSheet**：此属性接受一个小部件（最终）作为对象，以将其显示在屏幕底部。
- **drawerDragStartBehaviour**：该属性将*DragStartBehavior 枚举*作为对象来确定抽屉的拖动行为。
- **drawerEdgeDragWidth**：这决定了滑动或拖动将导致抽屉打开的区域。它接受一个*double*作为对象。
- **drawerEnableOpenGesture**：此属性保存在一个*布尔*值中，作为确定拖动手势是否打开抽屉的对象，默认情况下设置为 true。
- **endDrawer** : [*endDrawer*](https://www.geeksforgeeks.org/enddrawer-widget-in-flutter/)属性接受一个小部件作为参数。它类似于抽屉，只是它以相反的方向打开。
- **endDrawerEnableOpenGesture**：此属性再次接受一个*布尔*值作为对象，以确定拖动手势是否会打开*endDrawer*。
- **extendBody**：extendBody 属性接受一个*布尔值*作为对象。默认情况下，此属性始终为 false，但不能为 null。如果在存在*bottomNavigationBar*或*persistentFooterButtons*的情况下将其设置为true ，则它们的高度将添加到body 中，并在body 下方移动。
- **extendBodyBehindAppBar**：此属性还接受一个*布尔值*作为对象。默认情况下，此属性始终为 false，但不能为 null。如果它设置为 true，则*appBar*不会在 body 上，而是在它上方延伸，并且它的高度会添加到 body。*当appBar*的颜色不是完全不透明时使用此属性。
- **floatingActionButtonLocation**：此属性负责*floatingActionBotton*的位置。
- **persistentFooterButton**：此属性接受一个小部件列表。通常是显示在*Scaffold*下方的按钮。
- **resizeToAvoidBottomInsets**：此属性接受一个*布尔*值作为对象。*如果设置为 true，则Scaffold*上的浮动小部件会自行调整大小以避免妨碍屏幕键盘。