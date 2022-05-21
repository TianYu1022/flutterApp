import 'package:flutter/material.dart';

class FromDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FromDemo"),
        elevation: 0.0,
      ),
      body: Scaffold(
        body: Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.black),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[RegisterForm()],
            ),
          ),
        ),
      ),
    );
  }
}

///表单
class RegisterForm extends StatefulWidget {
  RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();

  var username = "";
  var password = "";

  void submitRegisterForm() {

    if (registerFormKey.currentState?.validate() ?? false) { //校验
      registerFormKey.currentState?.save(); //保存一下数据

      Navigator.pushNamed(context, "/home");

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("username $username password $password")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: registerFormKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration:
                  InputDecoration(labelText: "username", helperText: ""),
              onSaved: (value) {
                username = value ?? "";
              },
              validator: validatorUsername,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            TextFormField(
              obscureText: true,
              //影藏输入文字
              decoration:
                  InputDecoration(labelText: "Password", helperText: ""),
              onSaved: (value) {
                password = value ?? "";
              },
              validator: validatorPassword,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            SizedBox(height: 32.0),
            Container(
              width: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                )),
                color: Theme.of(context).accentColor,
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.black),
                ),
                elevation: 0.0,
                onPressed: submitRegisterForm,
              ),
            )
          ],
        ));
  }

  String? validatorUsername(String? value) {
    if (value?.isEmpty ?? false) {
      return "username is empty";
    }
    return null;
  }

  String? validatorPassword(String? value) {
    if (value?.isEmpty ?? false) {
      return "password is empty";
    }
    return null;
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor, //系统颜色
    );
  }
}

///文本输入框
class TextFieldDemo extends StatefulWidget {
  TextFieldDemo({Key? key}) : super(key: key);

  @override
  State<TextFieldDemo> createState() => TextFieldDemoState();
}

class TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.text = "Hi this is textEditingController";
    textEditingController.addListener(() {
      // debugPrint("input ${textEditingController.text}");
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      /*onChanged: (value) {
        debugPrint(value);
      },*/
      onSubmitted: (value) {
        // debugPrint(value);
      },
      decoration: InputDecoration(
          icon: Icon(Icons.subject),
          labelText: "Title",
          hintText: "Enter the post title.",
          // border: InputBorder.none, //下划线
          // border: OutlineInputBorder(), 包裹起来的
          filled: true),
    );
  }
}
