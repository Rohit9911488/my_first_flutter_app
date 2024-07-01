import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'form.dart';
import 'savefile.dart';
void main()
{
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget
{


  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Assignment'),),
     body:  SingleChildScrollView(
  child:Column(children: [
      ExpandablePanel(
    header: Text('Signup',softWrap: true,maxLines: 5,),
    collapsed: Text('back',softWrap: true,),
    expanded:ListView(
      shrinkWrap: true,
      children:[
        Container(height:250,child:form(),),


       ]
    ),
       theme: const ExpandableThemeData(
       headerAlignment: ExpandablePanelHeaderAlignment.center,
       tapHeaderToExpand: true,
       hasIcon: true,
       ),
    ),
    SizedBox(height: 20,),
    ExpandablePanel(
      header: Text('Registered Users',softWrap: true,maxLines: 5,),
      collapsed: Text('Click To view',softWrap: true,),
      expanded: Container(
        height: 300,
        child: save(),
      ),
      theme: const ExpandableThemeData(
        headerAlignment: ExpandablePanelHeaderAlignment.center,
        tapHeaderToExpand: true,
        hasIcon: true,
      ),
    ),



       ],
     ),


     ),

    )
    );


  }


}