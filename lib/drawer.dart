import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget{
  int index=0;
  
  @override
  State<StatefulWidget> createState() {
    return DrawerState();
  }
}
class DrawerState extends State<DrawerWidget>{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Drawer(
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
                  ListTile(title: Text('Colors',style: TextStyle(
                            fontSize: 24,
                            fontFamily:'RobotoCondensed',
                            fontWeight:FontWeight.bold
                            )),
                    onTap: () {
                      // widget.index= 0;
                      // Navigator.of(context).pushReplacementNamed(ColorsWidgetScreen.routName);
                     setState(() {
                     });
                    },),
                  Divider(height: 1.5, color: Colors.brown,),
                  ListTile(title: Text('Structures',style: TextStyle(
                            fontSize: 24,
                            fontFamily:'RobotoCondensed',
                            fontWeight:FontWeight.bold
                            ),),
                    onTap: () {
                    // widget.index= 1;
                    //   Navigator.of(context).pushReplacementNamed(StrucureWidgetScreen.routName);
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