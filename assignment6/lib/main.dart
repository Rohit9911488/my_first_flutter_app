import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// This widget is the root of your application.
Widget build(BuildContext context)
{
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child:Stack(
        
        children:[ Positioned(
          top:220,
          left:10,
          right: 70,
          child: Container(
            child: Image.asset('assets/images/icon.png'),
          ),

        ),
          Positioned(
              top: 370,
              left: 180,

              child:
          RichText(text:

          TextSpan(
            text: 'prop',
            style: TextStyle(
              color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 35,
            ),
          ))
          ),
          Positioned(
              top:367,
              left: 251,
              child: Text('users',
              style: TextStyle(color: Colors.blue,fontSize: 35),)
          ),
          Positioned(
              top:378,
              left:339,
              child:Text('.com',style: TextStyle(color: Colors.blue,fontSize: 20),),
          ),
          Positioned(top:410,
              left: 180,
              child: Text('HOW REAL ESTATE GETS REAL',style: TextStyle(color: Colors.blue),))
          ],
      
        ),

      
    ),
    );


}
}