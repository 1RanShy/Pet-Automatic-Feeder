import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class SearchPage extends StatefulWidget {
  final Map arguments;
  SearchPage({Key? key, required this.arguments}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //获取设备
  late BluetoothDevice device;
  //获取设备连接的状态
  String deviceState="";
  //判断页面是否销毁
  bool isDesponse=false;
  @override
  void initState() {
    super.initState();
    //获取设备
    this.device = widget.arguments["device"];
    // print(this.device);
    //连接蓝牙
    this.device.connect();
    //监听蓝牙状态
    this.device.state.listen((state) {
      if(this.isDesponse==false){
        if (state == BluetoothDeviceState.connected) {
          setState(() {
            this.deviceState = "连接成功";
          });
        } else if (state == BluetoothDeviceState.connecting) {
          setState(() {
            this.deviceState = "connecting...";
          });
        } else if (state == BluetoothDeviceState.disconnected) {
          setState(() {
            this.deviceState = "disconnected...";
          });
        }
      }
    });
  }
  @override
  void dispose() {
    this.isDesponse=true;
    this.device.disconnect();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${this.deviceState}")),
      body: Container(
        child: Text("组件"),
      ),
    );
  }
}
