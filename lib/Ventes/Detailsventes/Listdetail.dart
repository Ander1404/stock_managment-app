import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stocktrue/Ventes/Detailsventes/AddVentedetail.dart';
// import 'package:stocktrue/Achats/DetailAchat/Adddetail.dart';
// ignore: must_be_immutable
class VentesDetails extends StatefulWidget {
  String code;
  VentesDetails(this.code, {super.key});
  @override
  State<VentesDetails> createState() => _VentesDetailsState();
}

class _VentesDetailsState extends State<VentesDetails> {
  late Future<List<Map<String,dynamic>>> _data;
  Future<List<Map<String,dynamic>>> fetchdata () async {
    final response=await http.get(Uri.parse('uri'));    
      if(response.statusCode==200){
        final data=jsonDecode(response.body)as List;
        return data.cast<Map<String,dynamic>>();
      }
      else{
        throw Exception('Failed to load data');
      }
    
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data=fetchdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Padding(padding: edge)
              const Text("Details de la vente",
                    style: TextStyle(                      
                      fontSize: 15,
                      fontWeight: FontWeight.w100,                                          
                    ),                  
                    ),
              IconButton(
              onPressed: (){
                showBottomSheet(context: context, builder: (context)=>AddVenDetail(widget.code));
              }, 
              icon: const Icon(Icons.add_circle_outline_outlined)),             
              
              ],
              
          ),
          ListView(
            children: [              
          FutureBuilder(future: _data, builder: (context,snapshot){
            if(snapshot.hasData){
              final data=snapshot.data!;
              return DataTable(                
                columnSpacing: 20,
                horizontalMargin: 40,
                columns: const [
                DataColumn(label: Text("Produit",style: TextStyle(fontWeight: FontWeight.bold),)),
                DataColumn(label: Text("Quantite",style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text("Prix",style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text("Prix total",style: TextStyle(fontWeight: FontWeight.bold)))
                ], rows: data.map((item) => DataRow(cells: [
                  DataCell(Text(item['produit'])),
                  DataCell(Text(item['quantite'])),
                  DataCell(Text(item['prixu'])),
                  DataCell(Text(item['prix_total']))                  
                  ])).toList()
                );
            }
            else if(snapshot.hasError){
              return Text('Error: ${snapshot.error}');
            }
            return const CircularProgressIndicator();
          })
        
            ],
          )
        ],
      ),
    );
  }
}