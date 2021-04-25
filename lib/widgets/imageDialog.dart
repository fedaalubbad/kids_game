import 'package:flutter/cupertino.dart';

class ImageDialog extends StatelessWidget{
  String asset;
  ImageDialog(this.asset);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(asset),
        )
      ),
    );
  }

}