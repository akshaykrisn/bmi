import 'package:flutter/material.dart';

class bmi extends StatefulWidget {
  @override
  _bmi createState() => _bmi();
}

class _bmi extends State<bmi> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double? _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Height(CM)',
                icon: Icon(Icons.arrow_upward),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight(KG)',
                icon: Icon(Icons.circle),
              ),
            ),
            SizedBox(height: 15),
            RaisedButton(
              color: Colors.blue,
              child: Text(
                "Calculate",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: calculate,
            ),
            SizedBox(height: 15),
            Text(
              _result == null ? "" : "${_result!.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculate() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;
    _result = result;
    setState(() {});
  }
}
