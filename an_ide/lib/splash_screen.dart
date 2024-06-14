import 'package:an_ide/thunder.dart';
import 'package:flutter/material.dart';

mixin CustomSplashAnimation<T extends StatefulWidget> on State<T>
{
  late AnimationController _controller;
  late Animation<double> _animation;


  @override
  void initializeAnimation(TickerProvider vsync) {

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: vsync,

    );
    _animation = CurvedAnimation(parent: _controller,
      curve: Curves.easeInOut,);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Animation<double> get animation => _animation;
}
class AnimatedSplashScreenWithMixin extends StatefulWidget {
  @override
  _AnimatedSplashScreenWithMixinState createState() => _AnimatedSplashScreenWithMixinState();
}
class _AnimatedSplashScreenWithMixinState extends State<AnimatedSplashScreenWithMixin> with SingleTickerProviderStateMixin, CustomSplashAnimation {
  @override
  void initState() {
    super.initState();
    initializeAnimation(this);
    Future.delayed(Duration(seconds: 2),(){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context)=>ThunderBackground())
      );
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context,child){
            return FadeTransition(opacity: animation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),);
          },
          child: Image.asset('assets/images/my_company.jpeg'),
        ),
      ),
    );
  }
}