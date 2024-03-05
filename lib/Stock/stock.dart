import 'package:flutter/material.dart';

class Stockmanger extends StatefulWidget {
  const Stockmanger({super.key});

  @override
  State<Stockmanger> createState() => _StockmangerState();
}

class _StockmangerState extends State<Stockmanger> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Stock",
        style: TextStyle(            
            fontSize: 28,
            fontWeight: FontWeight.bold

        ),
        ),
          ],
        )
      ),
    );
  }
}