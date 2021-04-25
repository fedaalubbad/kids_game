import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kids_test_game/model/choices.dart';

import '../drawer.dart';
class ColorsWidgetScreen extends StatefulWidget {
  List<Choices> choicesList;
  Function scoreFunction;
  Map<String, bool> score ;
  int seed ;
  ColorsWidgetScreen(this.choicesList,this.scoreFunction,this.score,this.seed);
  /// Map to keep track of score
  // Random seed to shuffle order of items.
  @override
  State<StatefulWidget> createState() {
    return ColorGame();
  }
}
class ColorGame extends State<ColorsWidgetScreen> {


  // /// Choices for game
  // final Map choices = {
  //   '🍏': Colors.green,
  //   '🍋': Colors.yellow,
  //   '🍅': Colors.red,
  //   '🍇': Colors.purple,
  //   '🥥': Colors.brown,
  //   '🥕': Colors.orange
  // };



  @override
  Widget build(BuildContext context) {
    return  Container(
       child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: widget.choicesList[0].choices.keys.map((emoji) {
                  return Draggable<String>(
                    data: emoji,
                    child: Emoji(emoji: widget.score[emoji] == true ? '✅' : emoji),
                    feedback: Emoji(emoji: emoji),
                    childWhenDragging: Emoji(emoji: '🌱'),
                  );
                }).toList()),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              widget.choicesList[0].choices.keys.map((emoji) => _buildDragTarget(emoji)).toList()
                ..shuffle(Random(widget.seed)),
            ),
          ],
        ),
    );

  }

  Widget _buildDragTarget(emoji) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
        if (widget.score[emoji] == true) {
          return Container(
            color: Colors.white,
            child: Text('Correct!'),
            alignment: Alignment.center,
            height: 80,
            width: 200,
          );
        } else {
          return Container(color: widget.choicesList[0].choices[emoji], height: 80, width: 200);
        }
      },
      onWillAccept: (data) => data == emoji,
      onAccept: (data) {
        // setState(() {
          //////////////////////
          widget.scoreFunction(emoji);
          // widget.score[emoji] = true;
          plyr.play('success.mp3');
        // });
      },
      onLeave: (data) {},
    );
  }
}
class Emoji extends StatelessWidget {
  Emoji({Key key, this.emoji}) : super(key: key);

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 80,
        padding: EdgeInsets.all(10),
        child: Text(
          emoji,
          style: TextStyle(color: Colors.black, fontSize: 50),
        ),
      ),
    );
  }
}
AudioCache plyr = AudioCache();

