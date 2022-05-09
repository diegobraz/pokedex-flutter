import 'package:pokedex/features/common/models/pokemon.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemons();
}

class pokemonRepository implements IPokemonRepository {
  @override
  Future<List<Pokemon>> getAllPokemons() {
    // TODO: implement getAllPokemons
    throw UnimplementedError();
  }
}
