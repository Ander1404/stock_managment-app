

import 'package:flutter/material.dart';
import 'package:stocktrue/Colors.dart';
// import 'package:salle/Reservation/AjouterCat.dart';
// import 'package:http/http.dart' as http;

import 'package:stocktrue/Produits/Categorie/home/AddCat.dart';
import 'package:stocktrue/ip.dart';
class Cat extends StatefulWidget {
  const Cat({super.key});

  @override
  State<Cat> createState() => _CatState();
}
 
class _CatState extends State<Cat> {
  String adress=currentip();
  double screenheigth=0;
  double screenwith=0;
  List data=[123,34,5,5,6,7];
  //   Future<void> delrecord(String id) async {
  //   try{
  //     var url="http://$adress/Salle_db/Type/deltype.php";
  //     var result=await http.post(Uri.parse(url),
  //     body: {
  //       "id":id
  //     }
  //     );
  //     var reponse=jsonDecode(result.body);
  //     if(reponse["Success"]=="True"){
  //       print("record deleted");
  //       getrecord();
  //     }
  //     else{
  //       print("Erreur de suppression");
  //       getrecord();
  //     }

  //   }
  //   catch(e){
  //     print(e);
  //   }
  //  }

//  Future<void> getrecord () async {
//   var url="http://$adress/Salle_db/Type/readtype.php";
//   try{
//     var response=await http.get(Uri.parse(url));
//     setState(() {
//       data=jsonDecode(response.body);
//     });
//   }
//   catch (e){
//     print(e);
//   }
//  }
  @override
  void initState() {
    // TODO: implement initState
    // getrecord();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    screenwith=MediaQuery.of(context).size.width;
     screenheigth=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      
      body: ListView.builder(
        // itemCount: data.length,
        itemCount: 4,
        itemBuilder: (context,index){
          return Card(   
            color: Colors.white,  
            elevation: 0,
              margin: const EdgeInsets.all(10),
            child: ListTile(              
             onTap: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>Editacta(data[index]["CODETYPE"],data[index]["MOTIF"],data[index]["MONTANT"])));
             },
             leading: Icon(Icons.category,color:  orange(),),
             title: Text("Categorie: ",
             style: const TextStyle(fontWeight: FontWeight.bold),),
             subtitle: Text("Montant: ",
             style:  TextStyle(
              color: orange(),
             ),), 
             trailing: IconButton(onPressed: (){
              // delrecord(data[index]["CODETYPE"]);
             }, 
             icon: const Icon(Icons.delete,color: Colors.redAccent,)),
            )
          );
        }
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        // getrecord();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddCat()));   
      
      },
      backgroundColor: Colors.white,
      child: const Icon(
        Icons.add_outlined,        
        //size: 3,
        
        color: Colors.green,
        
        ),
      
      ),
    );
  }
}