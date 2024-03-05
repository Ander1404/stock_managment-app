
import 'package:flutter/material.dart';

import '../Hero/HeroInfoCat.dart';
import '../Hero/hero_details.dart';
import 'AddCat.dart';


class HomeCat extends StatelessWidget {
  const HomeCat({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HeroItemsCat();
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HeroDetailsCat(items: controller.items[index])));
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddCat()));
          
            
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
