import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/screems/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/screems/home/pages/widgets/pokemon_item_widget.dart';

import '../../../../common/models/pokemon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.pokeList, required this.onItemMap})
      : super(key: key);
  final List<Pokemon> pokeList;
  final Function(String, DetailArguments) onItemMap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Pokedex",
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu, color: Colors.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 24,
          children: pokeList
              .map((e) => PokemonItemWidget(
                    pokemon: e,
                    onTap: onItemMap,
                    index: pokeList.indexOf(e),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
