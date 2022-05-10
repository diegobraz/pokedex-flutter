import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/common/models/pokemon.dart';
import 'package:pokedex/features/common/repositories/pokemon_repository.dart';
import 'package:pokedex/features/home/container/home_container.dart';
import 'package:pokedex/features/home/pages/home_loading.dart';
import 'package:pokedex/features/home/pages/home_page.dart';

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
      home: HomeContainer(repository: pokemonRepository(dio: Dio())),
    );
  }
}
