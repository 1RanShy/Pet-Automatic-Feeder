import 'package:flutter/material.dart';

class RecordPage extends StatefulWidget{
  const RecordPage({super.key});

  _RecordPageState createState() => _RecordPageState();
}
class _RecordPageState extends State<RecordPage>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuRecordCard(),
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

class FeederCard  extends StatelessWidget{
  const FeederCard ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
      // color: Colors.white,
      height: 520,
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
      child: ListView(
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    "Feed xx g pet food",
                    style: TextStyle(fontSize: 24),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 20), // 添加 10 的间距
                      Text("Time: 13:22 28/02/2023"),
                    ],
                  ),
                ),
                const Divider(),
                const ListTile(
                  title: Text("Remark: Nana has been ate xx g"),
                ),
                const ListTile(
                  title: Text("Recommend: Please do not let Nana ate more food"),
                ),
              ],
            )
          ),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    "Feed xx g pet food",
                    style: TextStyle(fontSize: 24),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 20), // 添加 10 的间距
                      Text("Time: 13:22 28/02/2023"),
                    ],
                  ),
                ),
                const Divider(),
                const ListTile(
                  title: Text("Remark: Nana has been ate xx g"),
                ),
                const ListTile(
                  title: Text("Recommend: Please do not let Nana ate more food"),
                ),
              ],
            )
          ),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    "Feed xx g pet food",
                    style: TextStyle(fontSize: 24),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 20), // 添加 10 的间距
                      Text("Time: 13:22 28/02/2023"),
                    ],
                  ),
                ),
                const Divider(),
                const ListTile(
                  title: Text("Remark: Nana has been ate xx g"),
                ),
                const ListTile(
                  title: Text("Recommend: Please do not let Nana ate more food"),
                ),
              ],
            )
          ),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    "Feed xx g pet food",
                    style: TextStyle(fontSize: 24),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 20), // 添加 10 的间距
                      Text("Time: 13:22 28/02/2023"),
                    ],
                  ),
                ),
                const Divider(),
                const ListTile(
                  title: Text("Remark: Nana has been ate xx g"),
                ),
                const ListTile(
                  title: Text("Recommend: Please do not let Nana ate more food"),
                ),
              ],
            )
          ),
        ],
      )
    );
  }
}