import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty_app/models/character.model.dart';
import 'package:rick_morty_app/pages/home/mixins/load_color.mixin.dart';
import 'package:rick_morty_app/pages/home/stores/home.store.dart';

class CharacterCardListView extends StatelessWidget with LoadColor {
  late final Character _character;

  CharacterCardListView({
    super.key,
    required Character character,
    required HomeStore homeStore,
  }) {
    _character = character;

    getPaletteColor(store: homeStore, character: character);
  }

  MaterialColor get statusColor {
    final status = _character.status.toLowerCase();

    if (status == 'alive') {
      return Colors.green;
    } else if (status == 'dead') {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: _character.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 155,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: CachedNetworkImage(
                key: Key("imageListCard"),
                imageUrl: _character.image,
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    _character.name,
                    style: TextStyle(
                      color: _character.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: statusColor,
                      size: 16,
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        '${_character.status} - ${_character.species}',
                        style: TextStyle(
                          color: _character.textColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  _character.gender,
                  style: TextStyle(
                    color: _character.textColor,
                    fontSize: 14,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    _character.id.toString(),
                    style: TextStyle(
                      color: _character.textColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
