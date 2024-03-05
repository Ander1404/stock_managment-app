import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  State<Addproduct> createState() => AddproductState();
}

class AddproductState extends State<Addproduct> {
  // Future<XFile?> pickImage(ImageSource source) async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: source);
  //   return image;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(
        'New Product',
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
