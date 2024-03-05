
import 'package:flutter/material.dart';

import 'Achats/Achats.dart';
import 'Clients/Clients.dart';
import 'Fournisseurs/Fournisseurs.dart';
import 'Produits/product.dart';
import 'Ventes/vente.dart';

class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> with TickerProviderStateMixin {
    late TabController controller_tab;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller_tab=TabController(length: 5, vsync: this);
  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller_tab.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        height: 80,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        color: Colors.transparent,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green
          ),
          child: TabBarView(
            children: <Widget>[          
              Product(),
              Achats(),
              Ventes(),
              Fournisseurs(),
              Clients()
              ],
              controller: controller_tab,
          
          ),
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.transparent,
        child: TabBar(tabs: <Widget>[
          Tab(
            icon: Icon(Icons.production_quantity_limits_outlined),
          ),
          Tab(
            icon: Icon(Icons.business),
          ),
          Tab(
            icon: Icon(Icons.production_quantity_limits),
          ),
          Tab(
            icon: Icon(Icons.production_quantity_limits),
          ),
          Tab(
            icon: Icon(Icons.production_quantity_limits),
          )
        ],
        controller: controller_tab,
        
        ),
        
      ),

    );
  }
}