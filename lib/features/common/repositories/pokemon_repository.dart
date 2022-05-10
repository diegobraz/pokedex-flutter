import 'dart:convert';

import 'package:pokedex/features/common/const/api_cost.dart';
import 'package:pokedex/features/common/error/failure.dart';
import 'package:pokedex/features/common/models/pokemon.dart';
import 'package:dio/dio.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemons();
}

class pokemonRepository implements IPokemonRepository {
  final Dio dio;

  pokemonRepository({required this.dio});
  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(ApiConsts.allPokemonsURL);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Failure(message: "Não foi possivel carregar os dados");
    }
  }
}
