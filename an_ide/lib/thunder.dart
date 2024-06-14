import 'package:flutter/material.dart';
import 'package:an_ide/splash_screen.dart';
import 'dart:math';
import 'pages/sign_up.dart';


class ThunderBackground extends StatefulWidget {
  @override
  _ThunderBackgroundState createState() => _ThunderBackgroundState();
}

class _ThunderBackgroundState extends State<ThunderBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool showLoginButton=false;
  bool showSignupButton=false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            showLoginButton=true;
          });
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          setState(() {
            showSignupButton=true;
          });
          _controller.forward();
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.yellow),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Opacity(
              opacity: _animation.value,
              child: CustomPaint(
                painter: ThunderPainter(),
                child: Container(),
              ),
            );
          },
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              AnimatedOpacity(opacity:showSignupButton ?1.0:0.0,
              duration: Duration(milliseconds:300 ),
              child:Container(
                height: 70,
                width: 150,
                decoration: BoxDecoration(color: Colors.red),
              child:ElevatedButton(onPressed: null, child: Text('Login'),)
              ),
              ),
              SizedBox(height: 20,),
             AnimatedOpacity(opacity: showLoginButton?1.0:0.0, duration: Duration(milliseconds: 500),
              child:Container(
                height: 70,
                width: 150,
                decoration: BoxDecoration(color: Colors.red),
                child: ElevatedButton(onPressed:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>Signup()));
    },
    child: Text('Sign Up'),
                ),
              ),
             ),

            ],

          ),
        )
      ],
    );
  }
}



class ThunderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    _drawLightning(canvas, paint, size);



  }

  void _drawLightning(Canvas canvas, Paint paint, Size size) {
    Random rand = Random();

    // Starting point of the lightning
    double startX = size.width / 2;
    double startY = 0.0;

    List<Offset> points = [];
    points.add(Offset(startX, startY));

    // Generate random points to simulate lightning effect
    for (int i = 0; i < 10; i++) {
      double x = startX + (rand.nextDouble() - 0.5) * size.width * 0.2;
      double y = startY + size.height / 10;
      points.add(Offset(x, y));
      startX = x;
      startY = y;
    }

    // Draw the lightning
    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;  // Important to repaint the lightning to create a new random pattern
  }
}
