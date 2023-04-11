//项目框架
//1.引入主题包
import 'package:flutter/material.dart';
import 'package:petfeeder/pages/Tabs.dart';
import 'package:petfeeder/pages/tabs/Bluetooth.dart';
import 'package:petfeeder/pages/tabs/Connect.dart';
import 'package:petfeeder/routes/Routes.dart';

//2.定义入口方法，调用runApp，并在里面传入对应组件
void main(){
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFFBBD7D8)),
        // textTheme: TextTheme(
        //   bodyText2: TextStyle(
        //     color: Colors.blueGrey,
        //   )
        // )
      ),
      // home: Tabs(),
      initialRoute: '/', //初始化的时候加载的路由
      //配置路由
      onGenerateRoute: onGenerateRoute,
    );
  }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;
  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}