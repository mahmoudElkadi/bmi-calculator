import 'dart:math';

import 'package:flutter/material.dart';

import '../bmi_result/Bmi_Result_Screen.dart';

class BmiCalcScreen extends StatefulWidget {
  const BmiCalcScreen({Key? key}) : super(key: key);

  @override
  State<BmiCalcScreen> createState() => _BmiCalcScreenState();
}

class _BmiCalcScreenState extends State<BmiCalcScreen> {
bool isMale=true;
double height = 120;
int ageCounter=10;
int weightCounter=45;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('BMI Calculator'),
      ),
      body:Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap:(){
                        setState(() {
                          isMale=true;
                        });
                      } ,
                      child: Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('image/m.png'),
                            height: 90,
                              width: 90,
                            ),
                            SizedBox(height: 10,),
                            Text("MALE",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:isMale ?Colors.blue : Colors.grey[400]
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap:(){
                        setState(() {
                          isMale=false;
                        });
                      } ,
                      child: Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage('image/female.png'),
                            height: 90,
                              width: 90,
                            ),
                            SizedBox(height: 10,),
                            Text("FEMALE",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: !isMale ? Colors.blue : Colors.grey[400]
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20
              ),
              child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[400]
              ),


                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('${height.round()}',
                            style:TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900
                            )),
                        SizedBox(height: 8,),
                        Text('CM',
                            style:TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900
                            )),

                      ],
                    ),
                    Slider(value: height,
                        max: 220,
                        min: 80,
                        onChanged:(value){
                      setState(() {
                        height=value;
                       //  print(value.round());

                      });
                        } )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
           child:Padding(
             padding: const EdgeInsets.all(20.0),
             child: Row(
               children: [
                 Expanded(
             child:Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: Colors.grey[400],
                   ),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text('Age',
                         style:TextStyle(
                           fontSize: 25,
                           fontWeight: FontWeight.bold
                         )
                         ),
                       Text('${ageCounter}',
                         style:TextStyle(
                           fontSize: 30,
                           fontWeight: FontWeight.bold
                         )
                         ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           FloatingActionButton(onPressed: (){
                             setState(() {
                               ageCounter--;
                             });
                           },
                             heroTag: 'age-',
                             mini: true,
                           child: Icon(Icons.remove),
                           ),
                           FloatingActionButton(onPressed: (){
                             setState(() {
                               ageCounter++;
                             });
                           },
                             heroTag: 'age+',
                             mini: true,
                           child: Icon(Icons.add),
                           ),
                         ],
                       )
                     ],
                   ),
                 ),
                 ),
                 SizedBox(
                   width: 20,
                 ),
                 Expanded(
                   child: Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: Colors.grey[400],
                     ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,

                       children: [
                         Text('Weight',
                             style:TextStyle(
                                 fontSize: 25,
                                 fontWeight: FontWeight.bold
                             )
                         ),
                         Text('${weightCounter}',
                             style:TextStyle(
                                 fontSize: 30,
                                 fontWeight: FontWeight.bold
                             )
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             FloatingActionButton(onPressed: (){
                               setState(() {
                                 weightCounter--;
                               });
                             },
                               heroTag: 'weigh-',
                               mini: true,
                               child: Icon(Icons.remove),
                             ),
                             FloatingActionButton(onPressed: (){
                               setState(() {
                                 weightCounter++;
                               });
                             },
                               heroTag: 'weight+',
                               mini: true,
                               child: Icon(Icons.add),
                             ),
                           ],
                         )
                       ],
                     ),
                   ),
                 ),
               ],
             ),
           ),
          ),
          Container(
            width: double.infinity,
              color: Colors.blue,
              child: MaterialButton(
                height: 50,
                  onPressed: (){
                  var result=weightCounter / pow(height / 100, 2);
                  print(result);

                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=>BmiResultScreen(
                            age: ageCounter,
                            isMale: isMale,
                            result: result.round(),
                          )
                      )
                  );
                  },
                  child:Text("CALCULATE",
                  style: TextStyle(
                  color: Colors.white
                  ),
                  )
              )
          )


        ],
      ),
    );
  }
}
