import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stocktrue/Clients/Clients.dart';
import 'package:stocktrue/Colors.dart';
import 'package:stocktrue/Fournisseurs/Fournisseurs.dart';

import 'package:http/http.dart' as http;
import 'package:stocktrue/ip.dart';

List data=[];
String status='';
 String adress='';

Future<void> getrecord () async {
   var url="http://$adress/API_VENTE/CLIENT/getclient.php";
  
  try{
    var response=await http.get(Uri.parse(url));
    if (response.statusCode==200){
      data = jsonDecode(response.body);
      status='Success';
    }
    else{
    }    
  }
  catch (e){
    print(e);
  }
 }
class Paternars extends StatefulWidget {
  const Paternars({super.key});

  @override
  State<Paternars> createState() => _PaternarsState();
}

class _PaternarsState extends State<Paternars> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
adress=currentip();
getrecord();    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        actions: const [IconButton(onPressed: null, icon: Icon(Icons.info_outline))],
        title: const Text("FourniMag",textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
        )
      ),
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
                  labelColor: white(),
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
                            color: princip(), 
                            width: 1
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
                            color: princip(), width: 1
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