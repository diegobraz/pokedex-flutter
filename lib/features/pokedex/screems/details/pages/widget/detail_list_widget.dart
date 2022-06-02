import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/screems/details/pages/widget/detail_item_widget.dart';

import '../../../../../common/models/pokemon.dart';

class DetailListWidge extends StatelessWidget {
  const DetailListWidge(
      {Key? key,
      required this.pokemon,
      required this.list,
      required this.controller,
      required this.onChangePokemon})
      : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    '#${pokemon.num}',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: PageView(
                onPageChanged: (index) {
                  onChangePokemon(list[index]);
                },
                controller: controller,
                children: list.map((e) {
                  bool diff = e.name != pokemon.name;
                  return DetailItemListWidget(isDiff: diff, pokemon: e);
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
