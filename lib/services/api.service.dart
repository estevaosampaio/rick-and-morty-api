import 'package:dio/dio.dart';
import 'package:rick_morty_app/models/api_response.model.dart';
import 'package:rick_morty_app/models/character_detail.model.dart';

class ApiService {
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://rickandmortyapi.com/api",
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );

  Future<ApiResponse> getListCharacters({required int page}) async {
    final response = await dio.get('/character/?page=$page');

    if (response.statusCode != 200) {
      throw Exception("Erro ao buscar os dados");
    }

    return ApiResponse.fromMap(response.data);
  }

  Future<CharacterDetail> getListCharacterDetail({
    required int characterId,
  }) async {
    final response = await dio.get('/character/$characterId');

    if (response.statusCode != 200) {
      throw Exception('Erro ao buscar os dados');
    }

    return CharacterDetail.fromMap(response.data);
  }
}
