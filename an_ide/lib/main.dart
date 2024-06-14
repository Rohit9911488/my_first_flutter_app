import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'thunder.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=>AnimatedSplashScreenWithMixin(),
        '/thunder':(context)=>ThunderBackground(),
      },
    );
  }
}