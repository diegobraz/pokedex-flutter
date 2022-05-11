import 'package:flutter/material.dart';
import 'package:pokedex/features/common/error/failure.dart';
import 'package:pokedex/features/common/models/pokemon.dart';
import 'package:pokedex/features/common/repositories/pokemon_repository.dart';
import 'package:pokedex/features/pokedex/screems/details/container/detail_container.dart';

import '../pages/home_error.dart';
import '../pages/home_loading.dart';
import '../pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer(
      {Key? key, required this.repository, required this.onItemMap})
      : super(key: key);
  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemMap;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return HomeLoading();
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(
            pokeList: snapshot.data!,
            onItemMap: onItemMap,
          );
        }

        if (snapshot.hasError) {
          return HomeError(
            error: (snapshot.error as Failure).message!,
          );
        }

        return Container();
      },
    );
  }
}
