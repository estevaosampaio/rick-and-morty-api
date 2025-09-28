import 'package:mobx/mobx.dart';
import 'package:rick_morty_app/models/character_detail.model.dart';
import 'package:rick_morty_app/services/api.service.dart';

part 'detail.store.g.dart';

class DetailStore = DetailStoreBase with _$DetailStore;

abstract class DetailStoreBase with Store {
  final _apiService = ApiService();

  @observable
  bool isLoading = false;

  @observable
  CharacterDetail? characterDetail;

  @action
  Future<void> loadDetailCharacter(int characterId) async {
    isLoading = true;

    characterDetail = await _apiService.getListCharacterDetail(
      characterId: characterId,
    );

    isLoading = false;
  }
}
