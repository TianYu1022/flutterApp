import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          /*DrawerHeader(
                child: Text('Tian Yu Flutter App !'.toUpperCase()), //把文字大写
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
              ),*/
          //用户账户信息
          UserAccountsDrawerHeader(
            accountName: const Text('HongKong_Doll',
                style: TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: const Text('godyutian@gmail.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'http://m.qpic.cn/psc?/V124eZU41TdanL/ruAMsa53pVQWN7FLK88i5r0J8xxlNqOu8qoKWxPTGm*kdnhdFUzbT9diFEiVoARiY0OtJx3wNzH9AyLoiEOCdCYOBxmlzCNv86XxuqTzwMA!/b&bo=OARRBgAAAAABB0s!&rf=viewer_4'),
            ),
            decoration: BoxDecoration(
                color: Colors.yellow[400],
                image: DecorationImage(
                  image: const NetworkImage(
                      'http://m.qpic.cn/psc?/V124eZU41TdanL/ruAMsa53pVQWN7FLK88i5soFvNUt5OL5YhxPVdKAC2fGsQjHEUSglBsnOx7Uoc*TaT3P0NPhIZHWjyako34A9T*bsMi6YtPIt3c15KtKeDQ!/b&bo=3AX0AQAAAAABBww!&rf=viewer_4'),
                  fit: BoxFit.cover, //填充
                  colorFilter: ColorFilter.mode(
                      //滤镜
                      Colors.yellow[400].withOpacity(0.6),
                      BlendMode.hardLight), //混合模式
                )),
          ),
          ListTile(
            title: const Text(
              'Message',
              textAlign: TextAlign.right,
            ),
            trailing: const Icon(
              //标题后加一个图标 标题前为 trailing
              Icons.message,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text(
              'Favorite',
              textAlign: TextAlign.right,
            ),
            trailing: const Icon(
              Icons.favorite,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text(
              'Settings',
              textAlign: TextAlign.right,
            ),
            trailing: const Icon(
              Icons.settings,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
