import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget{
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.only(left:80.0, right: 80.0, bottom: 40.0, top: 160.0),
            child: Image.asset('lib/images/avocado.png'),
          ),

          //delivering groceries
          const Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              "We deliver groceries at your doorstep",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //fresh items everyday
          Text(
            "Fresh items everyday",
          ),

          const Spacer(),

          //get started button
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(24),
            child: Text(
              "Get Started",
              style: TextStyle(color: Colors.white),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}