**Flutter 中的容器**类是一个方便的小部件，它结合了小部件的常见绘画、定位和大小。Container 类可用于存储一个或多个小部件，并根据我们的方便将其放置在屏幕上。基本上，容器就像一个存储内容的盒子。存储小部件的基本容器元素有一个**边距**，它将当前容器与其他内容分开。可以给整个容器一个不同形状的**边框**，例如圆角矩形等。一个容器用**填充**围绕它的子容器，然后对填充的范围应用额外的约束（将宽度和高度作为约束，如果其中一个是非-无效的）。

![颤振中的容器类](https://media.geeksforgeeks.org/wp-content/uploads/20200604231710/gfg1-300x210.png)

```dart
Container({Key key,
           AlignmentGeometry alignment, 
           EdgeInsetsGeometry padding, 
           Color color, 
           Decoration decoration, 
           Decoration foregroundDecoration, 
           double width, 
           double height, 
           BoxConstraints constraints, 
           EdgeInsetsGeometry margin, 
           Matrix4 transform, 
           Widget child, 
           Clip clipBehavior: Clip.none});
```

**容器类的属性：**

**1. child**：容器小部件有一个属性'child：'，它存储它的孩子。子类可以是任何小部件。让我们举个例子，把一个文本小部件作为一个孩子。 

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
		home
		: Scaffold(appBar
				: AppBar(title
							: Text("Container example"),
						),
					body
				: Container(child
							: Text("Hello! i am inside a container!",
									style
									: TextStyle(fontSize : 20)),
							), ), );
}
}
```

 
 

![颤动中容器类的孩子](https://media.geeksforgeeks.org/wp-content/uploads/20200604232329/gfg21.png)

**2.** **color** : color 属性设置整个容器的背景颜色。现在我们可以使用背景颜色来可视化容器的位置。 

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
		home
		: Scaffold(appBar
				: AppBar(title
							: Text("Container example"),
						),
					body
				: Container(color
							: Colors.purple,
							child
							: Text("Hello! i am inside a container!",
									style
									: TextStyle(fontSize : 20)),
							),
				),
	);
}
}
```

 
 

![颤动中容器类的颜色](https://media.geeksforgeeks.org/wp-content/uploads/20200604232328/gfg31.png)

**3.** **高度和宽度：**默认情况下，容器类占用子级所需的空间。我们还可以根据我们的要求为容器指定高度和宽度。

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
	home: Scaffold(
		appBar: AppBar(
		title: Text("Container example"),
		),
		body: Container(
		height: 200,
		width: double.infinity,
		color: Colors.purple,

		child: Text("Hello! i am inside a container!",
			style: TextStyle(fontSize: 20)),
		),
	),
	);
}
}
```

![颤动中容器类的高度和宽度](https://media.geeksforgeeks.org/wp-content/uploads/20200604232327/gfg41.png)

**4.** **边距：**边距用于在容器周围创建一个空白空间。观察容器周围的空白区域。此处 EdgeInsets.geometry 用于设置边距。all() 表示边距在所有四个方向上均等存在。

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
	home: Scaffold(
		appBar: AppBar(
		title: Text("Container example"),
		),
		body: Container(
		height: 200,
		width: double.infinity,
		color: Colors.purple,
		margin: EdgeInsets.all(20),
		child: Text("Hello! i am inside a container!",
			style: TextStyle(fontSize: 20)),
		),
	),
	);
}
}
```

![颤动中容器类的边距](https://media.geeksforgeeks.org/wp-content/uploads/20200604232325/gfg51.png)

**5. padding**：填充用于从容器的边界为其子元素提供空间。观察边框和文本之间的空间。

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
	home: Scaffold(
		appBar: AppBar(
		title: Text("Container example"),
		),
		body: Container(
		height: 200,
		width: double.infinity,
		color: Colors.purple,
		margin: EdgeInsets.all(20),
		padding: EdgeInsets.all(30),
		child: Text("Hello! i am inside a container!",
			style: TextStyle(fontSize: 20)),
		),
	),
	);
}
}
```

![颤动中容器类中的填充](https://media.geeksforgeeks.org/wp-content/uploads/20200604232324/gfg62.png)

**6.** **对齐：**对齐用于在容器内定位child。我们可以以不同的方式对齐：底部、底部中心、左侧、右侧等。这里的孩子与底部中心对齐。

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
	home: Scaffold(
		appBar: AppBar(
		title: Text("Container example"),
		),
		body: Container(
		height: 200,
		width: double.infinity,
		color: Colors.purple,
		alignment: Alignment.bottomCenter,
		margin: EdgeInsets.all(20),
		padding: EdgeInsets.all(30),
		child: Text("Hello! i am inside a container!",
			style: TextStyle(fontSize: 20)),
		),
	),
	);
}
}
```

![颤动中容器类中的对齐](https://media.geeksforgeeks.org/wp-content/uploads/20200604232322/gfg71.png)

**7.** **装饰**：装饰属性用于装饰盒子（例如给边框）。这画在孩子身后。而foregroundDecoration 在一个孩子面前绘画。让我们给容器一个边框。但是，不能同时给出颜色和边框颜色。

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
	home: Scaffold(
		appBar: AppBar(
		title: Text("Container example"),
		),
		body: Container(
		height: 200,
		width: double.infinity,
		//color: Colors.purple,
		alignment: Alignment.center,
		margin: EdgeInsets.all(20),
		padding: EdgeInsets.all(30),
		decoration: BoxDecoration(
			border: Border.all(color: Colors.black, width: 3),
		),
		child: Text("Hello! i am inside a container!",
			style: TextStyle(fontSize: 20)),
		),
	),
	);
}
}
```

![颤动中容器类中的装饰](https://media.geeksforgeeks.org/wp-content/uploads/20200604232321/gfg81.png)

**8 、** **transform：**容器的这个属性帮助我们旋转容器。我们可以在任何轴上旋转容器，这里我们在 z 轴上旋转。

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
	home: Scaffold(
		appBar: AppBar(
		title: Text("Container example"),
		),
		body: Container(
		height: 200,
		width: double.infinity,
		color: Colors.purple,
		alignment: Alignment.center,
		margin: EdgeInsets.all(20),
		padding: EdgeInsets.all(30),
		transform: Matrix4.rotationZ(0.1),
		child: Text("Hello! i am inside a container!",
			style: TextStyle(fontSize: 20)),
		),
	),
	);
}
}
```

![在颤动中转换容器类](https://media.geeksforgeeks.org/wp-content/uploads/20200604232319/gfg91.png)

**9.** **约束：**想给孩子额外的约束时，可以使用这个属性。 

**10. clipBehaviour :**该属性以*Clip*枚举为对象。这决定了容器内的内容是否会被剪裁。

**11.foregroundDecoration：**该参数以*Decoration*类为对象。它控制 Container 小部件前面的装饰。

[在官方 Flutter 文档](https://api.flutter.dev/flutter/widgets/Container-class.html)