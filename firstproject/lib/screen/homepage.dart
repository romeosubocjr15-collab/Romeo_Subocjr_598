import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //variable declaration
  String title = "";
  int counter = 0;

  TextEditingController number1 = TextEditingController();
  TextEditingController number2 = TextEditingController();

  double total = 0;

  @override
  void initState() {
    title = "Calculator";
    number1.text = "0";
    number2.text = "0";
    super.initState();
  }

  void addNumbers() {
    setState(() {
      total = double.parse(number1.text) + double.parse(number2.text);
    });
  }
  void subtractNumbers() {
    setState(() {
      total = double.parse(number1.text) - double.parse(number2.text);
    });
  }
  void multiplyNumbers() {
    setState(() {
      total = double.parse(number1.text) * double.parse(number2.text);
    });
  }
  

  //handle
  void handleButtonClick() {
    setState(() {
      counter += 1;
    });
  }
  //is

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text(title)),
          Center(child: Text("$counter")),
          // ElevatedButton(
          //   onPressed: () {
          //     handleButtonClick();
          //   },
          //   child: Text("increment counter"),
          // ),
          SizedBox(height: 20),
          TextField(controller: number1),
          SizedBox(height: 20),
          TextField(controller: number2),

          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  addNumbers();
                },
                child: Text("Addition"),
              ),
              ElevatedButton(
            onPressed: () {
              subtractNumbers();
            },
            child: Text("Subtract"),
          ),
          ElevatedButton(
            onPressed: () {
              multiplyNumbers();
            },
            child: Text("Multiply"),
          ),
            ],
          ),
          

          SizedBox(height: 50),
          Text("total is $total",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          
        ],
      ),
    );
  }
}
