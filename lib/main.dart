
import 'package:flutter/material.dart';

import 'bmi/bmiCalclator.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    

      return MaterialApp(
        debugShowCheckedModeBanner:false,
        home:BmiCalcScreen(),
      );
  }

}
