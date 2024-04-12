import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stocktrue/Produits/mobile.dart';
import 'package:stocktrue/ip.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_pdf/pdf.dart';
// ignore: must_be_immutable
class Lisventedet extends StatefulWidget {
  String code;
  Lisventedet(this.code,{super.key});

  @override
  State<Lisventedet> createState() => _LisventedetState();
}

class _LisventedetState extends State<Lisventedet> {
  TextEditingController codevente = TextEditingController();
  TextEditingController codeproduit = TextEditingController();
  TextEditingController quantite = TextEditingController();  
  TextEditingController prixu = TextEditingController();
  // List<Achatdetail> clients = [];
  Map<String, dynamic> once={};
  String client="";
  
String adress=currentip();
  List data=[];
  var selectedname;
  var selectedvalue;
   var seleccat;
  late Future<List<Map<String,dynamic>>> _data;
  // late Future<List<Map<String,dynamic>>> _datas;
  List _datas=[];
   Future<void> fetchdataS () async {
    final response=await http.post(
      Uri.parse('http://$adress/API_VENTE/DETAILVENTE/Get.php'),
      body: {
        "id":widget.code
      }
      );          
      if(response.statusCode==200){
        final data=jsonDecode(response.body)as List;
        setState(() {
          // _datas=data as Future<List<Map<String, dynamic>>>;
          // _datas= data.cast<Map<String,dynamic>>() as Future<List<Map<String, dynamic>>>;
          _datas=data;
          print(_datas);
        });
         
      }
      else{
        throw Exception('Failed to load data');
      }
    
  }
   Future<List<Map<String,dynamic>>> fetchdata () async {
    final response=await http.post(
      Uri.parse('http://$adress/API_VENTE/DETAILVENTE/Get.php'),
      body: {
        "id":widget.code
      }
      );          
      if(response.statusCode==200){
        final data=jsonDecode(response.body)as List;
        setState(() {
          _datas=data;
        });
        return data.cast<Map<String,dynamic>>();
      }
      else{
        throw Exception('Failed to load data');
      }
    
  }
  
  Future<void> _createPDF(String date, String nom, String code) async {
  List m=await fetchdata();
    PdfDocument document = PdfDocument();
    final page = document.pages.add();
        PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 25),
        cellPadding: PdfPaddings(left: 2, right: 2, top: 2, bottom: 2));

    grid.columns.add(count: 4);
    grid.headers.add(1);
    // grid.columns.add(
    //   column: PdfGridColumn(grid)
    // );
  
PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Produits';
    header.cells[1].value = 'Quantite';
    header.cells[2].value = 'Prix u';
    header.cells[3].value = 'PT';
  
   
// for(int i=0;i<m.length;i++){
int i=0;
  for(Map<String,dynamic> item in m){
  PdfGridRow row = grid.rows.add();
  // print(item['quantite'])
    row.cells[i].value = item['produit'];
    row.cells[i+1].value = item['quantite'].toString();
    row.cells[i+2].value = item['prixu'];
    row.cells[i+3].value = item['prix_total'];
    // c=c+int.parse(item['prix_total']);
  }
    page.graphics.drawString(      
             'Facture Numero: \n Nom:$nom \n Date:$date \n Code:$code \n ',
             
        PdfStandardFont(PdfFontFamily.helvetica,60,style: PdfFontStyle.bold)
        );
// Container(
//   child: Center(child: ,),

// );
    
        // const SizedBox(height: 12,);
        // page.graphics.drawString('\n Nom: $nom',
        // PdfStandardFont(PdfFontFamily.helvetica, 17),
        
        // );
        // const SizedBox(height: 12,);
        // page.graphics.drawString('\n Date: $date',
        // PdfStandardFont(PdfFontFamily.helvetica, 17),
        
        // );
        // const SizedBox(height: 12,);
        // page.graphics.drawString('\n Code: $code',
        // PdfStandardFont(PdfFontFamily.helvetica, 17),
        
        // );

    // page.graphics.drawImage(
    //     PdfBitmap(await _readImageData('Pdf_Succinctly.jpg')),
    //     Rect.fromLTWH(0, 100, 440, 550));


  
// int i=0;
// for(var item in m){
//   PdfGridRow row = grid.rows.add();
//     row.cells[i].value = '1';
//     row.cells[i+1].value = 'Arya';
//     row.cells[i+2].value = '6';
//     row.cells[i+3].value = '6';
// }
    

    // row = grid.rows.add();
    // row.cells[0].value = '2';
    // row.cells[1].value = 'John';
    // row.cells[2].value = '9';

    // row = grid.rows.add();
    // row.cells[0].value = '3';
    // row.cells[1].value = 'Tony';
    // row.cells[2].value = '8';

    // grid.draw(
    //     page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0)        
    //     );
    grid.style = PdfGridStyle(
    cellPadding: PdfPaddings(left: 2, right: 3, top: 4, bottom: 2),
    
    backgroundBrush: PdfBrushes.blanchedAlmond,
    textBrush: PdfBrushes.black,
    font: PdfStandardFont(PdfFontFamily.timesRoman, 25));
//Draw 
     grid.draw(
        
        page: document.pages.add(),

        bounds: const Rect.fromLTWH(10, 0, 0, 0)        
        );
        
    List<int> bytes =await document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }
Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load('images/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
 void sms(String ms){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(ms),
    duration: const Duration(seconds: 1),
    ));
}
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data=fetchdata();
    fetchdataS();
    getrecord();
  }

Future <void> savadatas() async{  
    var url="http://$adress/API_VENTE/DETAILVENTE/insertdetailvente.php";
    // var t="http://192.168.215.182/API_VENTE/DETAILAPPROVISIONNEMENT/postapp.php";
    Uri ulr=Uri.parse(url);
    var request = http.MultipartRequest('POST', ulr);
    request.fields['vente_id'] = widget.code;
      request.fields['produit_id'] = selectedname;
      request.fields['quantite'] = quantite.text;
      request.fields['prixu'] = prixu.text;
       var res = await request.send();
      var response = await http.Response.fromStream(res);
      if (response.statusCode == 200) {
        // showToast(msg: "Succès !");
        fetchdataS();
        setState(() {
          _data= fetchdata();
        });
      } else {
        print("error"); 
      }
}


Future<void> getrecord () async {
   var url="http://$adress/API_VENTE/PRODUIT/getproduit.php";  
  try{
    var response=await http.get(Uri.parse(url));
    setState(() {
      data=jsonDecode(response.body);
      print(data);
    });    
  }
  catch (e){
    print(e);
  }
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 30,),
      body: ListView(
        children: [
              Padding(
                padding: const EdgeInsets.only(right:12.0,left: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,              
                  children: [
                    const Text("Details de la vente",
                          style: TextStyle(                      
                            fontSize: 17,
                            fontWeight: FontWeight.w800,                                          
                          ),                  
                          ),
                          IconButton(onPressed: (){
                            String v= DateTime.now.toString();
                            _createPDF(v, "nom", "code");
                          }, icon: const Icon(Icons.print)),
                          
                    IconButton(
                    onPressed: (){
                      
                      // showModalBottomSheet(
                        
                      //   context: context, builder: (context)=>ModalShow(widget.code));
                      showDialog(context: context, 
                      builder: (BuildContext context){
                        return Dialog(                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                   height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListView(
                    children: [
                      Padding(padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
            
            const Text("Ajouter plus de detail",style: TextStyle(
              fontSize: 18,fontWeight: FontWeight.w300
            ),),
            const SizedBox(height: 25,),
            DropdownButtonFormField(
            // hint: const Text("Select client"),
          //  if(){}
            items:data.map((list){
              if(data.isEmpty){
                // return Circ;
              }
                return DropdownMenuItem(   
                  value: list["id_produit"],
                  child: Text(list["designation"]),
                  );
          }
          ).toList(),
          //onChanged: onChanged,
          
          value: selectedvalue,          
          icon: const Icon(Icons.arrow_drop_down_circle),
          decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.production_quantity_limits),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  hintText: "Produit",
                  labelText: "Produit"),
          onChanged: (value){
            selectedvalue=value;
            // client=selectedvalue;
            setState(() {
              selectedname=value.toString();
            });
            
            print(selectedname);
          },
              ),
             
              const SizedBox(height: 10),
            TextField(
              controller: quantite,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.production_quantity_limits_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  
                  hintText: "Quantite",
                  labelText: "Quantite"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: prixu,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.monetization_on),                  
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  
                  hintText: "Prix de l'article",
                  labelText: "Prix"),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right:5.0,left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              const SizedBox(width: 15,),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if(quantite.text.isEmpty || prixu.text.isEmpty){
                      sms("Completer tous les champs");
                    }
                    else{
                      // int t=in
                      if (int.parse(quantite.text)<=0 || int.parse(prixu.text)<=0){
                        sms("Entrer des valeurs superieurs");
                      }
                      else{
                        savadatas();
                        setState(() {
                          _data=fetchdata();
                        });
                      }
                      
                    }
                    
                  });         
                  
                },
                child: const Text('Vendre'),
              ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
          ],
        
                      ),
                      ),
                      
                    ],
                  ),
                ),
                );
                      }
                      
                      );
                    }, 
                    icon: const Icon(Icons.add_circle_outline_outlined)),             
                    
                    ],
                    
                ),
              ),
              
              // ListView(
              //   children: [              
              FutureBuilder(future: _data, builder: (context,snapshot){
                if(snapshot.hasData){
                  final data=snapshot.data!;
                  return DataTable(                
                    columnSpacing: 20,
                    horizontalMargin: 20,
                    columns: const [
                    DataColumn(label: Text("Produit",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 150, 138, 6)),)),
                    DataColumn(label: Text("Quantite",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 150, 138, 6)))),
                    DataColumn(label: Text("Prix",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 150, 138, 6)))),
                    DataColumn(label: Text("PT",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 150, 138, 6))))
                    ], rows: data.map((item) => DataRow(cells: [
                      DataCell(Text(item['produit'])),
                      DataCell(Text(item['quantite'].toString())),
                      DataCell(Text(item['prixu'].toString())),
                      DataCell(Text(item['prix_total'].toString()))                  
                      ])).toList()
                    );
                }
                else if(snapshot.hasError){
                  return Text('Error: ${snapshot.error}');
                  // return const CircularProgressIndicator();
                }
                return const CircularProgressIndicator();
              })
            
              //   ],
              // )
       
        ],
      ),
    );
  
  }
}