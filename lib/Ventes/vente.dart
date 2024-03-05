import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stocktrue/Ventes/AddVentes.dart';

class Ventes extends StatefulWidget {
  const Ventes({super.key});

  @override
  State<Ventes> createState() => _VentesState();
}

class _VentesState extends State<Ventes> {
  void delete(){
    
  }
  double screenheigth=0;
  double screenwith=0;
  @override
  Widget build(BuildContext context) {
     screenwith=MediaQuery.of(context).size.width;
     screenheigth=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // centerTitle: true,
        actions: const [IconButton(onPressed: null, icon: Icon(Icons.info_outline))],
        title: const Text("FourniMag",textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
        )
      ),
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context,index){
            return Slidable(
              key: Key('$index'),
              endActionPane: ActionPane(motion: const ScrollMotion(), 
              children: [
                SlidableAction(onPressed: (context){
                  setState(() {
                    
                  });
                  
                  const DecoratedBox(
                    decoration: BoxDecoration(
                        
                  ),
                  );
                },
                
                //backgroundColor: const Color.fromARGB(255, 11, 92, 23),
                foregroundColor: const Color.fromARGB(255, 11, 92, 23),
                icon: Icons.insert_drive_file_sharp,
                
                ),
                const SizedBox(width: 10,),
                SlidableAction(onPressed: (context){
                  
                },
                foregroundColor: Colors.red,
                icon: Icons.delete,
                )
              ]),
              child: Padding(
                padding:  const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(                    
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  padding: const EdgeInsets.all(10.0),
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1.0,
                        spreadRadius: 1.0,
                        color: Colors.grey[400]!,
                      )
                    ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRect(
                        child: Text(
                          "${index +1}. ",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400
                          ),
                          ),
                      ),
                      
                       const Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,    
                                        
                        
                        children: [                
                          Padding(padding: EdgeInsets.only(left: 30)),        
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Row(                      
                              
                                                  //     mainAxisAlignment: MainAxisAlignment.center,
                                                  // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [                              
                                 Text("Clients",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Row(
                               children: [                              
                                Text("Montants",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                ),
                                )
                              ],
                            ),
                          ),
                          
                        ],
                      ),
                      SizedBox(width: screenwith/15,),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Date")
                        ],
                      ),
                      SizedBox(width: screenwith/5,),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: null,
                           icon: Icon(Icons.price_change))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
        
        
        }
        ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Addventes()));            
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