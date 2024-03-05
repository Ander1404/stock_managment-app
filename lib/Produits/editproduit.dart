import 'package:flutter/material.dart';

class Editproduct extends StatefulWidget {
  const Editproduct({super.key});

  @override
  State<Editproduct> createState() => _EditproductState();
}

class _EditproductState extends State<Editproduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(
        'Edit Product',
        textAlign: TextAlign.right,
        style: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,          
        ),
        )),
      body:  SingleChildScrollView(
        child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        const TextField(
                            controller: null,
                            decoration: InputDecoration(
                                hintText: "Nom du produits", labelText: "Nom")),
                        const SizedBox(height: 25),
                        const TextField(
                            controller: null,
                            decoration: InputDecoration(
                                hintText: "Description du produits",
                                labelText: "Description")),
                        const SizedBox(
                          height: 25,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          // async {
                          //   final XFile? image = await pickImage(
                          //       ImageSource.camera); // Choose source here
                          //   if (image != null) {
                          //     // Handle the picked image: display it, upload it, etc.
                          //     // Use image.path to access the image file path
                          //   }
                          // },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.white,
                            shadowColor: Colors.orange[1000],
                            
                            shape: RoundedRectangleBorder(
                              
                                borderRadius: BorderRadius.circular(8),
                                
                                ),
                          ),
                          child: const Text(
                            'Pick Image',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.orange[800],
                            fixedSize: const Size(350, 45),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text(
                            'Confirm',
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
              ),
      )
          
          
          ,
    );  
  
  }
}