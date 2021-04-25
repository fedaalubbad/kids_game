import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kids_test_game/model/images.dart';
import 'ColorsWidget.dart';
// class StrucureWidgetScreen extends StatefulWidget{
//   static const routName='/StrucureScreen';
//   ImageData imageData;

//   @override
//   State<StatefulWidget> createState() {
//      return StructureState();
//
//   }
//
// }
class StructureState extends StatelessWidget{
  List<Images> imageList;
  Function scoreFunction;
  Function animateFunction;
  Map<String, bool> score;
  int seed = 0;
  double valu=0.0;
  int currentIndex;
  StructureState(this.currentIndex,this.imageList,this.scoreFunction,this.score,this.seed,this.animateFunction);

  ScrollController scrollController=ScrollController();
  @override
  Widget build(BuildContext context) {
    return
      // Container(
      // appBar: AppBar(
      //     title: Text('struct'),
      //     backgroundColor: Colors.pink),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.refresh),
      //   onPressed: () {
      //     // setState(() {
      //     //
      //     // });
      //   },
      // ),
      // drawer: DrawerWidget(),
      // body:
        Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 450,
                child: Expanded(
                  child: GridView.builder(
                    itemCount: imageList[0].peices.keys.length,
                    itemBuilder: (ctx,index){
                      return buildDragableTargetContent(imageList[currentIndex].peices.keys.toList()[index],);
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                    ),

                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 70,
                child: Expanded(
                  child: ListView(
                    children: imageList[currentIndex].peices.keys.map((eKey) {
                      return Draggable<String>(
                        data: eKey,
                        child: buildDragableContent(score[eKey] == true ? 'right' :'asset',eKey),
                        feedback: buildDragableContent('asset',eKey),
                        childWhenDragging:buildDragableContent('dragging',eKey),

                      );
                        }).toList()
                      ..shuffle(Random(seed)),
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,

                  ),
                ),
              ),
              SizedBox(height: 10,),
              Slider(
                value: valu,
                onChanged:(val){
                  animateFunction(valu,val,scrollController);
                },
                min: 1.0,
                max: 20.0,
                divisions: 10,
                activeColor: Colors.green,

              ),
            ],
          ),
        ),
      //
      // ),
    );

  }

  Container buildDragableContent(String state,String eKey){
    return
      state=='right'?
      Container(
      alignment: Alignment.center,
        margin: EdgeInsets.only(left: 2,right: 2),
        decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(2),
          // image: DecorationImage(image: AssetImage(asset),fit: BoxFit.cover)
      ),
      child: Icon(Icons.check,color: Colors.green,size: 50,),
      height: 70,
      width: 70,
    ) 
      :state=='dragging'?
      Container(
      margin: EdgeInsets.only(left: 2,right: 2),
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(2),
        // image: DecorationImage(image: AssetImage(asset),fit: BoxFit.cover)
      ),
      height: 70,
      width: 70,)
          :Container(
      margin: EdgeInsets.only(left: 2,right: 2),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(2),
        image: DecorationImage(image: AssetImage(imageList[currentIndex].peices[eKey]),fit: BoxFit.cover)
      ),
      height: 70,
      width: 70,
    );
  }
  Widget buildDragableTargetContent(String key){
    return DragTarget<String>(
        builder: (BuildContext context, List<String> incoming, List rejected) {
      if (score[key] == true) {
        return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              image: DecorationImage(
              image: AssetImage(imageList[currentIndex].peices[key]), fit: BoxFit.cover),
              color: Colors.grey,
            ),
            height: 100,
            width: 100,
            // color: Colors.grey,
          );
      }else {
        return
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
            color: Colors.grey,
            //   image: DecorationImage(
            //       image: AssetImage(imageList[0].peices[key]),
            //       fit: BoxFit.cover),
            //   color: Colors.grey,
            ),
            height: 100,
            width: 100,
            // color: Colors.grey,
          );
      }
        },
    onWillAccept: (data) => data == key,
    onAccept: (data) {
    // setState(() {
    //////////////////////
       scoreFunction(key);
    // score[key] = true;
    plyr.play('success.mp3');
    // });
    },
    onLeave: (data) {},
    );
  }

}