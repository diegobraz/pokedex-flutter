import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/screems/details/pages/widget/detail_app_bar_widget.dart';
import 'package:pokedex/features/pokedex/screems/details/pages/widget/detail_list_widget.dart';

import '../../../../common/models/pokemon.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(
      {Key? key,
      required this.list,
      required this.pokemon,
      required this.onback,
      required this.controller,
      required this.onChangePokemon})
      : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onback;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        DetailAppBarWidget(
          pokemon: pokemon,
          onBack: onback,
        ),
        DetailListWidge(
          pokemon: pokemon,
          list: list,
          controller: controller,
          onChangePokemon: onChangePokemon,
        )
      ]),
    );
  }
}
