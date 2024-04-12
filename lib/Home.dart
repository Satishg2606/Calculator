// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class calculator extends StatefulWidget {
  calculator();

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  String? exp1 = "0";
  String? exp2 = "0";
  String? sym = "";
  double ans = 0;
  String error ="";
  bool  ans_mode = false;
  // MaterialStateProperty<Color> swatches = Colors.grey as MaterialStateProperty<Color>;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade300,
        appBar: AppBar(
          titleSpacing: 30,
          title: Row(
            children:const <Widget> [
              Text(
                "Calculator",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Quitelo',
                    fontSize: 30,
                    letterSpacing: 3),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 9, 0, 0),
              child: Text(
                
                "_6937a",
                style: TextStyle(
                    
                    color: Colors.black,
                    fontFamily: 'Quitelo',
                    fontSize: 13,
                    
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3),
              ),),
              
            ],
          ),
          backgroundColor: Colors.blueGrey.shade300,
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 207, 246, 227),
                          borderRadius: BorderRadius.circular(
                              15), // This adds the border radius
                        ),
                        child: SizedBox(
                          height: 220,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Row(children: [
                                    Expanded(
                                      flex : 1,
                                      child: Text(
                                    '${exp1.toString().trim() != "" ? exp1 : 0}',
                                    textAlign: TextAlign.end,
                                    softWrap: true,
                                    maxLines: 1,
                                    
                                    style: TextStyle(
                                      
                                      color: Colors.black87,
                                      fontSize: 30,
                                    ),
                                  ),)
                                  ],)
                                  ,
                                  SizedBox(height: 15,),
                                  Row(
                                    children: [
                                    Expanded(
                                      flex:1,
                                      child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '${sym.toString().trim() != "" ? sym : ""}',
                                      
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),),
                                    Expanded(
                                      flex: 15,
                                      child: Text(
                                      
                                    '${exp2.toString().trim() != "" ? exp2 : 0}',
                                    maxLines: 1,
                                    softWrap: true,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 30,
                                    ),
                                  ),)
                                    ],
                                  ),
                                  
                                  
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Divider( height: 25,color: Colors.blue,),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex : 1,
                                        child: Icon(Icons.question_answer_sharp)) ,
                                      Expanded(
                                        flex:10,
                                        child: Text(
                                        '${error.toString().trim().isEmpty?"":error} ${ans.toString().trim() != "" ? ans.toString().length>9?ans.toStringAsFixed(5):ans.toString() : 0}',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 30,
                                        ),
                                      )),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                  SizedBox(width: 10),
                ],
              ),
              Divider(
                height: 50,
              ),

              // Buttons Start From Here .....

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => setState(() {
                      exp1 = "";
                      exp2 = "";
                      sym = "";
                      ans = 0;
                      error ="";
                      ans_mode = false;
                    }),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade300,
                        fixedSize: Size(60, 60)),
                    child: Text('C',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => addSym("%"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54, fixedSize: Size(80, 60)),
                    child: Text('%',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 40,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => addSym("\u{00F7}"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54, fixedSize: Size(80, 60)),
                    child: Text('\u{00F7}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 40,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => {clearOne()},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellowAccent.shade100, fixedSize: Size(80, 60)),
                    child: Icon(
                      Icons.backspace_sharp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => {updateString("7")},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54, fixedSize: Size(80, 60)),
                    child: Text('7',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => {updateString("8")},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54, fixedSize: Size(80, 60)),
                    child: Text('8',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => {updateString("9")},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54, fixedSize: Size(80, 60)),
                    child: Text('9',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => addSym("X"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54, fixedSize: Size(80, 60)),
                    child: Text('x',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 40,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => {updateString("4")},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54, fixedSize: Size(80, 60)),
                    child: Text('4',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => {updateString("5")},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54, fixedSize: Size(80, 60)),
                    child: Text('5',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => {updateString("6")},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54, fixedSize: Size(80, 60)),
                    child: Text('6',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => addSym("-"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54, fixedSize: Size(80, 60)),
                    child: Text('-',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 40,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => {updateString("1")},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54, fixedSize: Size(80, 60)),
                    child: Text('1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => {updateString("2")},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54, fixedSize: Size(80, 60)),
                    child: Text('2',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => {updateString("3")},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54, fixedSize: Size(80, 60)),
                    child: Text('3',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => addSym("+"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54, fixedSize: Size(80, 60)),
                    child: Text('+',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 40,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => {updateString("0")},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54, fixedSize: Size(180, 60)),
                    child: Text('0',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  // SizedBox(width: 20,),
                  // ElevatedButton(
                  //   onPressed: () => {clear()},

                  //   style: ElevatedButton.styleFrom(backgroundColor: Colors.grey,fixedSize: Size(80, 60)),
                  //   child: Text('%',
                  //       style: TextStyle(
                  //           color: Colors.black,fontSize: 30, fontWeight: FontWeight.bold)),
                  // ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() {
                      if (sym.toString().trim().isNotEmpty) {
                        exp2 = (exp2! + ".");
                      } else {
                        if (!exp1!.contains(".")) {
                          exp1 = (exp1! + ".")!;
                        }
                      }
                      ;
                    }),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54, fixedSize: Size(40, 80)),
                    child: Text('.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    onPressed: () => {calculateAns()},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        fixedSize: Size(100, 80)),
                    child: Text('=',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  clear() {}

  updateString(String s) {
    setState(() {
      if (sym.toString().trim().isEmpty) {
        exp1 = (exp1! + s);
      } else {
        exp2 = (exp2! + s);
      }
    });
  }

  addSym(String s) {
    if (!exp1.toString().trim().isEmpty && !ans_mode) {
      setState(() {
        sym = s;
      });
    }
  }

  clearOne() {
    if (exp2.toString().isNotEmpty) {
      setState(() {
        exp2 = exp2?.toString().substring(0, exp2!.length - 1);
      });
    } else if (sym.toString().trim().isNotEmpty) {
      setState(() {
        ans_mode = false;
        sym = "";
      });
    } else if (exp1.toString().isNotEmpty) {
      setState(() {
        exp1 = exp1?.toString().substring(0, exp1!.length - 1);
      });
    } else {}
    
  }
  calculateAns(){
      double e1= double.parse(exp1.toString());
      double e2= double.parse(exp2.toString());
      double result = 0;
      String str = sym.toString();

      switch(str)
      {
        case "+":
            result=e1+e2;
            break;
        case "-":
            result=e1-e2;
            break;
        case "X":
            result=e1*e2;
            break;
        case "\u{00F7}":
            if(e2 != 0)
            {
              result=e1/e2;

            }else{
              setState(() {
                error = "Invalid Input";
                ans_mode = true;
              });
            }
            break;
        case "%":
            result=e1%e2;
            break;
        default :
            break;
      }
      if(sym.toString().trim().isNotEmpty)
      {
      setState(() {
        ans=result;
        
        ans_mode = true;
      });
      }

  }
  }

