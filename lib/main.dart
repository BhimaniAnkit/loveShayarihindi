import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loveshayarihindi/data.dart';
import 'package:loveshayarihindi/second.dart';
import 'package:loveshayarihindi/secondone.dart';
import 'package:loveshayarihindi/setting.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: shayari(),
  ));
}

class shayari extends StatefulWidget {
  const shayari({super.key});

  @override
  State<shayari> createState() => _shayariState();
}

class _shayariState extends State<shayari> {
  
  List <bool> temp = List.filled(data.name.length, false);

  @override
  void initState() {
    get();
  }

  get() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      // You can request multiple permissions at once.
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.storage,
      ].request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        // backgroundColor: Colors.green.shade600,
        backgroundColor: HexColor("00b36b"),
        title: Text("Love Shayari",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
        actions: [
          PopupMenuButton(itemBuilder: (context) => [
            PopupMenuItem(child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return setting();
                  // return Settings();
                },));
              },
              child: Text ("Settings"),
            )),
            PopupMenuItem(child: Text("Rate Us")),
            PopupMenuItem(child: Text("Share")),
            PopupMenuItem(child: Text("More Apps 1")),
            PopupMenuItem(child: Text("More Apps 2"))
          ],)
        ],
      ),
      backgroundColor: Colors.grey,
      body: ListView.builder(
        itemCount: data.name.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTapUp: (details) {
              temp[index] = false;
              Duration(microseconds: 500);
              setState(() {});
            },
            onTapCancel: () {
              temp[index] = false;
              Duration(microseconds: 500);
              setState(() {});
            },
            onTapDown: (details) {
              temp[index] = true;
              Duration(microseconds: 500);
              setState(() {});
            },
            child: Card(
              elevation: 50,
              margin: EdgeInsets.all(5.0),
              child: ListTile(
                tileColor: (temp[index] == true) ? Colors.pink.shade900 : null,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return secondone(index);
                  },));
                },
                trailing: (temp[index] == true) ? Icon(Icons.navigate_next_outlined) : null,
                leading: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset("pic/${data.images[index]}"),
                ),
                dense: true,
                horizontalTitleGap: 20,
                title: Text("${data.name[index]}",style: TextStyle(fontSize: 20,color: Colors.green.shade800),),
              ),
            ),
          );
      },),
    );
  }
}

// return InkWell(
// onTapUp: (details) {
// temp[index] = false;
// Duration(microseconds: 500);
// setState(() {});
// },
// onTapCancel: () {
// temp[index] = false;
// Duration(microseconds: 500);
// setState(() {});
// },
// onTapDown: (details) {
// temp[index] = true;
// Duration(microseconds: 500);
// setState(() {});
// },
// child: Card(
// elevation: 50,
// margin: EdgeInsets.all(5.0),
// child: ListTile(
// tileColor: (temp[index] == true) ? Colors.pink.shade700 : null,
// onTap: () {
// Navigator.push(context, MaterialPageRoute(builder: (context) {
// return second(index);
// },));
// },
// trailing: (temp[index] == true) ? Icon(Icons.navigate_next_outlined): null,
// leading: Container(
// height: 40,
// width: 40,
// child: Image.asset("pic/${data.images[index]}"),
// ),
// horizontalTitleGap: 20,
// title: Text("${data.name[index]}",style: TextStyle(color: Colors.green.shade800),),
// ),
// ),
// );


