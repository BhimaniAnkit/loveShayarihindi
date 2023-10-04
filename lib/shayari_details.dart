import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loveshayarihindi/data.dart';
import 'package:clipboard/clipboard.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loveshayarihindi/shayari.dart';
import 'package:share_plus/share_plus.dart';

class shayari_details extends StatefulWidget {
  List shayari;
  int index;

  shayari_details(this.shayari,this.index);


  // const shayari_details({super.key});


  @override
  State<shayari_details> createState() => _shayari_detailsState();
}

class _shayari_detailsState extends State<shayari_details> {


  PageController? pageController;
  int col_ind = 0;
  bool t = false;

  // List <bool> temp6 = List.filled(data.name.length, false);
  // List <bool> temp5 = List.filled(data.name.length, false);
  // List <bool> temp4 = List.filled(data.name.length, false);
  // List <bool> temp3 = List.filled(data.name.length, false);
  // List <bool> temp2= List.filled(data.name.length, false);

  @override
  void initState() {
 //  print(widget.shayari[widget.index]);
  //  print(widget.index);
    pageController = PageController(initialPage: widget.index);
  //   pageController = PageController(initialPage: widget.shayari[widget.index]);
  }

  @override
  Widget build(BuildContext context) {

    // double screen = MediaQuery.of(context).size.height;
    // double status = MediaQuery.of(context).padding.top;
    // double app = kToolbarHeight;
    // double t_height = screen - status - app;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Love Shayari",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
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

      body: Column(
        children: [
          Expanded(child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context, builder: (context) {
                        return Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  t = true;
                                  col_ind = index;
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  alignment: Alignment.center,
                                  child: Text("प्यार मोहब्बत शायरी",style: TextStyle(fontSize: 20,),),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [data.colors[index],data.colors[index + 1]]),
                                  ),
                                ),
                              );
                          },),
                        );
                    },);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(5.0),
                    child: Image.asset("pic/expand.png"),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  child: Text(
                    "${widget.index + 1}/${widget.shayari.length}",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                InkWell(
                  onTap: () {
                    t = true;
                    int random_color = Random().nextInt(data.colors.length - 1);
                    col_ind = random_color;
                    setState(() {});
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.only(right: 5.0,left: 5.0,top: 5.0,bottom: 5.0),
                    child: Image.asset("pic/reload.png"),
                  ),
                ),
              ],
            ),
          )),
       Expanded(flex: 5,child: PageView.builder(
         itemCount: widget.shayari.length,
         controller: pageController,
         onPageChanged: (value) {
           widget.index = value;
           setState(() {});
         },
         itemBuilder: (context, index) {
          return Container(
            // color: Colors.yellow,
            alignment: Alignment.center,
            height: 200,
            width: 200,
            child: Text("${widget.shayari[widget.index]}"),
           decoration: BoxDecoration(
                           color: (t == false) ? Colors.pink.shade500 : null,
                           gradient: (t == true) ? LinearGradient(colors: [data.colors[col_ind],data.colors[col_ind + 1]]) : null,
                         ),
          );
          },)),
          Expanded(child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              // color: Colors.green.shade900,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () {
                  // FlutterClipboard.copy('${widget.shayari[widget.index]}').then((value) => print('copied'));
                  FlutterClipboard.copy("${widget.shayari[widget.index]}").then((value) {
                    // AssetImage("pic/${widget.shayari[widget.index]}");
                    print("copied");
                  });
                  FlutterClipboard.copy('${widget.shayari[widget.index]}')
                      .then((value) => print(''));
                  Fluttertoast.showToast(
                      msg: "Copy!..",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.SNACKBAR,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                icon: Icon(Icons.copy),
                  iconSize: 30,
                  hoverColor: HexColor("#b30000"),
                  splashColor: HexColor("#b30000"),
                ),

                IconButton(onPressed: () {
                  if(widget.index > 0){
                    widget.index--;
                    pageController!.jumpToPage(widget.index);
                    setState(() {});
                  }
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded),
                  iconSize: 30,
                  hoverColor: HexColor("#b30000"),
                  splashColor: HexColor("#b30000"),
                ),

                IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return shayari(widget.shayari,widget.index);
                  },));
                }, 
                icon: Icon(Icons.edit),
                  iconSize: 30,
                  splashColor: HexColor("#b30000"),
                  hoverColor: HexColor("#b30000"),
                ),

                IconButton(onPressed: () {
                  if(widget.index < widget.shayari.length - 1){
                    widget.index++;
                    pageController!.jumpToPage(widget.index);
                    setState(() {});
                  }
                },
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                  iconSize: 30,
                  hoverColor: HexColor("#b30000"),
                  splashColor: HexColor("#b30000"),
                ),

                IconButton(onPressed: () {
                  Share.share('${widget.shayari[widget.index]}');
                  setState(() {});
                },
                  icon: Icon(Icons.share),
                  iconSize: 30,
                  hoverColor: HexColor("#b30000"),
                  splashColor: HexColor("#b30000"),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}