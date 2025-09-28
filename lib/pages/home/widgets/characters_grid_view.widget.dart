import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick_morty_app/pages/detail/detail.page.dart';
import 'package:rick_morty_app/pages/home/stores/home.store.dart';
import 'package:rick_morty_app/pages/home/widgets/character_card_grid_view.widget.dart';

class CharactersGridView extends StatelessWidget {
  final HomeStore _homeStore;
  final ScrollController _scrollController;

  const CharactersGridView({
    super.key,
    required HomeStore homeStore,
    required ScrollController scrollController,
  }) : _homeStore = homeStore,
       _scrollController = scrollController;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return GridView.builder(
          key: Key("gridView"),
          controller: _scrollController,
          itemCount: _homeStore.filteredCharacters.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
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
                child: CharacterCardGridView(
                  key: Key("gridCard"),
                  character: character,
                  homeStore: _homeStore,
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
