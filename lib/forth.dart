import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:external_path/external_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loveshayarihindi/data.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class forth extends StatefulWidget {
  List shayari;
  int pos;
  int index;
  forth(this.shayari,this.pos,this.index);


  @override
  State<forth> createState() => _forthState();
}

class _forthState extends State<forth> {

  bool temp = true, col = true, tcol = true;
  int col_index = 0;
  bool t = false;
  int r = 0;
  Color c = Colors.pink, d = Colors.black;
  double a = 20;
  List font = ["f1","f2","f3","f4","f5","f6","f7","f8","f9","f10","f11","f12","f13","f14","f15","f16","f17","f18","f19","f20",
    "f21","f22","f23","f24","f25","f26","f27","f28","f29","f30"];
  String cur_font = "f1";
  String emoji = "🤨🤨🤨🤨";
  int e = data.emoji.length;
  double size = 20;

  WidgetsToImageController controller = WidgetsToImageController();
  // to save image bytes of widget
  Uint8List? bytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        title: Text(
          "फोटो पे शायरी लिखे",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Row(
            // verticalDirection: VerticalDirection.up,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(child: WidgetsToImage(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 10.0,left: 10.0,top: 40.0,bottom: 30.0),
                  height: double.infinity,
                  width: double.infinity,
                  // color: Colors.red,
                  child: SingleChildScrollView(
                    child: Text("${emoji}""\n\n${widget.shayari[widget.pos]}""\n\n${emoji}",
                      style: TextStyle(fontSize: size,color: d,fontFamily: cur_font),),
                  ),
                  // child: Text("${emoji}""\n\n${widget.s[widget.index]}""\n\n${emoji}",
                  //   style: TextStyle(fontSize: size,color: d,fontFamily: cur_font),),
                  decoration: BoxDecoration(
                    color: (t==false)?c:null,
                    gradient: (t==true)?LinearGradient(colors: [data.colors[col_index],
                      data.colors[col_index + 1]]) : null,
                  ),
                ),
                controller: controller,
              ),),

            ],
          )),
          Row(
            children: [
              Expanded(child: Container(
                margin: EdgeInsets.only(top: 30.0,bottom: 30.0),
                height: 200,
                width: double.infinity,
                color: Colors.brown.shade700,

                child: Column(
                  children: [
                    Expanded(child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            t = true;
                            int s_random = Random().nextInt(data.colors.length - 1);
                            col_index = s_random;
                            setState(() {});
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 120.0,top: 5.0,bottom: 5.0),
                            // padding: EdgeInsets.only(bottom: 30.0),
                            height: 50,
                            width: 50,
                            color: Colors.white,
                            // child: Icon(Icons.cached_rounded,size: 45,),
                            child: Image.asset("pic/reload.png"),
                          ),
                        )),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context, builder: (context) {
                                return Container(
                                  // height: t_height,
                                  height: double.infinity,
                                  child: GridView.builder(
                                    itemCount: data.colors.length - 1,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5,
                                    ),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          t = true;
                                          col_index = index;
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              data.colors[index],
                                              data.colors[index + 1]
                                            ]),
                                          ),
                                        ),
                                      );
                                    },),
                                );
                              },);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right:120.0,top: 5.0,bottom: 5.0,),
                              height: 50,
                              width: 50,
                              // width: 100,
                              color: Colors.white,
                              child: Image.asset("pic/expand.png",),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ),
                    Expanded(child: Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                    height: 200,
                                    child: Row(
                                      children: [
                                        Expanded(child: GridView.builder(
                                          itemCount: data.colors.length,
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 5,
                                              mainAxisSpacing: 5,
                                              crossAxisSpacing: 5
                                          ),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                t = false;
                                                c = data.colors[index];
                                                Navigator.pop(context);
                                                setState(() {});
                                              },
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                color: data.colors[index],
                                              ),
                                            );
                                          },),),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(top: 5,bottom: 170,left: 5,right: 5),
                                            height: 30,
                                            width: 30,
                                            child: Image.asset("pic/close.png"),
                                          ),
                                        )
                                      ],
                                    )
                                );
                              },);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10.0),
                            height: 70,
                            width: 100,
                            color: Colors.red.shade600,
                            child: Text("Background",style: TextStyle(fontSize: 20,color: Colors.white),),
                          ),
                        )),
                        Expanded(child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                    height: 200,
                                    child: Row(
                                      children: [
                                        Expanded(child: GridView.builder(
                                          itemCount: data.colors.length,
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 8,
                                            mainAxisSpacing: 3,
                                            crossAxisSpacing: 3,
                                          ),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                // t = false;
                                                d = data.colors[index];
                                                Navigator.pop(context);
                                                setState(() {

                                                });
                                              },
                                              child: Container(
                                                height: 10,
                                                width: 10,
                                                color: data.colors[index],

                                              ),
                                            );
                                          },),),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                            setState(() {

                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 160,right: 5,left: 5),
                                            height: 30,
                                            width: 30,
                                            child: Image.asset("pic/close.png"),
                                          ),
                                        ),
                                      ],
                                    )
                                );
                              },);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10.0),
                            height: 70,
                            width: 100,
                            color: Colors.red.shade600,
                            child: Text("Text Color",style: TextStyle(fontSize: 20,color: Colors.white),),
                          ),
                        ),),
                        Expanded(child: InkWell(
                          onTap: ()  async {
                            final bytes = await controller.capture();
                            var path = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS) + "/pic";
                            print(path);
                            Directory dir = Directory(path);

                            if(! await dir.exists()){
                              dir.create();
                            }

                            int r_images = Random().nextInt(100);
                            String img_name = "${r_images}.jpg";
                            File f = File("${dir.path}/${img_name}");

                            await f.writeAsBytes(bytes!);

                            // Share.shareXFiles([XFile('${f.path}')],text: 'Great Image');
                            Share.shareXFiles([XFile('${f.path}')],text: 'Shayar := Ankit Bhimani');
                            setState(() {

                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10.0),
                            height: 70,
                            width: 100,
                            color: Colors.red.shade600,
                            child: Text("Share",style: TextStyle(fontSize: 20,color: Colors.white),),
                          ),
                        )),
                      ],
                    )),
                    Expanded(child: Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: () {
                            showModalBottomSheet(context: context, builder: (context) {
                              return Container(
                                height: 300,
                                child: Row(
                                  children: [
                                    Expanded(child: ListView.builder(
                                      itemCount : font.length,
                                      itemBuilder: (context, index) {
                                        return Card(
                                          child: InkWell(
                                            onTap: () {
                                              cur_font = font[index];
                                              Navigator.pop(context);
                                              setState(() {

                                              });
                                            },
                                            child: ListTile(
                                              tileColor: Colors.grey,
                                              title: Text("Shayari"),
                                            ),
                                          ),
                                        );
                                      },)),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        setState(() {

                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 260,right: 5),
                                        height: 30,
                                        width: 30,

                                        child: Image.asset("pic/close.png"),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10.0),
                            height: 70,
                            width: 100,
                            color: Colors.red.shade800,
                            child: Text("Font",style: TextStyle(fontSize: 20, color: Colors.white),),
                          ),
                        )),
                        Expanded(child: InkWell(
                          onTap: () {
                            showModalBottomSheet(context: context, builder: (context) {
                              return Container(
                                  height: 300,
                                  child: Row(
                                    children: [
                                      Expanded(child: ListView.builder(
                                        itemCount: data.emoji.length,
                                        itemBuilder: (context, index) {
                                          return Card(
                                            child: InkWell(
                                              onTap: () {
                                                // data.emoji[index] = emoji_1.length;
                                                emoji = data.emoji[index];
                                                Navigator.pop(context);
                                                setState(() {

                                                });
                                              },
                                              child: ListTile(
                                                tileColor: Colors.grey,
                                                title: Text('${data.emoji[index]}'),
                                              ),
                                            ),
                                          );
                                        },),),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                          setState(() {

                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 260,right: 5),
                                          height: 30,
                                          width: 30,

                                          child: Image.asset("pic/close.png"),
                                        ),
                                      )
                                    ],
                                  )
                              );
                            },);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10.0),
                            height: 70,
                            width: 100,
                            color: Colors.red.shade600,
                            child: Text("Emoji",style: TextStyle(fontSize: 20,color: Colors.white),),
                          ),
                        )),
                        Expanded(child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                    height: 200,
                                    child: Row(
                                      children: [
                                        Expanded(child: StatefulBuilder(builder: (context, setState1) {
                                          return Slider(
                                            max: 100,
                                            min: 10,
                                            value: size,
                                            activeColor: CupertinoColors.activeOrange,
                                            inactiveColor: CupertinoColors.activeBlue,
                                            onChanged: (value) {
                                              size = value;
                                              setState(() {});
                                              setState1(() {});
                                            },);
                                        },),),

                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                            setState(() {

                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 150.0,right: 5),
                                            height: 30,
                                            width: 30,
                                            child: Image.asset("pic/close.png"),
                                          ),
                                        ),
                                      ],
                                    )
                                );
                              },);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10.0),
                            height: 70,
                            width: 100,
                            color: Colors.red.shade600,
                            child: Text("Text Size",style: TextStyle(fontSize: 20,color: Colors.white),),
                          ),
                        ),),
                      ],
                    )),
                  ],
                  // ],
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
