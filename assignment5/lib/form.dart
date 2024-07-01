import 'package:flutter/material.dart';
import 'savefile.dart';
List<Map<String, String>> registeredUsers = [];

void main()
{
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: form(),
    );
  }
}
class form extends StatefulWidget {
  @override
  State<form> createState() => _form();

  static List<Map<String, String>> getRegisteredUsers() {
    return registeredUsers;
  }
}

class _form extends State<form>
  { final _formKey=GlobalKey<FormState>();
  final _nameController=TextEditingController();
  final _emailController=TextEditingController();


  Widget build(BuildContext context)
  {
  return
  Scaffold(
    body: SingleChildScrollView(
  child: Container(

  child: Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
  Container(
  padding: EdgeInsets.only(top:20),
  child:Center(
  child: Text('SignUp',style: TextStyle(
  fontSize: 25,color: Colors.blue
  ),),


  ),

  ),
  SizedBox(height: 20,),
  Container(
  width: 250,
  child:Form(
  key: _formKey,
  child: TextFormField(
  controller: _nameController,
  decoration: InputDecoration(
  hintText: 'Enter Username',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(5.0),
  ),
  isDense: true,
  contentPadding: EdgeInsets.symmetric(vertical: 2),
  ),
  validator: (value)
  {
  if(value==null||value.isEmpty)
  {
  return 'Please enter your name';
  }
  return null;
  },
  ),

  ),

  ),

  Divider(height: 10,thickness: 0.5,),
  Container(
  width: 250,
  child: TextFormField(
  controller: _emailController,
  decoration: InputDecoration(
  hintText: 'Enter email',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(5.0),
  ),
  isDense: true,
  contentPadding: EdgeInsets.symmetric(vertical:2 ),
  ),
  validator: (value)
  {
  if(value==null||value.isEmpty)
  {
  return 'Please enter your email';
  }
  if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value))
  {
  return 'Please enter a valid email';
  }
  return null;
  },
  ),
  ),

  Divider(height: 10,thickness: 0.5,),
  Container(
  width: 250,
  child: TextFormField(
  decoration: InputDecoration(
  hintText: 'Enter Password',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(5.0),
  ),
  isDense: true,
  contentPadding: EdgeInsets.symmetric(vertical:2)
  ),
  ),
  ),
  SizedBox(height: 20,),
  ElevatedButton(onPressed: ()
  {
  if(_formKey.currentState!.validate())
  {
  setState(() {
  registeredUsers.add({
  'name': _nameController.text,
  'email': _emailController.text,
  },
  );
  _nameController.clear();
  _emailController.clear();
  Navigator.push(context, MaterialPageRoute(builder:(context)=>save()));

  });
  }
  },
  child: Text('Register'),)

  ],

  ),
  ),
  )
  );
  }
  }


