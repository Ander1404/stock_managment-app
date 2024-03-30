import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
class AddCat extends StatefulWidget {
  const AddCat({super.key});

  @override
  State<AddCat> createState() => _AddCatState();
}

class _AddCatState extends State<AddCat> {
  TextEditingController designation=TextEditingController();
  TextEditingController detail=TextEditingController();
  
Future <void> savadatas() async{
  
//     var url="http://192.168.1.67/Myusers/create.php";
//     Uri ulr=Uri.parse(url);

// await http.post(ulr,body: {
//   "Designation":designation.text,"detail":detail.text,
// });

}


  @override
  Widget build(BuildContext context) {
    return Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                       TextField(
                          controller: designation,
                          
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.description),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange),
                              
                            ),
                              hintText: "Designation Categorie", labelText: "Designation")),
                      const SizedBox(height: 25),
                       TextField(
                          controller: detail,
                          decoration: const InputDecoration(
                              hintText: "Detail categorie",
                              labelText: "Detail")),
                              const SizedBox(height: 25),
                       
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
                );
              

    
  }
}