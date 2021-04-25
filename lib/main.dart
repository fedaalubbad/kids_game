import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:kids_test_game/drawer.dart';
import 'package:kids_test_game/model/data.dart';
import 'package:kids_test_game/widgets/dropdown.dart';
import 'package:kids_test_game/widgets/imageDialog.dart';
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
  animateTo(valu,val,ScrollController contraller){
  valu=val;
  // if(val<100)
  valu=val*100;
  setState(() {});
  contraller.animateTo(valu, duration: Duration(milliseconds: 1), curve: Curves.easeIn);

}
int dropdownIndex=0;
   dropDown(val){
     if(dropdownIndex!=val) {score.clear();}

     dropdownIndex=val;
   print('indexofnow=$dropdownIndex');
   showDialog(context:context,child:ImageDialog(ImageData.images[dropdownIndex].asset));
  // showDialog(context: context,child: ad);
    setState(() {
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      actions: [index==0?DropDownBtn(ImageData.images,dropDown):Container()],
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

      body: index==0 ?  StructureState(dropdownIndex,ImageData.images,setScore,score,seed,animateTo):ColorsWidgetScreen(ImageData.choices,setScore,score,seed),
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
                    title: Text('Buzzle',style: TextStyle(
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
                  title: Text('Colors',style: TextStyle(
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


