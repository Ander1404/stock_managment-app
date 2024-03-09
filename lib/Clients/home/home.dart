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
      // appBar: AppBar(
      //   title: const Text("Clients"),
      // ),
      body: ListView.builder(
          itemCount: 8,
          itemBuilder: (context,index){
            return Card(
              color: Colors.white,  
            elevation: 2,
            // shadowColor:,
            
              margin: const EdgeInsets.all(5),
              child: ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HeroDetails(items: controller.items[index])));
                },
                title: Text(controller.items[index].title),
                subtitle: Text(controller.items[index].subtitle),
                trailing:  IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.edit_note_outlined)),
                leading: Hero(
                  //Tag should be different
                  //having identical tag will not work in hero animation
                  tag: controller.items[index].image,
                  child: const CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person_2_outlined),
                  ),
                  
                ),
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
