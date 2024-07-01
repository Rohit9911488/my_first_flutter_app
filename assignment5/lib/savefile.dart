import 'package:assignment5/form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'form.dart';

void main()
{
  runApp(MyApp3());
}
class MyApp3 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: save(),
    );
  }
}
  class save extends StatelessWidget
  {  @override
  Widget build(BuildContext context)
    {
      List<Map<String, String>> registeredUsers = form.getRegisteredUsers();

      return Scaffold(
      appBar: AppBar(title: Text('Registered Users'),),
    body: ListView.builder(itemCount:
    registeredUsers.length,
      itemBuilder: (context,index){
      return ListTile(
      title: Text(registeredUsers[index]['name']!),
    subtitle: Text(registeredUsers[index]['email']!),
      );
    },),
      );
    }
  }
