**MaterialApp 类：** MaterialApp 是 Flutter 中预定义的类。它是 Flutter 的主要或核心组件。可以访问 Flutter SDK 提供的所有其他组件和小部件。Text widget、Dropdownbutton widget、[AppBar](https://www.geeksforgeeks.org/flutter-appbar-widget/) widget、[Scaffold](https://www.geeksforgeeks.org/scaffold-class-in-flutter-with-examples/) widget、[ListView](https://www.geeksforgeeks.org/listview-class-in-flutter/) widget、[StatelessWidget](https://www.geeksforgeeks.org/flutter-stateful-vs-stateless-widgets/)、[StatefulWidget](https://www.geeksforgeeks.org/difference-between-stateless-and-stateful-widget-in-flutter/)、IconButton widget、TextField widget、Padding widget、ThemeData widget等都是可以使用MaterialApp类访问的widget。使用 MaterialApp 类可以访问更多的小部件。

### **MaterialApp 类的构造函数**

```dart
  const MaterialApp({
    Key? key,
    this.navigatorKey,
    this.scaffoldMessengerKey,
    this.home,
    Map<String, WidgetBuilder> this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    List<NavigatorObserver> this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.themeMode = ThemeMode.system,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
    this.useInheritedMediaQuery = false,
  }) : assert(routes != null),
       assert(navigatorObservers != null),
       assert(title != null),
       assert(debugShowMaterialGrid != null),
       assert(showPerformanceOverlay != null),
       assert(checkerboardRasterCacheImages != null),
       assert(checkerboardOffscreenLayers != null),
       assert(showSemanticsDebugger != null),
       assert(debugShowCheckedModeBanner != null),
       routeInformationProvider = null,
       routeInformationParser = null,
       routerDelegate = null,
       backButtonDispatcher = null,
       super(key: key);
```

### **MaterialApp 小部件的属性：**

- **action：**该属性以  *Map<Type, Action<Intent>>*为对象。它控制意图键。
- **backButtonDispatcher：**它决定了如何处理后退按钮。
- **checkerboardRasterCacheImage：**  此属性接受一个布尔值作为对象。如果设置为 true，它将打开光栅缓存图像的棋盘格。
- **color：**它控制应用程序中使用的原色。
- **darkTheme：**它为应用程序的黑暗主题提供主题数据。
- **debugShowCheckedModeBanner：**该属性接受一个*布尔值*作为对象来决定是否显示调试横幅。
- **debugShowMaterialGird：**此属性将布尔值作为对象。如果设置为 true，它会绘制一个基线网格材质应用程序。
- **highContrastDarkTheme：**它提供了用于高对比度主题的主题数据。
- **home：**此属性将*小部件*作为对象显示在应用程序的默认路由上。
- **initialRoute：**此属性接受一个*字符串*作为对象，以给出构建导航器的第一条路线的名称。
- **语言环境：**它为*MaterialApp 提供语言环境。*
- **localizationsDelegate：**这为语言环境提供了一个委托。
- **navigatorObserver：**以*GlobalKey<NavigatorState>*为对象，在构建导航器时生成key。
- **navigatorObserver：**此属性将*List<NavigatorObserver>*作为对象来为导航器创建观察者列表。
- **onGenerateInitialRoutes：**该属性以*InitialRouteListFactory typedef*为对象生成初始路由。
- **onGeneratRoute：** onGenerateRoute*接受*一个*RouteFactory*作为对象。当应用程序导航到命名路由时使用它。
- **OnGenerateTitle：**此属性以*RouteFactory typedef*作为对象，为应用程序生成标题字符串（如果提供）。
- **onUnknownRoute：** onUnknownRoute以*RouteFactory* *typedef*为对象，在其他方法失败时提供路由。
- **routeInformationParse：**此属性持有*RouteInformationParser<T>*作为对象，将路由信息从 routeInformationProvider 转换为通用数据类型。
- **routeInformationProvider：**该属性以*RouteInformationProvider*类为对象。它负责提供路由信息。
- **routeDelegate：**此属性将*RouterDelegate<T>* 作为对象来配置给定的小部件。
- **routes：** routes*属性*以*LogicalKeySet*类为对象，控制应用的最顶层路由。
- **快捷方式：**该属性以*LogicalKeySet*类作为对象来决定应用程序的键盘快捷方式。
- **showPerformanceOverlay：** showPerformanceOverlay*接受*一个*布尔*值作为打开或关闭性能覆盖的对象。
- **showSemantisDebugger：**此属性接受一个*布尔值*作为对象。如果设置为 true，它会显示一些可访问的信息。
- **supportedLocales：** supportedLocales*属性通过将**Iterable<E>*类作为对象来保存应用程序中使用的本地变量。
- **theme：**该属性以*ThemeData*类为对象，为 MaterialApp 描述主题。
- **themeMode：** 此属性将*ThemeMode 枚举*作为对象来决定材质应用程序的主题。
- **title：** title*属性*以*字符串*为对象，决定设备应用的一行描述。

```dart
import 'package:flutter/material.dart';

void main() {
runApp(const GFGapp());
}

class GFGapp extends StatelessWidget {
const GFGapp({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
	return MaterialApp(
	title: 'GeeksforGeeks',
	theme: ThemeData(primarySwatch: Colors.green),
	darkTheme: ThemeData(primarySwatch: Colors.grey),
	color: Colors.amberAccent,
	supportedLocales: {const Locale('en', ' ')},
	debugShowCheckedModeBanner: false,
	home: Scaffold(
		appBar: AppBar(title: const Text('GeeksforGeeks')),
	),
	);
}
}
```

![上述代码的实现](https://media.geeksforgeeks.org/wp-content/uploads/20191218000851/Making-a-screen-using-MaterialApp-in-flutter1.png)

- appbar标题中定义的文本显示在顶部。
- 定义的默认主题颜色是绿色。
- *runApp()*已将小部件安装在整个屏幕上。 

**输出说明：** 

- **import 语句：** import*语句*用于导入 Flutter SDK 提供的库。在这里，导入了“material.dart”文件。可以通过导入这个文件来使用所有实现材料设计的颤振小部件。
- **main() 函数：**与许多其他编程语言一样，也有 main 函数，必须在其中编写要在应用程序启动时执行的语句。main 函数的返回类型是*'void'*。
- **runApp(Widget widget) 函数：** void runApp(Widget widget) 将一个小部件作为参数并将其设置在屏幕上。它为小部件提供了约束以适应屏幕。它使给定的小部件成为应用程序的根小部件，并将其他小部件作为它的子小部件。在这里，使用*MaterialApp*作为根小部件，在其中定义了其他小部件。
- **MaterialApp() 小部件：** MaterialApp 小部件的不同属性。 
- **title：**此属性用于向用户提供应用程序的简短描述。当用户在移动设备上按下*最近的应用程序按钮时，会显示**标题*中进行的文本。 
- **主题：**此属性用于为应用程序提供默认主题，如应用程序的主题颜色。
  使用名为*ThemeData()*的内置类/小部件。在*Themedata()*小部件中，必须编写与主题相关的不同属性。这里使用了*primarySwatch*，它用于定义应用程序的默认主题颜色。要选择颜色，使用了材质库中的*Colors*类。在 ThemeData() 中，还可以定义一些其他属性，例如 TextTheme、Brightness（可以通过此启用深色主题）、AppBarTheme 等等。
- **home：**用于应用程序的默认路由，即应用程序正常启动时显示其中定义的widget。在这里，在 home 属性中定义了*Scaffold小部件。*在 Scaffold 内部，定义了各种属性，例如 appBar、body、floatingActionButton、backgroundColor 等 
  。例如，在*appBar*属性中，使用了 AppBar() 小部件，其中传递了*“GeeksforGeeks”*作为标题，它将显示在顶部应用程序栏中的应用程序。
- MaterialApp() 中的其他属性是*debugShowCheckedModeBanner*（用于删除顶部角落的调试标签）、*darkTheme*（用于在应用程序中请求暗模式）、*颜色*（用于应用程序的主色）、*路由*（用于应用程序的路由表）、*ThemeMode*（确定要使用的主题）和*supportedLocales*包含应用程序支持的语言列表等。