import 'package:flutter/material.dart';
import 'package:stocktrue/Clients/Clients.dart';
import 'package:stocktrue/Colors.dart';
import 'package:stocktrue/Fournisseurs/Fournisseurs.dart';

class Paternars extends StatefulWidget {
  const Paternars({super.key});

  @override
  State<Paternars> createState() => _PaternarsState();
}

class _PaternarsState extends State<Paternars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: DefaultTabController(
        length: 2, 
        child: Column(
          children: [
            //Text("data"),
            Material(
              child: Container(
                height: 55,
                color: white(),
                child: TabBar(
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.only(
                    top: 10,left: 10,right: 10, bottom: 10
                  ),
                  unselectedLabelColor: blacks(),
                  labelColor: blacks(),
                  //indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 255, 173, 66)
                  ),
                  tabs: [
                     Tab(
                      child: Container(
                        height: 37,                        
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.orange, width: 1
                          )
                        ),
                        child:const Align(
                          
                          alignment: Alignment.center,
                          child: Text("Clients",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.orangeAccent, width: 1
                          )
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text("Fournisseurs"),
                        ),
                      ),
                    ),
                    // Tab(
                    //   child: Container(
                    //     height: 35,
                    //     // decoration: BoxDecoration(
                    //     //   borderRadius: BorderRadius.circular(30),
                    //     //   border: Border.all(
                    //     //     color: Colors.orangeAccent, width: 1
                    //     //   )
                    //     // ),
                    //     child: const Align(
                    //       alignment: Alignment.center,
                    //       child: Text("A propos",style: TextStyle(
                    //         color: Color.fromARGB(255, 56, 56, 56)
                    //       ),),
                    //     ),
                    //   ),
                    // )
                  ]
                  
                  
                  )
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                 Clients(),
                  Fournisseurs(),
                  // Center(child: Text("data"),),
                ],
              )
              )
          ],
        )
        )
    ,
    );
  }
}