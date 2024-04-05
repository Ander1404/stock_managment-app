import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Listdetail extends StatefulWidget {
  String code;
  Listdetail(this.code, {super.key});

  @override
  State<Listdetail> createState() => _ListdetailState();
}

class _ListdetailState extends State<Listdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Padding(padding: edge)
              const Text("Details de l'achat",
                    style: TextStyle(
                      
                      fontSize: 15,
                      fontWeight: FontWeight.w100,                                          
                    ),                  
                    ),
              IconButton(
              onPressed: (){
                // showBottomSheet(context: context, builder: (context)=>Listdetail("data[index]["fournisseur"]"))
              }, 
              icon: const Icon(Icons.add_circle_outline_outlined)),
              
              
              ],
          )
        ],
      ),
    );
  }
}