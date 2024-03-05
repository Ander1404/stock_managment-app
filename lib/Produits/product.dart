

import 'package:flutter/material.dart';

import 'Allproduct.dart';
import 'Categorie/CatProduit.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:stock/Produits/Gest.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {

  @override
  Widget build(BuildContext context) {
    
  return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(97, 148, 64, 64),
        title: const Column(
          children: [
            Text(
              "Furniture",
              style: TextStyle(
                
              ),
            ),
          ],
        ),
      ),
      
      body: DefaultTabController(
        length: 3, 
        child: Column(
          children: [
            //Text("data"),
            Material(
              child: Container(
                height: 55,
                color: Colors.white,
                child: TabBar(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.only(
                    top: 10,left: 10,right: 10, bottom: 10
                  ),
                  unselectedLabelColor: Colors.orange,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.orangeAccent
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.orangeAccent, width: 1
                          )
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text("Produits"),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.orangeAccent, width: 1
                          )
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text("Categories"),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 35,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(30),
                        //   border: Border.all(
                        //     color: Colors.orangeAccent, width: 1
                        //   )
                        // ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text("A propos",style: TextStyle(
                            color: Color.fromARGB(255, 56, 56, 56)
                          ),),
                        ),
                      ),
                    )
                  ]
                  
                  
                  )
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Allproduct(),
                  Cat(),
                  Center(child: Text("data"),),
                ],
              )
              )
          ],
        )
        )
    
    );
  
  
  }
}