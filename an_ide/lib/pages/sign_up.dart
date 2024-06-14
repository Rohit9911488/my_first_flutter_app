import 'package:an_ide/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}



class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _alignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 5));

    _alignmentAnimation = AlignmentTween(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ).animate(_controller);

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool flag = false;
  bool _isObscure = true; // Password visibility flag
  String status = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: _alignmentAnimation.value,
                end: Alignment.topRight,
                colors: [
                  Colors.blue,
                  Colors.red,
                ],

              ),
            ),
            child: Center(

             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
              children:[
                Container(padding:  const EdgeInsets.only(top: 70.0),
                child:Text('Welcome',style: TextStyle(
               color: Colors.white,
               fontSize: 25,
               fontWeight: FontWeight.bold,

             ),)
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                children:[Container(
                  padding: const EdgeInsets.only(top: 70.0),

                  child: Text('Email',style: TextStyle(color: Colors.yellow,fontSize: 30),),

                ),
                  SizedBox(height: 20,),
                  Material(
                    elevation: 2.0,
                 child:  Container(
                   decoration: BoxDecoration(
                     color: Colors.white,
                   ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                        hintStyle: TextStyle(color: Colors.blue)
                      ),
                    ),
                  )
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Text('Password',style: TextStyle(color: Colors.yellow,fontSize: 30),),
                  ),
                  SizedBox(height: 20,),
                  Material(
                    elevation: 2.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),

                      child:Column(
                        children: [
                      TextFormField(
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          hintText: 'Enter Password',
                          hintStyle: TextStyle(color: Colors.red),
                        ),
                      ),

          ],),
                  ),
          ),
                          SizedBox(height: 20,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Show Password'),
                              Checkbox(value: !_isObscure, onChanged: (bool?value)
                              {
                                              setState(() {
                                                _isObscure=!value!;
                                              });
                              }
                              ),
                            ],

                          )
          ],
                      ),

                SizedBox(height: 20,),
                Container(
                  child: Text('User Name',style: TextStyle(color: Colors.yellow,fontSize: 30),),
                ),

                SizedBox(height: 20,),
                Material(
                  elevation: 2.0,
                child:Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: TextFormField(decoration: InputDecoration(hintText: 'Enter User Name',hintStyle: TextStyle(color: Colors.green)),),
                ),
                ),

               SizedBox(height: 20,),
                ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: ()
                  {

                  },
                child: Text('Create Account',style: TextStyle(color: Colors.white),),),
                SizedBox(height: 20,),


          ],

             ),




            ),


          );

        },
      ),

    );
  }
}
