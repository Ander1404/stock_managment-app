import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
class AddClient extends StatefulWidget {
  const AddClient({super.key});

  @override
  State<AddClient> createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  TextEditingController nom=TextEditingController();
  TextEditingController adresse=TextEditingController();
  TextEditingController mail=TextEditingController();
  TextEditingController phone=TextEditingController();
  
Future <void> savadatas() async{  
//     var url="http://192.168.1.67/Myusers/create.php";
//     Uri ulr=Uri.parse(url);
// await http.post(ulr,body: {
//   "name":nom.text,"adresse":adresse.text,"phone":phone.text,"mail":mail.text
// }
// );

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(
        'New Client',
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
                            // border: OutlineInputBorder(
                              
                            // ),
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
                        onPressed: () {savadatas();},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.orange[800],
                          fixedSize: const Size(350, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            
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