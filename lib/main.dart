

import 'package:flutter/material.dart';
import 'package:stocktrue/Achats/Achats.dart';
import 'package:stocktrue/Colors.dart';
import 'package:stocktrue/Paternars.dart';
import 'package:stocktrue/Produits/product.dart';
import 'package:stocktrue/Ventes/vente.dart';


void main() async {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  

  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Stock manager',
      debugShowCheckedModeBanner: false,      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,        
      ),
       home: const Homescreen(),
    );
  }
}
// ignore: must_be_immutable
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});
  
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  // List h=widget.dr;
//  late List data;
  int myindex=0;
  List widgetlist=[
    const Product(),
         Achats(),
    const Ventes(),
    const Paternars()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body:widgetlist[myindex],
      bottomNavigationBar:  BottomNavigationBar(        
       backgroundColor: Colors.white,
       unselectedItemColor: Colors.black45,       
        showUnselectedLabels: true,
        selectedItemColor: princip(),
        elevation: 0,
        onTap: (index){
          setState(() {
            myindex=index;
          });
        },
        currentIndex: myindex,
        items:const [        
         BottomNavigationBarItem(icon: Icon(Icons.home_rounded),
        label: "Product"),
        BottomNavigationBarItem(icon: Icon(Icons.business_center_outlined),
        label: "Achats"),
        BottomNavigationBarItem(icon: Icon(Icons.sell),
        label: "Ventes"),
        // BottomNavigationBarItem(icon: Icon(Icons.category_outlined),
        // label: "Stock"),
        BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),
        label: "Partenaires")
      ]
      ),      
    );
  }
}