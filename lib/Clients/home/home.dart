import 'package:flutter/material.dart';

import '../Hero/hero_details.dart';
import '../Hero/hero_info.dart';
import 'Addclient.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HeroItems();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clients"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
          itemCount: controller.items.length,
          itemBuilder: (context,index){
            return ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HeroDetails(items: controller.items[index])));
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
              trailing: IconButton(onPressed: (){
              //delrecord(userdata[index]["id"]);
            }, 
            icon: const Icon(Icons.delete),
            style: const ButtonStyle(
              //iconColor: Color()
            )
            
            ),
              
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddClient()));         
            
          },
          disabledElevation: 10,
          child: const Icon(Icons.add),
        ),
    );
  }
}
