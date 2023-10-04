import 'dart:math';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loveshayarihindi/data.dart';
import 'package:share_plus/share_plus.dart';
import 'forth.dart';

class third extends StatefulWidget {
  int pos;
  List shayari;
  int index;
  third(this.pos,this.shayari,this.index);


  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {

  PageController controller = PageController();
  int col_ind = 0;
  int r = 0;
  bool t = false;

  @override
  void initState() {
    controller = PageController(initialPage: widget.pos);
  }

  @override
  Widget build(BuildContext context) {

    double screen = MediaQuery.of(context).size.height;
    double status = MediaQuery.of(context).padding.top;
    double app = kToolbarHeight;
    double t_height = screen - status - app;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("00b36b"),
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
                        height: t_height,
                        child: GridView.builder(
                          itemCount: data.colors.length - 1,
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
                    "${widget.pos + 1}/${widget.shayari.length}",
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
            controller: controller,
            onPageChanged: (value) {
              widget.pos = value;
              setState(() {});
            },
            itemBuilder: (context, index) {
              return Container(
                // color: Colors.yellow,
                alignment: Alignment.center,
                height: 200,
                width: 200,
                child: Text("${widget.shayari[index]}"),
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
              color: HexColor("00b36b"),
              // color: Colors.green.shade900,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () {
                  // FlutterClipboard.copy('${widget.shayari[widget.index]}').then((value) => print('copied'));
                  FlutterClipboard.copy("${widget.shayari[widget.pos]}").then((value) {
                    // AssetImage("pic/${widget.shayari[widget.index]}");
                    print("copied");
                  });
                  FlutterClipboard.copy('${widget.shayari[widget.pos]}')
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
                  splashRadius: 35.0,
                ),

                IconButton(onPressed: () {
                  if(widget.pos > 0){
                    widget.pos--;
                    controller!.jumpToPage(widget.pos);
                    setState(() {});
                  }
                },
                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                  iconSize: 30,
                  hoverColor: HexColor("#b30000"),
                  splashColor: HexColor("#b30000"),
                  splashRadius: 35.0,
                ),

                IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return forth(widget.shayari,widget.pos,widget.index);
                  },));
                },
                  icon: Icon(Icons.edit),
                  iconSize: 30,
                  splashColor: HexColor("#b30000"),
                  hoverColor: HexColor("#b30000"),
                  splashRadius: 35.0,
                ),

                IconButton(onPressed: () {
                  if(widget.pos < widget.shayari.length - 1){
                    widget.pos++;
                    controller!.jumpToPage(widget.pos);
                    setState(() {});
                  }
                },
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                  iconSize: 30,
                  hoverColor: HexColor("#b30000"),
                  splashColor: HexColor("#b30000"),
                  splashRadius: 35.0,
                ),

                IconButton(onPressed: () {
                  Share.share('${widget.shayari[widget.pos]}');
                  setState(() {});
                },
                  icon: Icon(Icons.share),
                  iconSize: 30,
                  hoverColor: HexColor("#b30000"),
                  splashColor: HexColor("#b30000"),
                  splashRadius: 35.0,
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
