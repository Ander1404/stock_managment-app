

import 'package:flutter/material.dart';
import 'package:stocktrue/Produits/Categorie/home/HomeCat.dart';

import 'Allproduct.dart';
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
        // centerTitle: true,
        actions: const [IconButton(onPressed: null, icon: Icon(Icons.info_outline))],
        title: const Text("FourniMag",textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
        )
      ),
      
      body: DefaultTabController(
        length: 2, 
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
                        height: 37,
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
                        height: 37,
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
                    
                  ]
                  
                  
                  )
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  Allproduct(),
                  Cat()                 
                ],
              )
              )
          ],
        )
        )
    
    );
  
  
  }
}