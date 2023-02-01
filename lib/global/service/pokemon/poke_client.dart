import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../data/entity/pokemon.dart';
import '../../data/response/pokemon_list.dart';

part 'poke_client.g.dart';

@RestApi(baseUrl: 'https://pokeapi.co/api/v2/')
abstract class PokeClient {
  factory PokeClient(Dio dio, {String baseUrl}) = _PokeClient;

  @GET('pokemon')
  Future<PokemonList> getPokemonList({
    @Query('offset') int offset = 0,
    @Query('limit') int limit = 20,
  });

  @GET('pokemon/{id}')
  Future<Pokemon> getPokemonDetail(@Path('id') dynamic id);
}
