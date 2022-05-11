import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/screems/details/container/detail_container.dart';

import '../../../../common/models/pokemon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.pokeList, required this.onItemMap})
      : super(key: key);
  final List<Pokemon> pokeList;
  final Function(String, DetailArguments) onItemMap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: pokeList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(pokeList[index].name),
              onTap: () => onItemMap(
                  '/details', DetailArguments(name: pokeList[index].name)),
            );
          }),
    );
  }
}
