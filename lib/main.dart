

import 'package:flutter/material.dart';
import 'package:stocktrue/Achats/Achats.dart';
import 'package:stocktrue/Paternars.dart';
import 'package:stocktrue/Produits/product.dart';
import 'package:stocktrue/Ventes/vente.dart';

void main() {
  runApp(const MyApp());
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
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int myindex=0;
  List<Widget> widgetlist=[
    const Product(),
    const Achats(),
    const Ventes(),
    //const Fournisseurs(),
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
        selectedItemColor: const Color.fromRGBO(254, 188, 8, 1),
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