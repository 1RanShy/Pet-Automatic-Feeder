import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:petfeeder/pages/tabs/Menu.dart';

class ConnectPage extends StatefulWidget {
  final Map arguments;
  const ConnectPage({Key? key, required this.arguments}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ConnectPageState createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  //最上面显示的连接情况
  List<String> status = ["Connecting...", "Connected", "Disconnected",];
  int index = 0;

  //获取设备
  late BluetoothDevice device;
  //获取设备连接的状态
  String deviceState = "";
  //判断页面是否销毁
  bool isDesponse = false;
  //获取读写的特征值
  late BluetoothCharacteristic mCharacteristicRead;
  late BluetoothCharacteristic mCharacteristicWrite;
  String sendString = "initialize";
  String reviceString = "initialize";
  String mOrAString = "The feeding mode: ";
  String catDetectString = "The result: ";

  //按钮bool值
  bool feedingValue = false;
  bool presentValue = false;

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
      if (this.isDesponse == false) {
        if (state == BluetoothDeviceState.connected) {
          setState(() {
            this.deviceState = "Connected";
          });
          //发现服务
          this.discoverServices();
        } else if (state == BluetoothDeviceState.connecting) {
          setState(() {
            this.deviceState = "Connecting...";
          });
        } else if (state == BluetoothDeviceState.disconnected) {
          setState(() {
            this.deviceState = "Disconnected";
          });
        }
      }
    });
  }

  @override
  void dispose() {
    this.isDesponse = true;
    this.device.disconnect();
    super.dispose();
  }

  discoverServices() async {
    List<BluetoothService> services = await device.discoverServices();
    services.forEach((service) {
      // do something with service
      print("-------------serviceUUID----------------");
      print("${service.uuid}");
      // 0000ffe1-0000-1000-8000-00805f9b34fb  厂商发给我们可以读写的UUID
      if (service.uuid.toString() == "0000ffe0-0000-1000-8000-00805f9b34fb") {
        print("-------------获取服务成功----------------");
        var characteristics = service.characteristics;
        for (BluetoothCharacteristic c in characteristics) {
          if (c.uuid.toString() == "0000ffe1-0000-1000-8000-00805f9b34fb") {
            print("-------------获取特征值成功----------------");
            this.mCharacteristicRead = c;
            //定时器 获取蓝牙模块里面的数据
            // const timeout = const Duration(seconds: 5);
            // Timer(timeout, () {
            // });
            dataCallbackBle();
          }
          if (c.uuid.toString() == "0000ffe2-0000-1000-8000-00805f9b34fb") {
            print("可以发送");
            this.mCharacteristicWrite = c;
          }
        }
      }
    });
  }

  //读取蓝牙模块穿过来的消息
  dataCallbackBle() async {
    await this.mCharacteristicRead.setNotifyValue(true);
    this.mCharacteristicRead.value.listen((value) {
      if (value == null) {
        reviceString = "我是蓝牙返回数据 - 空！！";
        print("我是蓝牙返回数据 - 空！！");
        return;
      }
      print(value);
      print(String.fromCharCodes(value)); //表示Ascii转换成字符串
      setState(() {
        reviceString = String.fromCharCodes(value);
        if(reviceString == "11111") {
          mOrAString = "Now it's automatic feeding mode.";
        }
        else if(reviceString == "22222") {
          mOrAString = "Now it's manual feeding mode.";
        }
        else if(reviceString == "33333") {
          catDetectString = "The cat is not here";
        }
        else if(reviceString == "44444") {
          catDetectString = "Cat is enjoying their food.";
        }
        print("--------------------------------show:");
        print(reviceString);
      });

      //print(AsciiDecoder().convert(value));  //表示Ascii转换成字符串
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //最上面导航栏
      appBar: AppBar(
        title: ListTile(
          // leading: Icon(Icons.reorder, color: Colors.white,),
          title: Text(
            deviceState,
            style: TextStyle(
              fontSize: 20.0, // 设置字体大小
              color: Colors.white, // 设置字体颜色
            ),
          ),
      // trailing: Icon(Icons.account_circle, color: Colors.white),
        ),
      ),
      body: Column(children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          // color: Colors.white,
          height: 80,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                // offset: Offset(5, 5),
              ),
            ],
          ),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 2,
              crossAxisSpacing: 1,
              childAspectRatio: 1 / 0.5,
            ),
            children: [
              IconButton (
                  icon: Icon(Icons.restaurant, color: Colors.amber,),
                  iconSize: 32,
                  onPressed: () async {
                    setState(() {
                      this.sendString = "Food";
                    });
                    print(sendString);
                    final command = this.sendString;
                    final convertedCommand = AsciiEncoder().convert(command);

                    // await this.mCharacteristics.write([97, 98]);
                    await this.mCharacteristicWrite.write(convertedCommand);
                  }
              ),
              IconButton (
                  icon: Icon(Icons.local_drink, color: Colors.cyan,),
                  iconSize: 32,
                  onPressed: () async {
                    setState(() {
                      this.sendString = "Water";
                    });
                    print(sendString);
                    final command = this.sendString;
                    final convertedCommand = AsciiEncoder().convert(command);

                    // await this.mCharacteristics.write([97, 98]);
                    await this.mCharacteristicWrite.write(convertedCommand);
                  }
              ),
              IconButton (
                  icon: Icon(Icons.delete_outline, color: Colors.red,),
                  iconSize: 32,
                  onPressed: () async {
                    setState(() {
                      this.sendString = "Clean";
                    });
                    print(sendString);
                    final command = this.sendString;
                    final convertedCommand = AsciiEncoder().convert(command);

                    // await this.mCharacteristics.write([97, 98]);
                    await this.mCharacteristicWrite.write(convertedCommand);
                  }
              ),
              IconButton (
                  icon: Icon(Icons.videocam, color: Colors.lightGreen,),
                  iconSize: 32,
                  onPressed: () async {
                    setState(() {
                      this.sendString = "Camera";
                    });
                    print(sendString);
                    final command = this.sendString;
                    final convertedCommand = AsciiEncoder().convert(command);

                    // await this.mCharacteristics.write([97, 98]);
                    await this.mCharacteristicWrite.write(convertedCommand);
                  }
              ),


              // Icon(Icons.restaurant, color: Colors.amber,),
              // Icon(Icons.local_drink, color: Colors.cyan,),
              // Icon(Icons.delete_outline, color: Colors.red,),
              // Icon(Icons.videocam, color: Colors.lightGreen,),
              Text("Food", textAlign: TextAlign.center, style: TextStyle(color: Colors.amber,),),
              Text("Water", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan,),),
              Text("Clean", textAlign: TextAlign.center, style: TextStyle(color: Colors.red,),),
              Text("Camera", textAlign: TextAlign.center, style: TextStyle(color: Colors.lightGreen,),),
            ],
          ),
        ),

        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          // color: Colors.white,
          height: 15,
          width: MediaQuery.of(context).size.width,
          child: Divider(),
        ),

        //判断自动或手动喂食按钮
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          padding: EdgeInsets.fromLTRB(25, 20, 0, 0),
          // color: Colors.white,
          height: 75,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                // offset: Offset(5, 5),
              ),
            ],
          ),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childAspectRatio: 1 / 0.3,
            ),
            children: [
              Text("Manual Or Automatic Feeding", textAlign: TextAlign.center, style: TextStyle(color: Colors.black,),),

              Transform.scale(
              scale: 1.4,
              child:
                Switch(
                activeColor: Color.fromRGBO(187,215,216,0.5),
                activeTrackColor: Color.fromRGBO(187,215,216,0.5),
                inactiveThumbColor: Colors.black12,
                inactiveTrackColor:Colors.black12,
                dragStartBehavior: DragStartBehavior.start,

                value: this.feedingValue,
                onChanged: (bool v) async {
                  setState(() {
                    this.feedingValue = v;
                    this.sendString = "CAAAC";
                  });
                  print(sendString);
                  final command = this.sendString;
                  final convertedCommand = AsciiEncoder().convert(command);

                  // await this.mCharacteristics.write([97, 98]);
                  await this.mCharacteristicWrite.write(convertedCommand);
                },
              ),
              ),
            ]
          ),
        ),

        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          // color: Colors.white,
          height: 20,
          width: MediaQuery.of(context).size.width,
          child: Text(
            mOrAString,
            style: TextStyle(color: Colors.black),
            // textAlign: TextAlign.center,
            ),
        ),

        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          // color: Colors.white,
          height: 15,
          width: MediaQuery.of(context).size.width,
          child: Divider(),
        ),

        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          // color: Colors.white,
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Text(
            "You can press this button to check if the cat is eating when the water is full or in manual mode:",
            style: TextStyle(
              color: Colors.black38,
            ),
          ),
        ),

        //判断猫猫在不在按钮
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          padding: EdgeInsets.fromLTRB(25, 25, 0, 0),
          // color: Colors.white,
          height: 70,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                // offset: Offset(5, 5),
              ),
            ],
          ),
          child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                childAspectRatio: 1 / 0.2,
              ),
              children: [
                Text(
                  "Where The Cat",
                  // textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,),
                ),

                Transform.scale(
                  scale: 1.4,
                  child:
                  Switch(
                    activeColor: Color.fromRGBO(187,215,216,0.5),
                    activeTrackColor: Color.fromRGBO(187,215,216,0.5),
                    inactiveThumbColor: Colors.black12,
                    inactiveTrackColor:Colors.black12,
                    dragStartBehavior: DragStartBehavior.start,

                    value: this.presentValue,
                    onChanged: (bool v) async {
                      setState(() {
                        this.presentValue = v;
                        this.sendString = "CBBBC";
                      });
                      print(sendString);
                      final command = this.sendString;
                      final convertedCommand = AsciiEncoder().convert(command);

                      // await this.mCharacteristics.write([97, 98]);
                      await this.mCharacteristicWrite.write(convertedCommand);
                    },
                  ),
                ),
              ]
          ),
        ),

        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          // color: Colors.white,
          height: 20,
          width: MediaQuery.of(context).size.width,
          child: Text(
            catDetectString,
            style: TextStyle(color: Colors.black),
            // textAlign: TextAlign.center,
          ),
        ),

        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          // color: Colors.white,
          height: 15,
          width: MediaQuery.of(context).size.width,
          child: Divider(),
        ),

          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            padding: EdgeInsets.all(15),
            // color: Colors.white,
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  // color: Colors.white,
                  color: Color.fromRGBO(187,215,216,0.5),
                  // offset: Offset(5, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Text("The following information is sent:"),
                Divider(),
                Text(
                  sendString,
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ]
            )
          ),

          // ReceivedCard(),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            padding: EdgeInsets.all(15),
            // color: Colors.white,
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  // color: Colors.white,
                  color: Colors.white,
                  // offset: Offset(5, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Text("The following information is received:"),
                Divider(),
                Text(
                  reviceString,
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ]
            )
          )
        ],
      ),

    );
  }
}

// class ReceivedCard extends StatelessWidget{
//   const ReceivedCard ({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     String show = _ConnectPageState.show;
//     return Container(
//       alignment: Alignment.topLeft,
//       margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
//       padding: EdgeInsets.all(15),
//       // color: Colors.white,
//       height: 200,
//       width: MediaQuery.of(context).size.width,
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//         boxShadow: [
//           BoxShadow(
//             // color: Colors.white,
//             color: Color.fromRGBO(187,215,216,0.5),
//             // offset: Offset(5, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Text("The following information is received:"),
//           Text(
//             show,
//             style: TextStyle(color: Colors.black),
//             overflow: TextOverflow.ellipsis, //超出用...代替
//             softWrap: false,
//           ),
//         ]
//       )
//     );
//   }
// }