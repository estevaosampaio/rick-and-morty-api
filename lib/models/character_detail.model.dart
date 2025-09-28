import 'package:rick_morty_app/models/location.model.dart';

class CharacterDetail {
  final int id;
  final Location origin;
  final Location location;
  final List<String> episode;

  CharacterDetail({
    required this.id,
    required this.origin,
    required this.location,
    required this.episode,
  });

  factory CharacterDetail.fromMap(Map<String, dynamic> map) {
    return CharacterDetail(
      id: map['id'] as int,
      origin: Location.fromMap(map['origin'] as Map<String, dynamic>),
      location: Location.fromMap(map['location'] as Map<String, dynamic>),
      episode: List<String>.from(map['episode'] as List<dynamic>),
    );
  }
}
