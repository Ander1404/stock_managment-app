import 'dart:convert';
// import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
import 'package:stocktrue/Achats/DetailAchat/Adddetail.dart';
import 'package:stocktrue/ip.dart';
// ignore: must_be_immutable
class Listdetail extends StatefulWidget {
  String code;
  Listdetail(this.code, {super.key});

  @override
  State<Listdetail> createState() => _ListdetailState();
}

class _ListdetailState extends State<Listdetail> {
  TextEditingController codevente = TextEditingController();
  TextEditingController codeproduit = TextEditingController();
  TextEditingController quantite = TextEditingController();  
  TextEditingController prixu = TextEditingController();
  List<Achatdetail> clients = [];
  Map<String, dynamic> once={};
  String client="";
  
String adress=currentip();
  List data=[];
  var selectedname;
  var selectedvalue;
   var seleccat;
  late Future<List<Map<String,dynamic>>> _data;
  // String adress=currentip();
  Future<List<Map<String,dynamic>>> fetchdata () async {
    final response=await http.post(
      Uri.parse('http://$adress/API_VENTE/DETAILAPPROVISIONNEMENT/Get.php'),
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data=fetchdata();
    getrecord();
  }
  void sms(String ms){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(ms),
    duration: const Duration(seconds: 1),
    ));
}

 
Future <void> savadatas() async{  
    var url="http://$adress/API_VENTE/DETAILAPPROVISIONNEMENT/postapp.php";
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
        _data= fetchdata();
        print('Success');
      } else {
        print("error"); 
      }
}

 Future <void> savadatass() async{
  
    var url="http://$adress/API_VENTE/DETAILAPPROVISIONNEMENT/postapp.php";
    Uri ulr=Uri.parse(url);
await http.post(ulr,body: {
  "vente_id":widget.code,
  "produit_id:":selectedname,
  "quantite":quantite.text,
  "prixu":prixu.text
});
    print("in");//Map <String, String> body = {"name":txtnom.text,"pass":pass.text,"roles":role.text};
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
    // User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(toolbarHeight: 30,),
      body: ListView(
        children: [
              Padding(
                padding: const EdgeInsets.only(right:12.0,left: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,              
                  children: [
                    const Text("Details de l'achat",
                          style: TextStyle(                      
                            fontSize: 17,
                            fontWeight: FontWeight.w100,                                          
                          ),                  
                          ),
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
            items:data.map((list){
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
                    ElevatedButton(
                onPressed: () {
                   if(quantite.text=="" || prixu.text=="" || selectedname==""){
                    sms("Entrer tous les champs");
                  }
                  else{
                    setState(() {
                    //   print(selectedname);
                    //   clients.add(Achatdetail(
                    //   codeproduit: int.parse(selectedname),
                    //   quantite: int.parse(quantite.text),
                    //   prixu: double.parse(prixu.text) ,
                    //   codevente: int.parse(widget.code),
                    // ));
                    savadatass();
                    });                    
                  }
                  // Efface les champs après l'ajout
                  // codeproduit.clear();
                  // quantite.clear();
                  // prixu.clear();
                },
                child: const Text('Ajouter un autre produit'),
              ),
              const SizedBox(width: 15,),
              ElevatedButton(
                onPressed: () {
                  // Affiche les données au format JSON
                  // print(clients.map((client) => client.toJson()).toList());
                  // print(clients);
                  
                  // List j=clients.map((e) => e.toJson()).toList();
                  // print(j);
                       print(selectedname);
                       print(quantite.text);
                       print(prixu.text);
                       print(widget.code);
                  setState(() {
                    savadatas();
                  });         
                  
                },
                child: const Text('Acheter'),
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
                    DataColumn(label: Text("Produit",style: TextStyle(fontWeight: FontWeight.bold),)),
                    DataColumn(label: Text("Quantite",style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Prix",style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Prix total",style: TextStyle(fontWeight: FontWeight.bold)))
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
// ignore: must_be_immutable
class ModalShow extends StatefulWidget {
  String idachat='';
  ModalShow(this.idachat,{super.key});

  @override
  State<ModalShow> createState() => _ModalShowState();
}

class _ModalShowState extends State<ModalShow> {
  TextEditingController codevente = TextEditingController();
  TextEditingController codeproduit = TextEditingController();
  TextEditingController quantite = TextEditingController();  
  TextEditingController prixu = TextEditingController();
  List<Achatdetail> clients = [];
  Map<String, dynamic> once={};
  String client="";
  
String adress=currentip();
  List data=[];
  var selectedname;
  var selectedvalue;
   var seleccat;

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
  void initState() {
    // TODO: implement initState
    getrecord();
    super.initState();
  }
  Future <void> savadatas(List d) async{  
    var url="http://$adress/API_VENTE/DETAILAPPROVISIONNEMENT/insertdetailapprovisionnement.php";
    Uri ulr=Uri.parse(url);

await http.post(ulr,body: {
  "datadetail":d
});
    // Map <String, String> body = {"name":txtnom.text,"pass":pass.text,"roles":role.text};
}
void sms(String ms){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(ms),
    duration: const Duration(seconds: 1),
    ));
}
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            const Text("Ajouter plus de detail",style: TextStyle(
              fontSize: 18,fontWeight: FontWeight.w300
            ),),
            const SizedBox(height: 25,),
            DropdownButtonFormField(
            // hint: const Text("Select client"),
            items:data.map((list){
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    ElevatedButton(
                onPressed: () {
                   if(quantite.text=="" || prixu.text=="" || selectedname==""){
                    sms("Entrer tous les champs");
                  }
                  else{
                    setState(() {
                      print(selectedname);
                      clients.add(Achatdetail(
                      codeproduit: int.parse(selectedname),
                      quantite: int.parse(quantite.text),
                      prixu: double.parse(prixu.text) ,
                      codevente: int.parse(widget.idachat),
                    ));
                    });
                    
                  }
                  // Efface les champs après l'ajout
                  // codeproduit.clear();
                  quantite.clear();
                  prixu.clear();
                },
                child: const Text('Ajouter un autre produit'),
              ),
              const SizedBox(width: 15,),
              ElevatedButton(
                onPressed: () {
                  // Affiche les données au format JSON
                  // print(clients.map((client) => client.toJson()).toList());
                  // print(clients);
                  
                  List j=clients.map((e) => e.toJson()).toList();
                  print(j);
                  savadatas(j);
                  
                  
                },
                child: const Text('Acheter'),
              ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
          ],
        
        ),
      ),
    
        ],
    );
    
  }
}