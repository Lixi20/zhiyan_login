import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ZhiYanLogin());
}

class ZhiYanLogin extends StatelessWidget {
  const ZhiYanLogin({Key? key}) : super(key: key);

  // 这个小部件是您的应用程序的根。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 不显示右上角的 debug
      theme: ThemeData(
        // 这是您的应用程序的主题。
        // 将下面的 primarySwatch 更改为 Colors.green 然后调用
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '智眼 Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // 这个小部件是您的应用程序的主页。 它是有状态的。
  // 这个类是状态的配置。 它保存值（在这个由父级（在本例中为 App 小部件）提供的标题）和由 State 的 build 方法使用。 Widget 子类中的字段始终标记为“最终”。
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 这里我们从创建的 MyHomePage 对象中获取值
        // App.build 方法，并使用它来设置我们的 appbar 标题。
        title: Text(widget.title),
      ),
      body: Form(
          key: _formKey, // 设置globalKey，用于后面获取FormStat
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Center(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: kToolbarHeight), // 距离顶部一个工具栏的高度
                const SizedBox(height: 80),
                weChatLogin(context),
                const SizedBox(height: 80),
                dingTalkLogin(context)
              ],
            ),
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget weChatLogin(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 60,
        width: 400,
        child: ElevatedButton.icon(
          // 设置圆角
          icon: const Icon(Icons.wechat),
          label: const Text('微信登录'),
          style: ButtonStyle(
              shape: MaterialStateProperty.all(const StadiumBorder(
                  side: BorderSide(style: BorderStyle.none)))),
          onPressed: () {
            // TODO 请求代码
            if (kDebugMode) {
              print("AAA");
            }
          },
        ),
      ),
    );
  }

  Widget dingTalkLogin(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 60,
        width: 400,
        child: ElevatedButton.icon(
          // 设置圆角
          // 暂时用微信icon代替
          icon: const Icon(Icons.wechat),
          label: const Text('钉钉登录'),
          style: ButtonStyle(
              shape: MaterialStateProperty.all(const StadiumBorder(
                  side: BorderSide(style: BorderStyle.none)))),
          onPressed: () {
            // TODO 请求代码
            if (kDebugMode) {
              print("BBB");
            }
          },
        ),
      ),
    );
  }
}
