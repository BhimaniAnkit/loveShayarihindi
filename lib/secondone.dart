import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loveshayarihindi/data.dart';
import 'package:loveshayarihindi/third.dart';

class secondone extends StatefulWidget {

  int index;
  secondone(this.index);

  @override
  State<secondone> createState() => _secondoneState();
}

class _secondoneState extends State<secondone> {

  List shayari = [];

  @override
  void initState() {
    if(widget.index == 0)
    {
      shayari = data.best;
    }
    else if(widget.index == 1)
    {
      shayari = data.friendship;
    }
    else if(widget.index == 2)
    {
      shayari = data.funny;
    }
    else if(widget.index == 3)
    {
      shayari = data.god;
    }
    else if(widget.index == 4)
    {
      shayari = data.inspiration;
    }
    else if(widget.index == 5)
    {
      shayari = data.life;
    }
    else if(widget.index == 6)
    {
      shayari = data.love;
    }
    else if(widget.index == 7)
    {
      shayari = data.memories;
    }
    else if(widget.index == 8)
    {
      shayari = data.other;
    }
    else if(widget.index == 9)
    {
      shayari = data.politics;
    }
    else if(widget.index == 10)
    {
      shayari = data.love_shayari;
    }
    else if(widget.index == 11)
    {
      shayari = data.dard;
    }
    else
    {
      shayari = data.alcohol;
    }
    setState(() {});
  }

  // List<bool> temp = List.filled(data.name.length, false);



  @override
  Widget build(BuildContext context) {

    List<bool> temp = List.filled(shayari.length, false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("00b36b"),
        title: Text("Love Shayari",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
        actions: [
          PopupMenuButton(itemBuilder: (context) => [
            PopupMenuItem(child: Text("Settings")),
            PopupMenuItem(child: Text("Rate Us")),
            PopupMenuItem(child: Text("Share")),
            PopupMenuItem(child: Text("More Apps 1")),
            PopupMenuItem(child: Text("More Apps 2"))
          ],)
        ],
      ),
      body: ListView.builder(
        itemCount: shayari.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTapUp: (details) {
              temp[index] = false;
              Duration(microseconds: 1000);
              setState(() {});
            },
            onTapCancel: () {
              temp[index] = false;
              Duration(microseconds: 1000);
              setState(() {});
            },
            onTapDown: (details) {
              temp[index] = true;
              Duration(microseconds: 1000);
              setState(() {});
            },
            child: Card(
              margin: EdgeInsets.all(3.0),
              child: ListTile(
                tileColor: (temp[index] == true) ? HexColor("b32d00") : HexColor("#ff33cc"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return third(index,shayari,widget.index);
                  },));
                },
                trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
                leading: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset("pic/${data.images[widget.index]}"),
                ),
                title: Text("${shayari[index]}",maxLines: 1,style: TextStyle(fontSize: 20,color: Colors.white),),
                // subtitle: Text("${index}"),
              ),
            ),
          );
      },),
    );
  }
}
