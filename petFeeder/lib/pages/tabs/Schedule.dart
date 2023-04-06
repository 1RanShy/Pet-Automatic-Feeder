import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class SchedulePage extends StatefulWidget{
  const SchedulePage({super.key});

  _SchedulePageState createState() => _SchedulePageState();
}
class _SchedulePageState extends State<SchedulePage>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuRecordCard(),
        TimeCard(),
        FeederCard(),
      ],
    );
  }
}

class MenuRecordCard extends StatelessWidget{
  const MenuRecordCard ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
      // color: Colors.white,
      height: 100,
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
          childAspectRatio: 1 / 0.3,
        ),
        children: [
          Icon(Icons.restaurant, color: Colors.amber,),
          Icon(Icons.local_drink, color: Colors.cyan,),
          Icon(Icons.delete_outline, color: Colors.red,),
          Icon(Icons.videocam, color: Colors.lightGreen,),
          Text("Food", textAlign: TextAlign.center,),
          Text("Water", textAlign: TextAlign.center,),
          Text("Clean", textAlign: TextAlign.center,),
          Text("Camera", textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}

class TimeCard extends StatelessWidget{
  const TimeCard ({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime= DateTime.now();
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      // color: Colors.white,
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(187,215,216,0.5),
            // offset: Offset(5, 5),
          ),
        ],
      ),

      child: Row(
        children: [
        // SizedBox(width: 20,),
        //右侧字体
        Expanded(
          child:Container(
            alignment: Alignment.center,
            child: Text(
              dateTime.year.toString() + " - " + dateTime.month.toString() + " - " + dateTime.day.toString(),
              style: TextStyle(fontSize: 16),
            ),
          )
        )
      ]
    )
  );

      // child: GridView(
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 7,
      //     mainAxisSpacing: 1,
      //     crossAxisSpacing: 1,
      //     childAspectRatio: 1 / 0.4,
      //   ),
      //   children: [
      //     Text("6", textAlign: TextAlign.center,),
      //     Text("7", textAlign: TextAlign.center,),
      //     Text("8", textAlign: TextAlign.center,),
      //     Text("9", textAlign: TextAlign.center,),
      //     Text("10", textAlign: TextAlign.center,),
      //     Text("11", textAlign: TextAlign.center,),
      //     Text("12", textAlign: TextAlign.center,),
      //   ],
      // ),

  }
}

class FeederCard  extends StatelessWidget{
  // const FeederCard ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      padding: EdgeInsets.fromLTRB(10, 25, 10, 25),
      // color: Colors.white,
      height: 470,
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
      // child: Scaffold(
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 1,
          childAspectRatio: 1 / 0.2,
          ),
        children: [
          Row(
            children: [
              Icon(Icons.restaurant),//圆点
              SizedBox(width: 10,),
              Container(
                child: Text(
                  "13:22",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(width: 10,),
              Container(
                child: Text(
                  "Nana got 35g of food",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),
                alignment: Alignment.centerLeft,
              )
            ],
          ),
          Row(
            children: [
              buildLine(height: 20),//线条
              SizedBox(width: 10,),
              //右侧字体
              Expanded(
                child:Container(
                  child: Text(
                    'Remark: Nana has been ate xx g',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.restaurant),//圆点
              SizedBox(width: 10,),
              Container(
                child: Text(
                  "16:23",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(width: 10,),
              Container(
                child: Text(
                  "Nana got 35g of food",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),
                alignment: Alignment.centerLeft,
              )
            ],
          ),
          Row(
            children: [
              buildLine(height: 20),//线条
              SizedBox(width: 10,),
              //右侧字体
              Expanded(
                child:Container(
                  child: Text(
                    'Remark: Nana has been ate xx g',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.local_drink),//圆点
              SizedBox(width: 10,),
              Container(
                child: Text(
                  "17:12",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(width: 10,),
              Container(
                child: Text(
                  "Nana get 100ml of water",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),
                alignment: Alignment.centerLeft,
              )
            ],
          ),
          Row(
            children: [
              buildLine(height: 20),//线条
              SizedBox(width: 10,),
              //右侧字体
              Expanded(
                child:Container(
                  child: Text(
                    'Remark: xxxxxxxxxx',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.videocam),//圆点
              SizedBox(width: 10,),
              Container(
                child: Text(
                  "18:30",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(width: 10,),
              Container(
                child: Text(
                  "Start Video",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),
                alignment: Alignment.centerLeft,
              )
            ],
          ),
          Row(
            children: [
              buildLine(height: 20),//线条
              SizedBox(width: 10,),
              //右侧字体
              Expanded(
                child:Container(
                  child: Text(
                    'Remark: Video with Nana for 13 minutes',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.restaurant),//圆点
              SizedBox(width: 10,),
              Container(
                child: Text(
                  "21:01",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(width: 10,),
              Container(
                child: Text(
                  "Nana got 10g of food",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),
                alignment: Alignment.centerLeft,
              )
            ],
          ),
          Row(
            children: [
              buildLine(height: 20),//线条
              SizedBox(width: 10,),
              //右侧字体
              Expanded(
                child:Container(
                  child: Text(
                    'Remark: Nana has been ate xx g food',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
            ],
          ),
        ]
      )
    );
  }

  double leftWidth=20;

  //是否签收 当前块可以自己diy
  buildContent(bool result){
    return  Container(
      color: Colors.white,
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.restaurant),//圆点
              SizedBox(width: 10,),
              Container(
                child: Text(
                  "13:22",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(width: 10,),
              Container(
                child: Text(
                  "Nana got 35g of food",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16
                  ),
                ),
                alignment: Alignment.centerLeft,
              )
            ],
          ),
          Row(
            children: [
              buildLine(height: 20),//线条
              SizedBox(width: 10,),
              //右侧字体
              Expanded(
                child:Container(
                  child: Text(
                    'Remark: Nana has been ate xx g',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.restaurant),//圆点
              SizedBox(width: 10,),
              Container(
                child: Text(
                  "16:23",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(width: 10,),
              Container(
                child: Text(
                  "Nana got 35g of food",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),
                alignment: Alignment.centerLeft,
              )
            ],
          ),
          Row(
            children: [
              buildLine(height: 20),//线条
              SizedBox(width: 10,),
              //右侧字体
              Expanded(
                child:Container(
                  child: Text(
                    'Remark: Nana has been ate xx g',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.local_drink),//圆点
              SizedBox(width: 10,),
              Container(
                child: Text(
                  "17:12",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(width: 10,),
              Container(
                child: Text(
                  "Nana get 100ml of water",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),
                alignment: Alignment.centerLeft,
              )
            ],
          ),
          Row(
            children: [
              buildLine(height: 20),//线条
              SizedBox(width: 10,),
              //右侧字体
              Expanded(
                child:Container(
                  child: Text(
                    'Remark: xxxxxxxxxx',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.videocam),//圆点
              SizedBox(width: 10,),
              Container(
                child: Text(
                  "18:30",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(width: 10,),
              Container(
                child: Text(
                  "Start Video",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),
                alignment: Alignment.centerLeft,
              )
            ],
          ),
          Row(
            children: [
              buildLine(height: 20),//线条
              SizedBox(width: 10,),
              //右侧字体
              Expanded(
                child:Container(
                  child: Text(
                    'Remark: Video with Nana for 13 minutes',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.restaurant),//圆点
              SizedBox(width: 10,),
              Container(
                child: Text(
                  "21:01",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(width: 10,),
              Container(
                child: Text(
                  "Nana got 10g of food",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                ),
                alignment: Alignment.centerLeft,
              )
            ],
          ),
          Row(
            children: [
              buildLine(height: 20),//线条
              SizedBox(width: 10,),
              //右侧字体
              Expanded(
                child:Container(
                  child: Text(
                    'Remark: Nana has been ate xx g food',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  //物流线条
  // height 线条总高度
  // line:每一个线条高度
  //margin:每个线条间隔
  //width:线条总宽度
  //lineWidth:线条宽度
  buildLine({double height:20,double line:5,double margin:3,double width:1}){
    int length = 5;
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
      width: 5,//当前线条需要的总宽度
      child: Container(
        width: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(length, (index) => Container(
            width: width,
            height: line,
            color: Colors.black,
            margin: EdgeInsets.symmetric(vertical: margin),
          ),
          ),
        ),
      ),
    );
  }


  //圆点
  // buildCircle(bool result) {
  //   return Container(
  //     child: result ? Icon(Icons.restaurant) : Center(
  //       child: Container(
  //         alignment: Alignment.center,
  //         width: 12,
  //         height: 12,
  //         decoration: BoxDecoration(
  //             color: Colors.black,
  //             borderRadius: BorderRadius.circular(50)
  //         ),
  //       ),
  //     ),
  //     width: leftWidth,
  //   );
  // }

  // Color rgba(r,g,b,double opacity){
  //   return Color.fromRGBO(r,g,b,opacity);
  // }
        // child: ListView(
        //   children: [
        //     Card(
        //         child: Column(
        //           children: [
        //             ListTile(
        //               title: const Text(
        //                 "Feed xx g pet food",
        //                 style: TextStyle(fontSize: 24),
        //               ),
        //               subtitle: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: const [
        //                   SizedBox(height: 20), // 添加 10 的间距
        //                   Text("Time: 13:22 28/02/2023"),
        //                 ],
        //               ),
        //             ),
        //             const Divider(),
        //             const ListTile(
        //               title: Text("Remark: Nana has been ate xx g"),
        //             ),
        //             const ListTile(
        //               title: Text("Recommend: Please do not let Nana ate more food"),
        //             ),
        //           ],
        //         )
        //     ),
        //     Card(
        //         child: Column(
        //           children: [
        //             ListTile(
        //               title: const Text(
        //                 "Feed xx g pet food",
        //                 style: TextStyle(fontSize: 24),
        //               ),
        //               subtitle: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: const [
        //                   SizedBox(height: 20), // 添加 10 的间距
        //                   Text("Time: 13:22 28/02/2023"),
        //                 ],
        //               ),
        //             ),
        //             const Divider(),
        //             const ListTile(
        //               title: Text("Remark: Nana has been ate xx g"),
        //             ),
        //             const ListTile(
        //               title: Text("Recommend: Please do not let Nana ate more food"),
        //             ),
        //           ],
        //         )
        //     ),
        //     Card(
        //         child: Column(
        //           children: [
        //             ListTile(
        //               title: const Text(
        //                 "Feed xx g pet food",
        //                 style: TextStyle(fontSize: 24),
        //               ),
        //               subtitle: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: const [
        //                   SizedBox(height: 20), // 添加 10 的间距
        //                   Text("Time: 13:22 28/02/2023"),
        //                 ],
        //               ),
        //             ),
        //             const Divider(),
        //             const ListTile(
        //               title: Text("Remark: Nana has been ate xx g"),
        //             ),
        //             const ListTile(
        //               title: Text("Recommend: Please do not let Nana ate more food"),
        //             ),
        //           ],
        //         )
        //     ),
        //     Card(
        //         child: Column(
        //           children: [
        //             ListTile(
        //               title: const Text(
        //                 "Feed xx g pet food",
        //                 style: TextStyle(fontSize: 24),
        //               ),
        //               subtitle: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: const [
        //                   SizedBox(height: 20), // 添加 10 的间距
        //                   Text("Time: 13:22 28/02/2023"),
        //                 ],
        //               ),
        //             ),
        //             const Divider(),
        //             const ListTile(
        //               title: Text("Remark: Nana has been ate xx g"),
        //             ),
        //             const ListTile(
        //               title: Text("Recommend: Please do not let Nana ate more food"),
        //             ),
        //           ],
        //         )
        //     ),
        //   ],
        // )
  //   );
  // }
}