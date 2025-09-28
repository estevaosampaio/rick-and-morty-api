import 'package:flutter/material.dart';
import 'package:rick_morty_app/models/character.model.dart';
import 'package:rick_morty_app/pages/home/mixins/load_color.mixin.dart';
import 'package:rick_morty_app/pages/home/stores/home.store.dart';

class CharacterCardGridView extends StatelessWidget with LoadColor {
  late final Character _character;

  CharacterCardGridView({
    super.key,
    required Character character,
    required HomeStore homeStore,
  }) {
    _character = character;

    getPaletteColor(store: homeStore, character: character);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _character.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _character.id.toString(),
            style: TextStyle(
              color: _character.textColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: Image.network(
              key: Key("imageGridCard"),
              _character.image,
              height: 130,
            ),
          ),
          SizedBox(height: 15),
          Text(
            _character.name,
            style: TextStyle(
              color: _character.textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
