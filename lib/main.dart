import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('BMI Calculator'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: BMICalculatorScreen(),
      ),
    );
  }
}

class BMICalculatorScreen extends StatefulWidget {

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {

  TextEditingController heightcontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();
  double bmi = 0.0;

  void calculateBMI(){
    double height = double.tryParse(heightcontroller.text) ?? 0.0;
    double weight = double.tryParse(weightcontroller.text) ?? 0.0;
    if(height > 0 && weight > 0){
      double bmiValue = weight / ((height / 100) * (height / 100));
      setState(() {
        bmi = bmiValue;
      });
    }
    else{
      setState(() {
        bmi = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/body.jpg'),
              radius: 50,
            ),
          ),
          SizedBox(height: 26.0,),
          Text('Height in cm',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            controller: heightcontroller,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Height (cm)',
              filled: true,
              fillColor: Colors.grey,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
              'Weight in kg',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
          ),
          TextField(
            controller: weightcontroller,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Weight (kg)',
              fillColor: Colors.grey,
              filled: true,
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
              onPressed: (){
                setState(() {
                  calculateBMI();
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text('Calculate BMI'),
          ),
          SizedBox(height: 16.0,),
          Text(
            'BMI: ${bmi.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}