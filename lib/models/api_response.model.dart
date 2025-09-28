import 'package:rick_morty_app/models/api_info.model.dart';
import 'package:rick_morty_app/models/character.model.dart';

class ApiResponse {
  final ApiInfo info;
  final List<Character> results;

  ApiResponse({
    required this.info,
    required this.results,
  });

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse(
      info: ApiInfo.fromMap(map['info']),
      results: List<Character>.from(
        map['results']?.map((x) => Character.fromMap(x)),
      ),
    );
  }
}
