import 'package:flutter/material.dart';

import 'HeroInfoCat.dart';


//import 'package:hero/Hero/hero_info.dart';

class HeroDetailsCat extends StatelessWidget {
  final HeroInfoCat items;
  const HeroDetailsCat({super.key,required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(items.title),
      ),

      body: Center(
        child: Hero(
            tag: items.image,
            child: Image.asset(items.image)),
      ),
    );
  }
}
