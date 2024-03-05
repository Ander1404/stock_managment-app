import 'package:flutter/material.dart';
import 'package:stocktrue/Produits/editproduit.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Detailproduit();
  }
}
class Detailproduit extends StatefulWidget {
  const Detailproduit({super.key});

  @override
  State<Detailproduit> createState() => _DetailproduitState();
}

class _DetailproduitState extends State<Detailproduit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produits"),
      ),
      body: SafeArea(        
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,       
               
            children: [
              const SizedBox(height: 10,),
              Container(              
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.only(left: 10, right: 10),
                width: 315,
                height: 420,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    12
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: const Offset(0, 3)
                    )
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 5,),
                    Container(
          
                       height: 195,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://th.bing.com/th/id/OIP.bGj-6jWQm4G2URDXNCvwnAHaHa?rs=1&pid=ImgDetMain"),
                            ),
                          )
                    ),
                    const SizedBox(height: 5,),
                    const Text("Chaises",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,                    
                    ),
                    
                    ),
                    const Text("Chaises de premiere qaulite to taste before out",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w100,                    
                    ),                  
                    ),
                    const SizedBox(height: 5,),
                    
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Quantite actuel :",
                        style: TextStyle(
                          fontWeight: FontWeight.normal
                        ),
                        ),
                        Text("15",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                    const SizedBox(height: 5,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Prix d'achat actuel :",
                        style: TextStyle(
                          fontWeight: FontWeight.normal
                        ),
                        ),
                        Text("15",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                    
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [       
                                    
                        ElevatedButton(
                          onPressed: (){}, 
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color.fromARGB(255, 16, 131, 33),
                            shadowColor: Colors.orange[1000],
                            
                            shape: RoundedRectangleBorder(                            
                                borderRadius: BorderRadius.circular(8),
                                
                                ),
                          ),
                          child: const Text(
                            "Buy",
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white),
                          )
                          ),
                          ElevatedButton(
                          onPressed: (){}, 
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.redAccent,
                            shadowColor: Colors.orange[1000],                          
                            shape: RoundedRectangleBorder(                            
                                borderRadius: BorderRadius.circular(8),
                                
                                ),
                          ),
                          child: const Text(
                            "Sell",
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white
                              ),
                          )
                          ),
          
                      ],
                    )
                  ],
                ),
                
                ),
                
              ),
              const SizedBox(height: 5,),
            const SizedBox(height: 5,),
              Container(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: [
                    
                ElevatedButton(
                  
                    onPressed: () {
                      Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>Editproduct())
                                  );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: const Color.fromARGB(255, 16, 131, 33),
                      shadowColor: Colors.orange[1000],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Modify",
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white),
                    )),
                ElevatedButton(
                    onPressed: () {},
                    
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      backgroundColor: Colors.redAccent,
                      shadowColor: Colors.orange[1000],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Delete",
                      
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white),
                    )),
                                ],
                              ),
              ),
              
              const SizedBox(height: 10,),
              const Text("Listes des derniers operations",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w100,                                          
                    ),                  
                    ),
                    
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                ),
                )
            
            ],
          ),
        ),
      ),
    );
  }
}