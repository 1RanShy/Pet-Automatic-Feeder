import 'package:flutter/material.dart';
import 'package:petfeeder/pages/tabs/Menu.dart';
import 'package:petfeeder/pages/tabs/Home.dart';
import 'package:petfeeder/pages/tabs/Schedule.dart';
import 'package:petfeeder/pages/tabs/Bluetooth.dart';

class ConnectPage extends StatefulWidget {
  const ConnectPage({super.key});

  _ConnectPageState createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  List<String> status = ["Connecting...", "Connected"];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //最上面导航栏
      appBar: AppBar(
        title: ListTile(
          // leading: Icon(Icons.reorder, color: Colors.white,),
          title: Text(
            status[index] as String,
            style: TextStyle(
              fontSize: 20.0, // 设置字体大小
              color: Colors.white, // 设置字体颜色
            ),
          ),
      // trailing: Icon(Icons.account_circle, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          MenuCard(),

        ],
      ),

    );
  }
}