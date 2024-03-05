import 'package:flutter/material.dart';

import 'HeroInfoFournisseur.dart';
//import 'package:hero/Hero/hero_info.dart';

class HeroDetailsFournisseur extends StatelessWidget {
  final HeroInfoFournisseur items;
  const HeroDetailsFournisseur({super.key,required this.items});

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
