// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_progress.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLearningProgressCollection on Isar {
  IsarCollection<LearningProgress> get learningProgress => this.collection();
}

const LearningProgressSchema = CollectionSchema(
  name: r'LearningProgress',
  id: -3307065871208801825,
  properties: {
    r'canLevelUp': PropertySchema(
      id: 0,
      name: r'canLevelUp',
      type: IsarType.bool,
    ),
    r'characterId': PropertySchema(
      id: 1,
      name: r'characterId',
      type: IsarType.long,
    ),
    r'lastCheckedAt': PropertySchema(
      id: 2,
      name: r'lastCheckedAt',
      type: IsarType.dateTime,
    ),
    r'stars': PropertySchema(
      id: 3,
      name: r'stars',
      type: IsarType.long,
    ),
    r'writingSystem': PropertySchema(
      id: 4,
      name: r'writingSystem',
      type: IsarType.string,
    )
  },
  estimateSize: _learningProgressEstimateSize,
  serialize: _learningProgressSerialize,
  deserialize: _learningProgressDeserialize,
  deserializeProp: _learningProgressDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _learningProgressGetId,
  getLinks: _learningProgressGetLinks,
  attach: _learningProgressAttach,
  version: '3.1.0+1',
);

int _learningProgressEstimateSize(
  LearningProgress object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.writingSystem.length * 3;
  return bytesCount;
}

void _learningProgressSerialize(
  LearningProgress object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.canLevelUp);
  writer.writeLong(offsets[1], object.characterId);
  writer.writeDateTime(offsets[2], object.lastCheckedAt);
  writer.writeLong(offsets[3], object.stars);
  writer.writeString(offsets[4], object.writingSystem);
}

LearningProgress _learningProgressDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LearningProgress();
  object.characterId = reader.readLong(offsets[1]);
  object.id = id;
  object.lastCheckedAt = reader.readDateTimeOrNull(offsets[2]);
  object.stars = reader.readLong(offsets[3]);
  object.writingSystem = reader.readString(offsets[4]);
  return object;
}

P _learningProgressDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _learningProgressGetId(LearningProgress object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _learningProgressGetLinks(LearningProgress object) {
  return [];
}

void _learningProgressAttach(
    IsarCollection<dynamic> col, Id id, LearningProgress object) {
  object.id = id;
}

extension LearningProgressQueryWhereSort
    on QueryBuilder<LearningProgress, LearningProgress, QWhere> {
  QueryBuilder<LearningProgress, LearningProgress, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LearningProgressQueryWhere
    on QueryBuilder<LearningProgress, LearningProgress, QWhereClause> {
  QueryBuilder<LearningProgress, LearningProgress, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterWhereClause> idBetween(
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

extension LearningProgressQueryFilter
    on QueryBuilder<LearningProgress, LearningProgress, QFilterCondition> {
  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      canLevelUpEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canLevelUp',
        value: value,
      ));
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      characterIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'characterId',
        value: value,
      ));
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      characterIdLessThan(
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      characterIdBetween(
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      lastCheckedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastCheckedAt',
      ));
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      lastCheckedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastCheckedAt',
      ));
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      lastCheckedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastCheckedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      lastCheckedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastCheckedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      lastCheckedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastCheckedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      lastCheckedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastCheckedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      starsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stars',
        value: value,
      ));
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      starsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stars',
        value: value,
      ));
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      starsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stars',
        value: value,
      ));
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      starsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stars',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
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

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      writingSystemContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'writingSystem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      writingSystemMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'writingSystem',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      writingSystemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'writingSystem',
        value: '',
      ));
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterFilterCondition>
      writingSystemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'writingSystem',
        value: '',
      ));
    });
  }
}

extension LearningProgressQueryObject
    on QueryBuilder<LearningProgress, LearningProgress, QFilterCondition> {}

extension LearningProgressQueryLinks
    on QueryBuilder<LearningProgress, LearningProgress, QFilterCondition> {}

extension LearningProgressQuerySortBy
    on QueryBuilder<LearningProgress, LearningProgress, QSortBy> {
  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      sortByCanLevelUp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canLevelUp', Sort.asc);
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      sortByCanLevelUpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canLevelUp', Sort.desc);
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      sortByCharacterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterId', Sort.asc);
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      sortByCharacterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterId', Sort.desc);
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      sortByLastCheckedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCheckedAt', Sort.asc);
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      sortByLastCheckedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCheckedAt', Sort.desc);
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy> sortByStars() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stars', Sort.asc);
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      sortByStarsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stars', Sort.desc);
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      sortByWritingSystem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'writingSystem', Sort.asc);
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      sortByWritingSystemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'writingSystem', Sort.desc);
    });
  }
}

extension LearningProgressQuerySortThenBy
    on QueryBuilder<LearningProgress, LearningProgress, QSortThenBy> {
  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      thenByCanLevelUp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canLevelUp', Sort.asc);
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      thenByCanLevelUpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canLevelUp', Sort.desc);
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      thenByCharacterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterId', Sort.asc);
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      thenByCharacterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterId', Sort.desc);
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      thenByLastCheckedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCheckedAt', Sort.asc);
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      thenByLastCheckedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCheckedAt', Sort.desc);
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy> thenByStars() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stars', Sort.asc);
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      thenByStarsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stars', Sort.desc);
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      thenByWritingSystem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'writingSystem', Sort.asc);
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QAfterSortBy>
      thenByWritingSystemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'writingSystem', Sort.desc);
    });
  }
}

extension LearningProgressQueryWhereDistinct
    on QueryBuilder<LearningProgress, LearningProgress, QDistinct> {
  QueryBuilder<LearningProgress, LearningProgress, QDistinct>
      distinctByCanLevelUp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canLevelUp');
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QDistinct>
      distinctByCharacterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'characterId');
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QDistinct>
      distinctByLastCheckedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastCheckedAt');
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QDistinct>
      distinctByStars() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stars');
    });
  }

  QueryBuilder<LearningProgress, LearningProgress, QDistinct>
      distinctByWritingSystem({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'writingSystem',
          caseSensitive: caseSensitive);
    });
  }
}

extension LearningProgressQueryProperty
    on QueryBuilder<LearningProgress, LearningProgress, QQueryProperty> {
  QueryBuilder<LearningProgress, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LearningProgress, bool, QQueryOperations> canLevelUpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canLevelUp');
    });
  }

  QueryBuilder<LearningProgress, int, QQueryOperations> characterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'characterId');
    });
  }

  QueryBuilder<LearningProgress, DateTime?, QQueryOperations>
      lastCheckedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastCheckedAt');
    });
  }

  QueryBuilder<LearningProgress, int, QQueryOperations> starsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stars');
    });
  }

  QueryBuilder<LearningProgress, String, QQueryOperations>
      writingSystemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'writingSystem');
    });
  }
}
