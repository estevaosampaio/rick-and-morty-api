import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick_morty_app/pages/detail/detail.page.dart';
import 'package:rick_morty_app/pages/home/stores/home.store.dart';
import 'package:rick_morty_app/pages/home/widgets/character_card_list_view.widget.dart';

class CharactersListView extends StatelessWidget {
  final HomeStore _homeStore;
  final ScrollController _scrollController;

  const CharactersListView({
    super.key,
    required HomeStore homeStore,
    required ScrollController scrollController,
  }) : _homeStore = homeStore,
       _scrollController = scrollController;
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListView.builder(
          key: Key("listView"),
          controller: _scrollController,
          itemCount: _homeStore.filteredCharacters.length + 1,
          itemBuilder: (_, index) {
            if (index < _homeStore.filteredCharacters.length) {
              final character = _homeStore.filteredCharacters[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => DetailPage(
                        character: character,
                      ),
                    ),
                  );
                },
                child: CharacterCardListView(
                  key: Key("listCard"),
                  character: character,
                  homeStore: _homeStore,
                ),
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
