
import 'package:flutter/material.dart';

import 'home/HomeCat.dart';

class Cat extends StatefulWidget {
  const Cat({super.key});

  @override
  State<Cat> createState() => _CatState();
}

class _CatState extends State<Cat> {
  @override
  Widget build(BuildContext context) {
    return const HomeCat();
  }
}