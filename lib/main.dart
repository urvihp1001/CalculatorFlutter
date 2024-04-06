// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import "package:flutter/material.dart"; //install material package
import 'buttons.dart'; //buttons file created
import 'package:math_expressions/math_expressions.dart'; //math package for expressions
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
//class MyApp ends
//make class Homepage
class HomePage extends StatefulWidget
{
  @override
  _HomePageState createState()=>_HomePageState(); //override definition of createState by or own created _HomePageState
}//end HomePage
//start _HomePageState

class _HomePageState extends State<HomePage>
{
var input='';
var ans='';
final List<String> buttons = [
	'C',
	'+/-',
	'%',
	'DEL',
	'7',
	'8',
	'9',
	'/',
	'4',
	'5',
	'6',
	'x',
	'1',
	'2',
	'3',
	'-',
	'0',
	'.',
	'=',
	'+',
  ];
@override
Widget build(BuildContext context)
{
  //overriding build which returns widgets that show up on screen
  return Scaffold(
    appBar: AppBar(
      title: const Text("Urvi's Calculator"),
    ),
    backgroundColor: Colors.pink[50],
    body: Column(
      children: <Widget>[
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
            alignment: Alignment.centerRight,
            padding:const EdgeInsets.all(20),
            child:Text(input,
            style: TextStyle(fontSize: 30,
            color: Colors.pink[90]
            ),
            ),
            ),
        Container(
            alignment: Alignment.centerRight,
            padding:const EdgeInsets.all(15),
            child:Text(ans,
            style: TextStyle(fontSize: 36,
            color: Colors.pink[90],
            fontWeight: FontWeight.bold, ),
            ),
            ),
          ]),),
Expanded(
  flex:3,
  child:GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),itemCount: buttons.length, itemBuilder: (BuildContext context, int  index) {
    //Clear Button
    if(index==0)
    {
      return MyButton(buttontapped: (){
  setState(() {
    input='';
    ans='0';
  });
      },
      //C
  buttonText:buttons[index],
  color:Colors.blue[200],
  textColor:Colors.black, //attributes of MyButton
      );
    }
    //+/- button
    else if(index==1)
    {
      return MyButton(
  buttonText:buttons[index], //whatever text is on Button
  color:Colors.blue[200],
  textColor:Colors.green[800], //attributes of MyButton
      );
    }
    //%button
    else if(index==2)
    {
       return MyButton(
        buttontapped: (){
          setState(() {
            input+=buttons[index];
          });
        },
  buttonText:buttons[index], //whatever text is on Button
  color:Colors.blue[200],
  textColor:Colors.green[800], //attributes of MyButton
      );
    }
    //del
    else if(index==3)
    {
      return MyButton(
        buttontapped: (){
          setState(() {
            input=input.substring(0,input.length-1);
          });
        },
  buttonText:buttons[index], //whatever text is on Button
  color:Colors.blue[200],
  textColor:Colors.red, //attributes of MyButton
      );
    }
    //equal to
     else if(index==18)
    {
      return MyButton(
        buttontapped: (){
          setState(() {
            equalPressed();
          });
        },
  buttonText:buttons[index], //whatever text is on Button
  color:Colors.orange[700],
  textColor:Colors.white, //attributes of MyButton
      );
    }
     else 
    {
      return MyButton(
						buttontapped: () {
						setState(() {
							input += buttons[index];
						});
						},
						buttonText: buttons[index],
						color: isOperator(buttons[19])
							? Colors.purple[300]
							: Colors.white,
						textColor: isOperator(buttons[19])
							? Colors.white
							: Colors.black,
      );
    }
  })
  )
      ],
    ),
  
  );

}
bool isOperator(String x)
{
  if(x=='/'||x=='*'||x=='+'||x=='-')
  {
    return true;
  }
  return false;
}
void equalPressed()
{
  String finalinput=input;
  finalinput=input.replaceAll('x','*');
  Parser p=Parser();
  Expression exp=p.parse(finalinput);
  ContextModel cm=ContextModel();
  double eval=exp.evaluate(EvaluationType.REAL, cm);
  ans=eval.toString();
}
}