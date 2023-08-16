// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kanji_hint.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetKanjiHintCollection on Isar {
  IsarCollection<KanjiHint> get kanjiHints => this.collection();
}

const KanjiHintSchema = CollectionSchema(
  name: r'KanjiHint',
  id: 6794376897294403003,
  properties: {
    r'characterId': PropertySchema(
      id: 0,
      name: r'characterId',
      type: IsarType.long,
    ),
    r'hint': PropertySchema(
      id: 1,
      name: r'hint',
      type: IsarType.string,
    ),
    r'writingSystem': PropertySchema(
      id: 2,
      name: r'writingSystem',
      type: IsarType.string,
    )
  },
  estimateSize: _kanjiHintEstimateSize,
  serialize: _kanjiHintSerialize,
  deserialize: _kanjiHintDeserialize,
  deserializeProp: _kanjiHintDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _kanjiHintGetId,
  getLinks: _kanjiHintGetLinks,
  attach: _kanjiHintAttach,
  version: '3.1.0+1',
);

int _kanjiHintEstimateSize(
  KanjiHint object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.hint.length * 3;
  bytesCount += 3 + object.writingSystem.length * 3;
  return bytesCount;
}

void _kanjiHintSerialize(
  KanjiHint object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.characterId);
  writer.writeString(offsets[1], object.hint);
  writer.writeString(offsets[2], object.writingSystem);
}

KanjiHint _kanjiHintDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = KanjiHint();
  object.characterId = reader.readLong(offsets[0]);
  object.hint = reader.readString(offsets[1]);
  object.id = id;
  object.writingSystem = reader.readString(offsets[2]);
  return object;
}

P _kanjiHintDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _kanjiHintGetId(KanjiHint object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _kanjiHintGetLinks(KanjiHint object) {
  return [];
}

void _kanjiHintAttach(IsarCollection<dynamic> col, Id id, KanjiHint object) {
  object.id = id;
}

extension KanjiHintQueryWhereSort
    on QueryBuilder<KanjiHint, KanjiHint, QWhere> {
  QueryBuilder<KanjiHint, KanjiHint, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension KanjiHintQueryWhere
    on QueryBuilder<KanjiHint, KanjiHint, QWhereClause> {
  QueryBuilder<KanjiHint, KanjiHint, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension KanjiHintQueryFilter
    on QueryBuilder<KanjiHint, KanjiHint, QFilterCondition> {
  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> characterIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'characterId',
        value: value,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition>
      characterIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'characterId',
        value: value,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> characterIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'characterId',
        value: value,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> characterIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'characterId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> hintEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> hintGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> hintLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> hintBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> hintStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> hintEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> hintContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> hintMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hint',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> hintIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hint',
        value: '',
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> hintIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hint',
        value: '',
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition>
      writingSystemEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'writingSystem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition>
      writingSystemGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'writingSystem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition>
      writingSystemLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'writingSystem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition>
      writingSystemBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'writingSystem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition>
      writingSystemStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'writingSystem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition>
      writingSystemEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'writingSystem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition>
      writingSystemContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'writingSystem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition>
      writingSystemMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'writingSystem',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition>
      writingSystemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'writingSystem',
        value: '',
      ));
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterFilterCondition>
      writingSystemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'writingSystem',
        value: '',
      ));
    });
  }
}

extension KanjiHintQueryObject
    on QueryBuilder<KanjiHint, KanjiHint, QFilterCondition> {}

extension KanjiHintQueryLinks
    on QueryBuilder<KanjiHint, KanjiHint, QFilterCondition> {}

extension KanjiHintQuerySortBy on QueryBuilder<KanjiHint, KanjiHint, QSortBy> {
  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> sortByCharacterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterId', Sort.asc);
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> sortByCharacterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterId', Sort.desc);
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> sortByHint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hint', Sort.asc);
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> sortByHintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hint', Sort.desc);
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> sortByWritingSystem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'writingSystem', Sort.asc);
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> sortByWritingSystemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'writingSystem', Sort.desc);
    });
  }
}

extension KanjiHintQuerySortThenBy
    on QueryBuilder<KanjiHint, KanjiHint, QSortThenBy> {
  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> thenByCharacterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterId', Sort.asc);
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> thenByCharacterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterId', Sort.desc);
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> thenByHint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hint', Sort.asc);
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> thenByHintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hint', Sort.desc);
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> thenByWritingSystem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'writingSystem', Sort.asc);
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QAfterSortBy> thenByWritingSystemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'writingSystem', Sort.desc);
    });
  }
}

extension KanjiHintQueryWhereDistinct
    on QueryBuilder<KanjiHint, KanjiHint, QDistinct> {
  QueryBuilder<KanjiHint, KanjiHint, QDistinct> distinctByCharacterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'characterId');
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QDistinct> distinctByHint(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hint', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KanjiHint, KanjiHint, QDistinct> distinctByWritingSystem(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'writingSystem',
          caseSensitive: caseSensitive);
    });
  }
}

extension KanjiHintQueryProperty
    on QueryBuilder<KanjiHint, KanjiHint, QQueryProperty> {
  QueryBuilder<KanjiHint, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<KanjiHint, int, QQueryOperations> characterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'characterId');
    });
  }

  QueryBuilder<KanjiHint, String, QQueryOperations> hintProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hint');
    });
  }

  QueryBuilder<KanjiHint, String, QQueryOperations> writingSystemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'writingSystem');
    });
  }
}
