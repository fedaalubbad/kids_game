import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget{
  String asset;
  ImageDialog(this.asset);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
       height: 300,
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(asset),fit: BoxFit.cover
        ),

      ),
      ),
    );
  }

}