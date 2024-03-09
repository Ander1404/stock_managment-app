import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stocktrue/ip.dart';
class AddFournisseur extends StatefulWidget {
  const AddFournisseur({super.key});

  @override
  State<AddFournisseur> createState() => _AddFournisseurState();
}

class _AddFournisseurState extends State<AddFournisseur> {
  
  TextEditingController nom=TextEditingController();
  TextEditingController adresse=TextEditingController();
  TextEditingController mail=TextEditingController();
  TextEditingController phone=TextEditingController();
  late String adresseip;
 Future <void> savadatas() async{  
    var url="http://$adresseip/API_VENTE/FOURNISSEUR/insertfournisseur.php";
    Uri ulr=Uri.parse(url);

await http.post(ulr,body: {
  "noms":nom.text,"adresse":adresse.text,"mail":mail.text,"telephone":phone.text
});
    // Map <String, String> body = {"name":txtnom.text,"pass":pass.text,"roles":role.text};
}
@override
  void initState() {
    // TODO: implement initState
    adresseip=currentip();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(
        'New Supplier',
        textAlign: TextAlign.right,
        style: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,          
        ),
        )),
      body: ListView.builder(
          itemCount: 1, // Number of items in the list
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                       TextField(
                          controller: nom,
                          decoration: const InputDecoration(
                              hintText: "Nom du client", labelText: "Nom")),
                      const SizedBox(height: 25),
                       TextField(
                          controller: adresse,
                          decoration: const InputDecoration(
                              hintText: "Adresse du client",
                              labelText: "Adresse")),
                              const SizedBox(height: 25),
                       TextField(
                          controller: phone,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(                            
                              hintText: "Contact du client",
                              labelText: "Contact")),
                              const SizedBox(height: 25),
                       TextField(
                          controller: mail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              hintText: "Mail du client",
                              labelText: "mail")
                              ),
                      const SizedBox(
                        height: 25,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          savadatas();
                          
                          },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          // backgroundColor: Colors.orange[800],
                          fixedSize: const Size(350, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            // color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  
  }
}