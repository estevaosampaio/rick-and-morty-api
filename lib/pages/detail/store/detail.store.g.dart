// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailStore on DetailStoreBase, Store {
  late final _$isLoadingAtom = Atom(
    name: 'DetailStoreBase.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$characterDetailAtom = Atom(
    name: 'DetailStoreBase.characterDetail',
    context: context,
  );

  @override
  CharacterDetail? get characterDetail {
    _$characterDetailAtom.reportRead();
    return super.characterDetail;
  }

  @override
  set characterDetail(CharacterDetail? value) {
    _$characterDetailAtom.reportWrite(value, super.characterDetail, () {
      super.characterDetail = value;
    });
  }

  late final _$loadDetailCharacterAsyncAction = AsyncAction(
    'DetailStoreBase.loadDetailCharacter',
    context: context,
  );

  @override
  Future<void> loadDetailCharacter(int characterId) {
    return _$loadDetailCharacterAsyncAction.run(
      () => super.loadDetailCharacter(characterId),
    );
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
characterDetail: ${characterDetail}
    ''';
  }
}
