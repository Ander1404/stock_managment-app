import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:stocktrue/Produits/mobile.dart';
import 'package:stocktrue/main.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../ip.dart';
// ignore: must_be_immutable
class Detailproduit extends StatefulWidget {
  String code;
  String desigantion;
  // String designation;
  // String quantite;
  // String prixu;
  // String image;
   Detailproduit(this.code,this.desigantion,{super.key});

  @override
  State<Detailproduit> createState() => _DetailproduitState();
}

class _DetailproduitState extends State<Detailproduit> {
  //COmment 
  
  File? _image;
  // late Future<List<Map<String,dynamic>>> _data;
  // final Future<List<Map<String,dynamic>>> _data2= await fetchdata();
  // String adress=currentip();
  Future<List<Map<String,dynamic>>> fetchdata () async {
    final response=await http.post(
      Uri.parse('http://$adress/API_VENTE/MOUVEMENT/getmv.php'),
      body: {
        "id":widget.code
      }
      );          
      if(response.statusCode==200){
        final data=jsonDecode(response.body)as List;
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
        font: PdfStandardFont(PdfFontFamily.helvetica, 15),
        cellPadding: PdfPaddings(left: 2, right: 2, top: 2, bottom: 2));

    grid.columns.add(count: 5);
    grid.headers.add(1);
    // grid.columns.add(
    //   column: PdfGridColumn(grid)
    // );
  
PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Type';
    header.cells[1].value = 'Date';
    header.cells[2].value = 'Quantite';
    header.cells[3].value = 'Prix u';
    header.cells[4].value = 'PT';
  
   
// for(int i=0;i<m.length;i++){
int i=0;
  for(Map<String,dynamic> item in m){
  PdfGridRow row = grid.rows.add();
  // print(item['quantite'])
  
    // row.cells[i].value = item['produit'];
    row.cells[i].value = item['type_operation'].toString();
    row.cells[i+1].value = item['dateoperation'];    
    row.cells[i+2].value = item['quantite'];
    row.cells[i+3].value = item['prixu'];    
    row.cells[i+4].value = item['pt'];
    // row.cells[i+5].value = item['dateoperation'];
    // c=c+int.parse(item['prix_total']);
  }
    page.graphics.drawString(      
             'Fichde de stock: $code\n Nom:$nom \n Date:$date ',
             
        PdfStandardFont(PdfFontFamily.helvetica,50,style: PdfFontStyle.bold)
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
    cellPadding: PdfPaddings(left: 0, right: 0, top: 4, bottom: 2),
    
    backgroundBrush: PdfBrushes.blanchedAlmond,
    textBrush: PdfBrushes.black,
    font: PdfStandardFont(PdfFontFamily.timesRoman, 15));
//Draw 
     grid.draw(
        
        page: document.pages.add(),

        bounds: const Rect.fromLTWH(10, 0, 0, 0)        
        );
        
    List<int> bytes =await document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Fiche.pdf');
  }

var selectedvalue;
var selectedname;
TextEditingController nom=TextEditingController();
String adress=currentip();
Future<void> savadatas() async {
    
    try {
      var url = "http://$adress/API_VENTE/PRODUIT/insertproduit.php";
      Uri ulr = Uri.parse(url);
      var request = http.MultipartRequest('POST', ulr);
      request.fields['designation'] = nom.text;
      request.fields['categorie_id'] = "1";
      request.files.add(http.MultipartFile.fromBytes(
          'image1', File(_image!.path).readAsBytesSync(),
          filename: _image!.path));
      var res = await request.send();
      var response = await http.Response.fromStream(res);

      if (response.statusCode == 200) {
        bar("Success insert");
      } else {
        bar("Error insert");
      }
    } catch (e) {
      bar(e.toString());
      print(e);
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Erreur lors de la sélection de l\'image : $e');
    }
  }
  void bar(String description){
    ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content: Text(description),
          duration: const Duration(seconds: 3),
        ),
      );
  }
  List d=[];
  Future<void> getrecord() async {
    var url = "http://$adress/API_VENTE/CATEGORIEPROD/getcategorie.php";
    try {
      var response = await http.get(Uri.parse(url));
      setState(() {
        d = jsonDecode(response.body);
        print(d);
        // status = 'Success';
      });
        
      // } else {}
    } catch (e) {
      print(e);
    }
  }
  
  //Else one
  List dataens = [];
// String adress=currentip();
  Future<void> getrecords() async {
    var url="http://$adress/API_VENTE/PRODUIT/gettrie.php";  
 final response=await http.post(
      Uri.parse(url),
      body: {
        "id":widget.code
      }
      );          
      if(response.statusCode==200){
        setState(() {
          dataens=jsonDecode(response.body)as List;
        });
        // final data=
      }
      else{
        throw Exception('Failed to load data');
      }
  }
  Future <void> delrecord() async{
    var url="http://$adress/API_VENTE/PRODUIT/deleteproduit.php";  
 final response=await http.post(
      Uri.parse(url),
      body: {
        "id_produit":widget.code
      }
      );          
      if(response.statusCode==200){
        print("Success delete");        // final data=
      }
      else{
        throw Exception('Failed to load data');
      }
  }
 @override
  void initState() {
    // TODO: implement initState
    getrecord();
    getrecords();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    // final sreenh = MediaQuery.of(context).size.height;
    // final sreenw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.desigantion),
      ),
      body: SafeArea(        
        child: dataens.isEmpty?const CircularProgressIndicator():
        SingleChildScrollView(
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
                            image:  DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  "http://$adress/API_VENTE/PRODUIT/"+dataens[0]["image"]
                                  ),
                            ),
                          )
                    ),
                    const SizedBox(height: 5,),
                     Text(dataens[0]["designation"],
                    style: const TextStyle(
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
                    
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // ignore: prefer_interpolation_to_compose_strings
                        const Text("Quantite actuel :",
                        style: TextStyle(
                          fontWeight: FontWeight.normal
                        ),
                        ),
                        Text(dataens[0]["quantite"].toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                    const SizedBox(height: 5,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Prix d'achat actuel :",
                        style: TextStyle(
                          fontWeight: FontWeight.normal
                        ),
                        ),
                        Text(dataens[0]["prixu"].toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                    
                    const SizedBox(height: 5,),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [       
                                    
                        IconButton(
                          icon: const Icon(Icons.print),
                          onPressed: (){
                            DateTime t=DateTime.now();
                            bar("Show me");
                            _createPDF(t.toString(), widget.desigantion, widget.code);
                //             showDialog(
                //               context: context, 
                //               builder: (BuildContext context){
                //                   return Dialog(                                
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(10.0),
                // ),
                // child: Container(
                //    padding: const EdgeInsets.all(20.0),
                //   height: 320,
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(10.0),
                //   ),
                //   child: ListView(
                //     children: [
                            

                //     ],
                //   )
                // )
                // );
                //               }
                //               );
                          
                          }, 
                          color: Colors.white,
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color.fromARGB(255, 16, 131, 33),
                            // shadowColor: Colors.orange[1000],
                            
                            shape: RoundedRectangleBorder(                            
                                borderRadius: BorderRadius.circular(8),
                                
                                ),
                          ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                          onPressed: (){
                            delrecord(
                              
                            );
                            Navigator.pushAndRemoveUntil(
            context, 
            CupertinoPageRoute(builder: (context)=>const Homescreen()), (Route<dynamic>route)=>false,);
                          }, 
                          color: Colors.white,
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.redAccent,
                            shadowColor: Colors.orange[1000],                          
                            shape: RoundedRectangleBorder(                            
                                borderRadius: BorderRadius.circular(8),
                                
                                ),
                          ),
                          ),
          
                      ],
                    )
                  ],
                ),
                
                ),
                
              ),
              const SizedBox(height: 5,),
              
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