
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
final int result;
final bool isMale;
final int age;

BmiResultScreen({
  required this.result,
  required this.isMale,
  required this.age
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
          IconButton(icon: Icon(Icons.keyboard_arrow_left),
          onPressed: (){
            Navigator.pop(context);
          },
          ),
      title:Text(
          'BMI RESULT',
          style: TextStyle(
            fontSize: 20
          ),
        )
      ),
      body:
         Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Gender : ${isMale ? 'Male': 'Female'}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
              ),
              Text('Result : $result',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
              ),
              Text('Age : $age',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
              ),
            ],
          ),
        )
    );
  }
}
