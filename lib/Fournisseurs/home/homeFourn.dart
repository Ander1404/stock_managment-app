
import 'package:flutter/material.dart';

import '../Hero/HeroInfoFournisseur.dart';
import '../Hero/hero_details.dart';
import 'AddFournisseur.dart';

class Homefourn extends StatelessWidget {
  const Homefourn({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HeroItemsFourni();
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Fournisseur"),
      // ),
      body: Container(
        child: ListView.builder(
            itemCount: controller.items.length,
            itemBuilder: (context,index){
              return ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HeroDetailsFournisseur(items: controller.items[index])));
                },
                title: Text(controller.items[index].title),
                subtitle: Text(controller.items[index].subtitle),
                leading: Hero(
                  //Tag should be different
                  //having identical tag will not work in hero animation
                  tag: controller.items[index].image,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(controller.items[index].image),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddFournisseur()));
          
            
          },
          backgroundColor: Colors.orange[900],
          disabledElevation: 10,
          child: const Icon(Icons.add,
          color: Colors.white,
          ),
        ),
    );
  }
}
