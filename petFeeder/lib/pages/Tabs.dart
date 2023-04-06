import 'package:flutter/material.dart';
import 'package:petfeeder/pages/tabs/Home.dart';
import 'package:petfeeder/pages/tabs/Schedule.dart';
import 'package:petfeeder/pages/tabs/Bluetooth.dart';
import 'package:petfeeder/pages/tabs/Search.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;//默认选中第0个

  //页面列表
  List _pageList = [
    HomePage(),
    SchedulePage(),
    // SearchPage(),
    BluetoothPage(),
    // SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    if (this._currentIndex == 1) {
      return Scaffold(
        //最上面导航栏
        appBar: AppBar(
          title: const ListTile(
            // leading: Icon(Icons.reorder, color: Colors.white,),
            title: Text(
              "Pet Feeder",
              style: TextStyle(
                fontSize: 20.0, // 设置字体大小
                color: Colors.white, // 设置字体颜色
              ),
            ),
            // trailing: Icon(Icons.account_circle, color: Colors.white),
          ),
        ),
        //侧边弹窗
        drawer: Drawer(
            child: Column(
              children: const <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("Nana"),
                  accountEmail: Text("nana@petfeeder.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("images/account.png"),
                  ),
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    image: DecorationImage(
                      image: AssetImage("images/drawerBackground.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  title: Text("Personal Center"),
                  leading: CircleAvatar(
                    backgroundColor: Color.fromRGBO(187,215,216,1),
                    child: Icon(Icons.account_circle, color: Colors.white,),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text("Settings"),
                  leading: CircleAvatar(
                    backgroundColor: Color.fromRGBO(187,215,216,1),
                    child: Icon(Icons.settings, color: Colors.white,),
                  ),
                ),
              ],
            )
        ),
        //主体
        body: this._pageList[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,//解决底部导航四个的时候字体无法显示的情况
          currentIndex: this._currentIndex,//默认初始选中第0个Homepage
          onTap: (int index){
            setState(() {
              this._currentIndex = index;
            });
          },
          selectedItemColor: Color.fromRGBO(187,215,216,1),
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pending_actions),
              label: "Schedule",
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.search),
            //   label: "Search",
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bluetooth),
              label: "Bluetooth",
            ),
            // // BottomNavigationBarItem(
            //   icon: Icon(Icons.settings),
            //   label: "Setting",
            // ),
          ],
        ),
        //右下角增加日程安排的框框
        floatingActionButton: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
          ),
          margin: EdgeInsets.only(top:10),
          padding: EdgeInsets.all(8),
          child: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Color.fromRGBO(187,215,216,1),
            onPressed: (){
              setState(() {
                this._currentIndex = 1;
              });
            },
          )
        ),
      );
    }
    else {
      return Scaffold(
        //最上面导航栏
        appBar: AppBar(
          title: const ListTile(
            // leading: Icon(Icons.reorder, color: Colors.white,),
            title: Text(
              "Pet Feeder",
              style: TextStyle(
                fontSize: 20.0, // 设置字体大小
                color: Colors.white, // 设置字体颜色
              ),
            ),
            // trailing: Icon(Icons.account_circle, color: Colors.white),
          ),
        ),
        //侧边弹窗
        drawer: Drawer(
            child: Column(
              children: const <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("Nana"),
                  accountEmail: Text("nana@petfeeder.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("images/account.png"),
                  ),
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    image: DecorationImage(
                      image: AssetImage("images/drawerBackground.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  title: Text("Personal Center"),
                  leading: CircleAvatar(
                    backgroundColor: Color.fromRGBO(187,215,216,1),
                    child: Icon(Icons.account_circle, color: Colors.white,),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text("Settings"),
                  leading: CircleAvatar(
                    backgroundColor: Color.fromRGBO(187,215,216,1),
                    child: Icon(Icons.settings, color: Colors.white,),
                  ),
                ),
              ],
            )
        ),
        //主体
        body: this._pageList[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,//解决底部导航四个的时候字体无法显示的情况
          currentIndex: this._currentIndex,//默认初始选中第0个Homepage
          onTap: (int index){
            setState(() {
              this._currentIndex = index;
            });
          },
          selectedItemColor: Color.fromRGBO(187,215,216,1),
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pending_actions),
              label: "Schedule",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bluetooth),
              label: "Bluetooth",
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.search),
            //   label: "Search",
            // ),
            // // BottomNavigationBarItem(
            //   icon: Icon(Icons.settings),
            //   label: "Setting",
            // ),
          ],
        ),
        //右下角增加日程安排的框框
        // floatingActionButton: Container(
        //   height: 80,
        //   width: 80,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(40),
        //     color: Colors.white,
        //   ),
        //   margin: EdgeInsets.only(top:10),
        //   padding: EdgeInsets.all(8),
        //   child: FloatingActionButton(
        //     child: Icon(Icons.add),
        //     backgroundColor: Color.fromRGBO(187,215,216,1),
        //     onPressed: (){
        //       setState(() {
        //         this._currentIndex = 1;
        //       });
        //     },
        //   )
        // ),
      );
    }
  }
}


// class BottomBar extends StatelessWidget{
//   const BottomBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     //获取设备的宽度和高度
//     final size = MediaQuery.of(context).size;
//
//     return Stack(
//       children: [
//         Positioned(
//           bottom: 0,
//           width: size.width,
//           height: 50,
//           child: Container(
//             color: Colors.blueGrey,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconContainer(Icons.home, color: Colors.blueGrey),
//                 IconContainer(Icons.pending_actions, color: Colors.blueGrey),
//                 IconContainer(Icons.search, color: Colors.blueGrey),
//                 IconContainer(Icons.settings, color: Colors.blueGrey),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

// class IconContainer extends StatelessWidget{
//   Color color;
//   IconData icon;
//   IconContainer(this.icon,{super.key, required this.color});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         alignment: Alignment.center,
//         height: 120,
//         width: 120,
//         color: color,
//         child: Icon(
//           icon,
//           color: Colors.white,
//           size: 28,
//         )
//     );
//   }
// }