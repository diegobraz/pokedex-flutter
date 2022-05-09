import 'package:flutter/material.dart';

import '../../common/models/pokemon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.pokeList}) : super(key: key);
  final List<Pokemon> pokeList;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
