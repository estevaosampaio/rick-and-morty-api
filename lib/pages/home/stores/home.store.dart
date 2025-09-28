import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rick_morty_app/models/character.model.dart';
import 'package:rick_morty_app/services/api.service.dart';
part 'home.store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final _apiService = ApiService();

  int _page = 1;

  @observable
  ObservableList<Character> characters = <Character>[].asObservable();

  @observable
  bool isLoading = false;

  @observable
  bool showInList = true;

  @observable
  String search = '';

  @computed
  List<Character> get filteredCharacters {
    if (search.isEmpty) return characters.toList();

    return characters
        .where(
          (characters) =>
              characters.name.toLowerCase().contains(search.toLowerCase()) ||
              characters.id.toString() == search,
        )
        .toList();
  }

  @action
  void setSearch(String s) => search = s;

  @action
  void toggleShowInList() => showInList = !showInList;

  @action
  Future<void> loadData() async {
    isLoading = true;

    final result = await _apiService.getListCharacters(page: _page);

    characters.addAll(result.results);

    _page++;

    isLoading = false;
  }

  @action
  void updateCharacterColor({
    required int characterId,
    required Color backgroundColor,
    required Color textColor,
  }) {
    final index = characters.indexWhere(
      (character) => character.id == characterId,
    );
    characters[index] = characters[index].copyWith(
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }
}
