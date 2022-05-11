import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/common/repositories/pokemon_repository.dart';
import 'package:pokedex/features/pokedex/route/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PokeDex',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: PokedexRoute(
          repository: pokemonRepository(dio: Dio()),
        ));
  }
}
