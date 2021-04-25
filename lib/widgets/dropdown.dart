import 'package:flutter/material.dart';
import 'package:kids_test_game/model/images.dart';

class DropDownBtn extends StatelessWidget{

  List<Images>imagesList;
  DropDownBtn(this.imagesList);
  @override
  Widget build(BuildContext context) {
      // return Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text('select A letter! ',
      //           style:
      //           TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      //
          return Flexible(
            child: DropdownButton(
                items: imagesList.map(
                    (item) {
                    return DropdownMenuItem(
                      value: item,
                      child: new Text(item.title,style: TextStyle(color: Colors.white),),
                    );
                  },
                ).toList(),
                icon: Icon(Icons.arrow_drop_down),
                iconEnabledColor: Colors.amber,
                dropdownColor: Colors.blueGrey,
                onChanged: (val) {
                  // setState(() {
                  //   _selectedLetter = val;
                  //   var ad=new AlertDialog(
                  //     title: Text('selected'),
                  //     content: Text(_selectedLetter,
                  //       style: TextStyle(color: Colors.pink,fontSize:25 ),),
                  //   );
                  //   showDialog(context: context,child: ad);
                  // });

                },
                // value: _selectedLetter,
                hint: Text(
                  'selected',style: TextStyle(color: Colors.white),
                ),
              ),
          );
          // ]);
    }


}