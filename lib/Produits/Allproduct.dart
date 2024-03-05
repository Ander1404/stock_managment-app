

import 'package:flutter/material.dart';
import 'package:stocktrue/Produits/detailproduit.dart';

import 'Add_product.dart';

class Allproduct extends StatefulWidget {
  const Allproduct({Key? key}) : super(key: key);
  @override
  _AllproductState createState() => _AllproductState();
}

class _AllproductState extends State<Allproduct> {
  var articles = "";
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
          color:Colors.white,
          child: SafeArea(
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          //debugPrint(article.img.toString());
                          SizedBox(height: height*0.02,),
                        GestureDetector(
                                onTap:(){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>Detailproduit())
                                  );
                                },
                                child:Container(                                
                                    padding: const EdgeInsets.only(left: 10, right: 10),
                                    height: 250,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            top:35,
                                            child: Material (
                                                elevation: 0.0,
                                                child: Container(
                                                  height: 180.0,
                                                  width: width*0.91,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(0.0),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey.withOpacity(0.3),
                                                          offset: const Offset(0.0, 0.0),
                                                          blurRadius: 20.0,
                                                          spreadRadius: 4.0)],
                                                  ),
                                                  //child: Text("This is where your content goes")
                                                )
                                            )
                                        ),
                                        Positioned(
                                            top:0,
                                            left: 10,
                                            child: Card(
                                                elevation: 10.0,
                                                shadowColor: Colors.grey.withOpacity(0.5),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15.0),
                                                ),
                                                child:Container(
                                                    height: 195,
                                                    width: 140,
                                                    decoration:BoxDecoration(
                                                      borderRadius:BorderRadius.circular(10.0),
                                                      image:  const DecorationImage(
                                                        fit:BoxFit.fill,
                                                        image:NetworkImage("https://th.bing.com/th/id/OIP.bGj-6jWQm4G2URDXNCvwnAHaHa?rs=1&pid=ImgDetMain"),
                                                      ),
                                                    )
        
                                                )
                                            )
                                        ),
                                        Positioned(
                                            top:45,
                                            left: height*0.22,
                                            child: Container(
                                                height: 200,
                                                width: 150,
                                                child:Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                        "Chaise",
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                        color:Colors.black
                                                        ),
                                                        
                                                    ),
                                                    
                                                    Divider(
                                                        color:Colors.orange
                                                    ),
                                                    Text(
                                                        "Quantite: width",
                                                        style: const TextStyle(
                                                          fontSize: 15,
                                                        color:Colors.black
                                                        ),
                                                        
                                                    ),
                                                    Text(
                                                        "Prix : height",
                                                        style: const TextStyle(
                                                          fontSize: 17,
                                                        color:Colors.grey
                                                        ),
                                                        
                                                    ),
                                                    Text(
                                                        "Prix : height",
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                        color:Colors.grey
                                                        ),
                                                        
                                                    ),
                                                    const Divider(
                                                        color:Colors.orange
                                                    ),
                                                  ],
                                                )
                                            )
                                        ),
                                        Positioned(
                                          top: 165,
                                          left: width*0.78,
                                          child: IconButton(onPressed: (){}, 
                                          icon: Icon(Icons.delete_outline)
                                          
                                          ))
                                      ],
                                    )
                                )
                            
                            ),
                        ]
                      ),

                    ),
                  ),
                ],
              )
          ),
        ),
    floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Addproduct()));
          
            
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
