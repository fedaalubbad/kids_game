import 'package:flutter/material.dart';
import 'package:kids_test_game/model/choices.dart';

import 'images.dart';

class ImageData{
  static List<Images>images=[
    Images(title: 'animals',id: '1',peices: {
      '1':'assets/images/Capture1.PNG',
      '2':'assets/images/Capture2.PNG',
      '3':'assets/images/Capture3.PNG',
      '4':'assets/images/Capture4.PNG',
      '5':'assets/images/Capture5.PNG',
      '6':'assets/images/Capture6.PNG',
      '7':'assets/images/Capture7.PNG',
      '8':'assets/images/Capture8.PNG',
      '9':'assets/images/Capture9.PNG',
    }),
    Images(title: 'crocodile',id: '2',peices: {
      '1':'assets/images/c1.PNG',
      '2':'assets/images/c2.PNG',
      '3':'assets/images/c3.PNG',
      '4':'assets/images/c4.PNG',
      '5':'assets/images/c5.PNG',
      '6':'assets/images/c6.PNG',
      '7':'assets/images/c7.PNG',
      '8':'assets/images/c8.PNG',
      '9':'assets/images/c9.PNG',
    }),
  ];
  static List<Choices>choices=
      [
  Choices(title: 'choice1',id: '1',choices:{
  '🍏': Colors.green,
  '🍋': Colors.yellow,
  '🍅': Colors.red,
  '🍇': Colors.purple,
  '🥥': Colors.brown,
  '🥕': Colors.orange
  }),
      ];
}