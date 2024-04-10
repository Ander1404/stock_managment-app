

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stocktrue/Produits/detailproduit.dart';
import 'package:stocktrue/ip.dart';
import 'Add_product.dart';
import 'package:http/http.dart' as http;
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
    getrecord();
  }
  List dataens = [];
String adress=currentip();
Future<void> getrecord() async {
    var url="http://$adress/API_VENTE/PRODUIT/getproduit.php";  
 try {
      var response = await http.get(Uri.parse(url));
      setState(() {
        dataens = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
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
              ListView.builder(
                  itemCount: dataens.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index) {
                    return dataens.isEmpty?const CircularProgressIndicator():
                    GestureDetector(
                            onTap:(){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>Detailproduit(
                                    dataens[index]["id_produit"].toString(),
                                    dataens[index]["designation"].toString()
                                    
                                    ))
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
                                              height: 165.0,
                                              width: width*0.91,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10.0),
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
                                                height: 170,
                                                width: 140,
                                                decoration:BoxDecoration(
                                                  borderRadius:BorderRadius.circular(10.0),
                                                  image:  DecorationImage(
                                                    fit:BoxFit.fill,
                                                    // ignore: prefer_interpolation_to_compose_strings
                                                    image:NetworkImage("http://$adress/API_VENTE/PRODUIT/"+dataens[index]["image"]),
                                                  ),
                                                )
                            
                                            )
                                        )
                                    ),
                                    Positioned(
                                        top:45,
                                        left: height*0.22,
                                        child: SizedBox(
                                            height: 200,
                                            width: 150,
                                            child:Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                 Text(
                                                    dataens[index]["designation"],
                                                    style: const TextStyle(
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.bold,
                                                    color:Colors.black
                                                    ),
                                                    
                                                ),
                                                
                                                const Divider(
                                                    color:Colors.orange
                                                ),
                                                Text(
                                                    // ignore: prefer_interpolation_to_compose_strings
                                                    "Quantite: "+dataens[index]["quantite"].toString(),
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                    color:Colors.black
                                                    ),
                                                    
                                                ),
                                                Text(
                                                    // ignore: prefer_interpolation_to_compose_strings
                                                    "Prix :${dataens[index]["prixu"].toString()}",
                                                    style: const TextStyle(
                                                      fontSize: 17,
                                                    color:Colors.grey
                                                    ),
                                                    
                                                ),
                                                Text(
                                                    "Type :${dataens[index]["categorie"]}",
                                                    style: const TextStyle(
                                                      fontSize: 17,
                                                    color: Color.fromARGB(255, 102, 101, 101)
                                                    ),
                                                    
                                                ),
                                                const Divider(
                                                    color:Colors.orange
                                                ),
                                              ],
                                            )
                                        )
                                    ),
                              //       Positioned(
                              //         top: 32,
                              //         left: width*0.74,
                              //         child: IconButton(onPressed: (){
                              //           Navigator.push(context,
                              //     MaterialPageRoute(builder: (context)=>Ediproduct())
                              // );
                              //         }, 
                              //         icon: const Icon(Icons.edit_square,
                              //         size: 27,
                              //         color: Color.fromARGB(255, 6, 35, 12),
                              //         )
                                      
                              //         )
                              //         )
                                  ],
                                )
                            )
                        
                        );
                  }
                )
          ),
        ),
    floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Addproduct()));           
          },
          // backgroundColor: orange(),
          disabledElevation: 10,
          child: const Icon(Icons.add,
          // color: Colors.white,
          ),
        ),
    
    
    );
  }
}
