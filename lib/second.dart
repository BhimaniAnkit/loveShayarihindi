import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loveshayarihindi/data.dart';
import 'package:loveshayarihindi/shayari_details.dart';

class second extends StatefulWidget {
  // const second({super.key});

  int index;
  second(this.index);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  List shayari = [];
  // List<bool> temp1 = List.filled(data.name.length, false);
  // List<bool> temp = List.filled(14, false);
  // List<bool> temp = List.filled(shayari.length, false);

  @override

  void initState() {
    super.initState();
    // s = data.
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
    setState(() {

    });
  }
 // List<bool> temp1 = List.filled(s.length, false);

  // List <bool> temp1 = List.filled(s.length, false);

  @override
  Widget build(BuildContext context) {

   // List<bool> temp1 = List.filled(shayari.length, false);

    // List <bool> temp1 = List.filled(s.length, false);

    return Scaffold(
      // backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.green,
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
         return InkWell(
           onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) {
                return shayari_details(shayari,index);
             },));
           },
           child: Card(child:
           ListTile(
             title: Text("${shayari[index]}",maxLines: 1,),
             // subtitle: Text("${index}"),
             leading: Container(
               height: 50,
               width: 50,
               child: Image.asset("pic/${data.images[widget.index]}"),
             ),
             trailing:Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,),
             // tileColor: (temp1[index]) ? HexColor("#b30000") : HexColor("#ff33cc"),
           ),),
         );
      },),
    );
  }
}
