import 'dart:async';

import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AnimatedPositionedExample(),
    );
  }
}


class AnimatedPositionedExample extends StatefulWidget {
  const AnimatedPositionedExample({super.key});


  @override
  _AnimatedPositionedExampleState createState() =>
      _AnimatedPositionedExampleState();
}


class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool _gamewon=false;
  bool _gameLost=false;
  double horizontalAlignment = 0;
  double verticalAlignment = 0;
  double iconSize = 20;
  final Duration _duration = const Duration(milliseconds: 1000);
  Timer? _timer;

  void _startGame()
  {
    _timer=Timer(Duration(seconds: 5),(){
      if(!_gamewon)
        {
          setState(() {
            _gameLost=true;
          });
        }
    } as void Function());
  }
  void _onTap()
  {
    setState(() {
      _gamewon=true;
      _timer?.cancel();
    });
  }

  void _onBackgroundTap()
  {
    if(!_gamewon&&!_gameLost)
      {
        setState(() {
          _gameLost=true;
        });
      }
  }
  Future<void> _togglePosition(double height, double width) async {
    await _changePosition(height * 0.5, width, 20);
    await _changePosition(height, width * 0.5, 50);
    await _changePosition(height * 0.5, 0, 80);
    await _changePosition(0, width * 0.5, 50);
    _togglePosition(height, width);
  }


  // Helper function to change position and size
  Future<void> _changePosition(double height, double width, double size) async {
    setState(() {
      horizontalAlignment = width;
      verticalAlignment = height;
      iconSize = size;
    });
    await Future.delayed(_duration);
  }


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      _togglePosition(size.height * 0.8, size.width * 0.7);
    });
    _startGame();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Catch the Rat')),
      body: Stack(
        children:[
          GestureDetector(
          onTap: _onBackgroundTap,

      child:Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:Center(
          child: Text(
            _gamewon?'You Win':_gameLost?'You Lose!':'Try to click the image',
          ),
        ),

        color: Colors.green.shade100,
      ),
      ),
            AnimatedPositioned(
              duration: _duration,
              left: horizontalAlignment,
              top: verticalAlignment,
              child: GestureDetector(
                onTap: _onTap,
                  child: Image.asset(
                  'assets/images/rat.jpg',
                width: 100,
                height: 100,
              ),
            ),

            

        ),
    ],
      )

    );
  }
}
