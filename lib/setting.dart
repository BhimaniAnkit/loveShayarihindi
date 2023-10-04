
import 'package:flutter/material.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(

        );
      },),
      // body: Column(
      //   children: [
      //     Expanded(child: Row(
      //       children: [
      //         Expanded(child: Container(
      //           margin: EdgeInsets.all(10.0),
      //           height: 40,
      //           width: 40,
      //           child: Text("Emoji Settings",style: TextStyle(fontSize: 20),),
      //
      //         ))
      //       ],
      //     )),
      //     Expanded(child: Row(
      //       children: [
      //         Expanded(child: Container(
      //           margin: EdgeInsets.all(10.0),
      //           alignment: Alignment.center,
      //           height: 40,
      //           width: 40,
      //           child: Text("Emoji",style: TextStyle(color: Colors.white),),
      //           decoration: BoxDecoration(
      //             // border: Border.all(width: 1.0,),
      //             color: Colors.green.shade700,
      //           ),
      //         )),
      //         Expanded(child: Container(
      //           margin: EdgeInsets.all(10.0),
      //           alignment: Alignment.center,
      //           height: 40,
      //           width: 40,
      //           child: Text("No Emoji",style: TextStyle(color: Colors.white),),
      //           decoration: BoxDecoration(
      //             // border: Border.all(width: 1.0,),
      //             color: Colors.green.shade700,
      //           ),
      //         )),
      //       ],
      //     ))
      //   ],
      // ),
    );
  }
}
