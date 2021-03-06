import 'package:flutter/material.dart';
import 'package:number1/demo/bolc/application_bloc.dart';

import 'bolc/bloc_provider.dart';
import 'bolc/models.dart';

class ClickButtonDemo extends StatefulWidget {
  const ClickButtonDemo({Key? key}) : super(key: key);

  @override
  State<ClickButtonDemo> createState() => _ClickButtonDemoState();
}

class _ClickButtonDemoState extends State<ClickButtonDemo> {
  ApplicationBloc? mApplicationBloc;

  @override
  void initState() {
    super.initState();
    mApplicationBloc =
        BlocProvider.of<ApplicationBloc>(context) ?? ApplicationBloc();
    mApplicationBloc?.getArticleListData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ClickButtonDemo"),
        elevation: 0.0,
      ),
      body: StreamBuilder(
          stream: mApplicationBloc?.reposStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<ReposModel>> snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data?[index].title ?? ""),
                  );
                });
            // if (snapshot.data == null) {
            //   // applicationBloc.getData();
            //   applicationBloc.getArticleListData();
            //   // return const Center(child: CircularProgressIndicator());
            // } else {
            //   return ListView.builder(
            //       itemCount: snapshot.data?.length ?? 0,
            //       itemBuilder: (context, index) {
            //         return ListTile(
            //           title: Text(snapshot.data?[index].title ?? ""),
            //         );
            //       });
            //   // return Text(data.data?[index].title ?? "");
            //   // BannerModel model = snapshot.data ?? [][index];
            // }
          }),

      // body: Container(
      //   padding: EdgeInsets.all(16.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Stack(
      //         alignment: Alignment.topLeft, //对齐方式
      //         children: [
      //           Padding(
      //             padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
      //             child: SizedBox(
      //               width: 100.0,
      //               height: 100.0,
      //               child: Container(
      //                 alignment: Alignment(0.0, 0.0),
      //                 decoration: BoxDecoration(
      //                   color: Color.fromRGBO(3, 54, 255, 1.0),
      //                   borderRadius: BorderRadius.circular(8.0),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           SizedBox(
      //             width: 200.0,
      //             height: 30.0,
      //             child: GestureDetector(
      //               //子 widget 可点击控件
      //               onTap: clickButton,
      //               child: Container(
      //                 decoration: BoxDecoration(
      //                     color: Color.fromRGBO(3, 54, 255, 1.0),
      //                     shape: BoxShape.circle,
      //                     gradient: RadialGradient(//镜像渐变
      //                         colors: [Colors.green, Colors.green])),
      //                 child: Icon(Icons.add, color: Colors.white, size: 32.0),
      //               ),
      //             ),
      //           ),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    );
  }

  // void clickButton() {
  //   showToast(msg: "点击了按钮");
  // }

// void clickButton() {
//   HiCache.getInstance().setString(GlobalConstant.userName, "田宇11111");
//   HiCache.getInstance().setString(GlobalConstant.userName, "田宇");
//   HiCache.getInstance().setInt(GlobalConstant.userAge, 20);
//
//   var name = HiCache.getInstance()
//       .get<String>(GlobalConstant.userName); //指定泛型为 String
//   var age =
//       HiCache.getInstance().get(GlobalConstant.userAge); //不指定泛型 Int T 自动推断
//
//   debugPrint("睚眦 => name $name age $age");
// }

  // void clickButton() async {
  //   var result = await HiNet.getInstance().fire(TestRequest());
  //   var entity = Autogenerated.fromJson(result);
  //   LogUtils.d(entity.data?.first.desc ?? "", tag: "desc");
  // }

  void clickButton() async {}
}

class WanAndroidApi {
  /// 首页banner http://www.wanandroid.com/banner/json
  static const String BANNER = "banner";
  static const String baseBanner = "/banner/json";
  static const String USER_REGISTER = "user/register"; //注册
  static const String USER_LOGIN = "user/login"; //登录
  static const String USER_LOGOUT = "user/logout"; //退出

  // 拼接url
  static String getPath({String path: '', int? page, String resType: 'json'}) {
    StringBuffer sb = StringBuffer(path);
    if (page != null) {
      sb.write('/$page');
    }
    if (resType.isNotEmpty) {
      sb.write('/$resType');
    }
    return sb.toString();
  }
}

class LoginReq {
  String username;
  String password;

  LoginReq(this.username, this.password);

  LoginReq.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };

  @override
  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write("\"username\":\"$username\"");
    sb.write(",\"password\":$password");
    sb.write('}');
    return sb.toString();
  }
}
