import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rick_morty_app/models/character.model.dart';
import 'package:rick_morty_app/pages/detail/store/detail.store.dart';
import 'package:rick_morty_app/pages/detail/widgets/information.widget.dart';

class DetailPage extends StatelessWidget {
  late final Character _character;
  final detailStore = DetailStore();

  DetailPage({
    super.key,
    required Character character,
  }) {
    _character = character;
    detailStore.loadDetailCharacter(character.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: 60,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: Key(_character.id.toString()),
                child: CachedNetworkImage(
                  key: Key("imageDetails"),
                  imageUrl: _character.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Observer(
            builder: (context) {
              return detailStore.isLoading
                  ? SliverToBoxAdapter(
                      child: LinearProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : SliverPadding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 30,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Center(
                              child: Text(
                                "${_character.name.toUpperCase()} | #${_character.id}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 15,
                              children: [
                                Chip(
                                  backgroundColor: _character.backgroundColor,
                                  label: Text(
                                    _character.status,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: _character.textColor,
                                    ),
                                  ),
                                ),
                                Chip(
                                  backgroundColor: _character.backgroundColor,
                                  label: Text(
                                    _character.species,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: _character.textColor,
                                    ),
                                  ),
                                ),
                                Chip(
                                  backgroundColor: _character.backgroundColor,
                                  label: Text(
                                    _character.gender,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: _character.textColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Information(
                              label: 'Última localização conhecida: ',
                              content:
                                  detailStore.characterDetail!.location.name,
                            ),
                            SizedBox(height: 20),
                            Information(
                              label: 'Local de origem: ',
                              content: detailStore.characterDetail!.origin.name,
                            ),
                            SizedBox(height: 20),
                            Information(
                              label: 'Quantidade de vezes que apareceu: ',
                              content:
                                  '${detailStore.characterDetail!.episode.length} episódios',
                            ),
                          ],
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
