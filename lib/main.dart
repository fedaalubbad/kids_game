import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:kids_test_game/drawer.dart';
import 'package:kids_test_game/model/data.dart';
import 'file:///C:/Users/fedaa/Documents/flutterPro/kids_test_game/lib/pages/structWidget.dart';
import 'pages/ColorsWidget.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'openSans',
      ),
      debugShowCheckedModeBanner: false,
      // routes: {
      //   '/': (context) => Game(),
        // StrucureWidgetScreen.routName: (context) => StrucureWidgetScreen(),
        // ColorsWidgetScreen.routName: (context) => ColorsWidgetScreen(),
      // },

      home: Game(),
    );
  }
}

class Game extends StatefulWidget {

  Game({Key key}) : super(key: key);

  createState() => GameState();
}

class GameState extends State<Game> {

  int index=0;
/// Map to keep track of score
  Map<String, bool> score={};
  @override
  void initState() {
    super.initState();
    score={};
  }
// Random seed to shuffle order of items.
  int seed = 0;
   void setScore(emoji){
   score[emoji]=true ;
   setState(() {
   });
 }
  animateTo(valu,val,contraller){
  valu=val;
  // if(val<100)
  valu=val*100;
  setState(() {});
  contraller.animateTo(val, duration: Duration(milliseconds: 1), curve: Curves.easeIn);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Score ${widget.score.length} / 6'),
      title: Text('Score ${score.length} / 6'),
      backgroundColor: Colors.pink),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            score.clear();
            seed++;
          });
        },
      ),

      body: index==0 ?  StructureState(ImageData.images,setScore,score,seed,animateTo):ColorsWidgetScreen(ImageData.choices,setScore,score,seed),
      drawer: Drawer(
          child: Container(
            width: 200,
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/kids.jpg'),
                        fit: BoxFit.cover),
                  ),),
                ListTile(trailing:Icon(Icons.arrow_forward_ios,color: Colors.white,),
                    leading:Icon(Icons.color_lens,color: Colors.pink,),
                    title: Text('Colors',style: TextStyle(
                    fontSize: 26,
                    fontWeight:FontWeight.bold
                )),
                  onTap: () {
                    index= 0;
                    score.clear();
                    seed=0;
                    Navigator.of(context).pop();
                    setState(() {
                    });
                  },),
                Divider(height: 1.5, color: Colors.brown,),
                ListTile(trailing:Icon(Icons.arrow_forward_ios,color: Colors.white,),
                  leading:Icon(Icons.streetview,color: Colors.pink,),
                  title: Text('Structures',style: TextStyle(
                    fontSize: 26,
                    fontWeight:FontWeight.bold
                ),),
                  onTap: () {
                   index= 1;
                    score.clear();
                    seed=0;
                   Navigator.of(context).pop();
                   setState(() {
                    });
                  },),

              ],
            ),
          )
      ),
    );
  }
}


