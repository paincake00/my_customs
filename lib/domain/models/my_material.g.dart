// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_material.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMyMaterialCollection on Isar {
  IsarCollection<MyMaterial> get myMaterials => this.collection();
}

const MyMaterialSchema = CollectionSchema(
  name: r'MyMaterial',
  id: 1058652501667922261,
  properties: {
    r'cost': PropertySchema(
      id: 0,
      name: r'cost',
      type: IsarType.double,
    ),
    r'count': PropertySchema(
      id: 1,
      name: r'count',
      type: IsarType.double,
    ),
    r'customId': PropertySchema(
      id: 2,
      name: r'customId',
      type: IsarType.long,
    ),
    r'measure': PropertySchema(
      id: 3,
      name: r'measure',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'purchaseId': PropertySchema(
      id: 5,
      name: r'purchaseId',
      type: IsarType.long,
    )
  },
  estimateSize: _myMaterialEstimateSize,
  serialize: _myMaterialSerialize,
  deserialize: _myMaterialDeserialize,
  deserializeProp: _myMaterialDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _myMaterialGetId,
  getLinks: _myMaterialGetLinks,
  attach: _myMaterialAttach,
  version: '3.1.0+1',
);

int _myMaterialEstimateSize(
  MyMaterial object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.measure.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _myMaterialSerialize(
  MyMaterial object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.cost);
  writer.writeDouble(offsets[1], object.count);
  writer.writeLong(offsets[2], object.customId);
  writer.writeString(offsets[3], object.measure);
  writer.writeString(offsets[4], object.name);
  writer.writeLong(offsets[5], object.purchaseId);
}

MyMaterial _myMaterialDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MyMaterial();
  object.cost = reader.readDouble(offsets[0]);
  object.count = reader.readDouble(offsets[1]);
  object.customId = reader.readLong(offsets[2]);
  object.id = id;
  object.measure = reader.readString(offsets[3]);
  object.name = reader.readString(offsets[4]);
  object.purchaseId = reader.readLong(offsets[5]);
  return object;
}

P _myMaterialDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _myMaterialGetId(MyMaterial object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _myMaterialGetLinks(MyMaterial object) {
  return [];
}

void _myMaterialAttach(IsarCollection<dynamic> col, Id id, MyMaterial object) {
  object.id = id;
}

extension MyMaterialQueryWhereSort
    on QueryBuilder<MyMaterial, MyMaterial, QWhere> {
  QueryBuilder<MyMaterial, MyMaterial, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MyMaterialQueryWhere
    on QueryBuilder<MyMaterial, MyMaterial, QWhereClause> {
  QueryBuilder<MyMaterial, MyMaterial, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<MyMaterial, MyMaterial, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterWhereClause> idBetween(
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

extension MyMaterialQueryFilter
    on QueryBuilder<MyMaterial, MyMaterial, QFilterCondition> {
  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> costEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> costGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> costLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> costBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> countEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'count',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> countGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'count',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> countLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'count',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> countBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'count',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> customIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customId',
        value: value,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition>
      customIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customId',
        value: value,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> customIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customId',
        value: value,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> customIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> measureEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'measure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition>
      measureGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'measure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> measureLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'measure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> measureBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'measure',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> measureStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'measure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> measureEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'measure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> measureContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'measure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> measureMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'measure',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> measureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'measure',
        value: '',
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition>
      measureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'measure',
        value: '',
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> purchaseIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchaseId',
        value: value,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition>
      purchaseIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'purchaseId',
        value: value,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition>
      purchaseIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'purchaseId',
        value: value,
      ));
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterFilterCondition> purchaseIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'purchaseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MyMaterialQueryObject
    on QueryBuilder<MyMaterial, MyMaterial, QFilterCondition> {}

extension MyMaterialQueryLinks
    on QueryBuilder<MyMaterial, MyMaterial, QFilterCondition> {}

extension MyMaterialQuerySortBy
    on QueryBuilder<MyMaterial, MyMaterial, QSortBy> {
  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> sortByCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.asc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> sortByCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.desc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> sortByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.asc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> sortByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.desc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> sortByCustomId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customId', Sort.asc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> sortByCustomIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customId', Sort.desc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> sortByMeasure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measure', Sort.asc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> sortByMeasureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measure', Sort.desc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> sortByPurchaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseId', Sort.asc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> sortByPurchaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseId', Sort.desc);
    });
  }
}

extension MyMaterialQuerySortThenBy
    on QueryBuilder<MyMaterial, MyMaterial, QSortThenBy> {
  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> thenByCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.asc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> thenByCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.desc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> thenByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.asc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> thenByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.desc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> thenByCustomId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customId', Sort.asc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> thenByCustomIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customId', Sort.desc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> thenByMeasure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measure', Sort.asc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> thenByMeasureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measure', Sort.desc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> thenByPurchaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseId', Sort.asc);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QAfterSortBy> thenByPurchaseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseId', Sort.desc);
    });
  }
}

extension MyMaterialQueryWhereDistinct
    on QueryBuilder<MyMaterial, MyMaterial, QDistinct> {
  QueryBuilder<MyMaterial, MyMaterial, QDistinct> distinctByCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cost');
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QDistinct> distinctByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'count');
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QDistinct> distinctByCustomId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customId');
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QDistinct> distinctByMeasure(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'measure', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MyMaterial, MyMaterial, QDistinct> distinctByPurchaseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchaseId');
    });
  }
}

extension MyMaterialQueryProperty
    on QueryBuilder<MyMaterial, MyMaterial, QQueryProperty> {
  QueryBuilder<MyMaterial, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MyMaterial, double, QQueryOperations> costProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cost');
    });
  }

  QueryBuilder<MyMaterial, double, QQueryOperations> countProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'count');
    });
  }

  QueryBuilder<MyMaterial, int, QQueryOperations> customIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customId');
    });
  }

  QueryBuilder<MyMaterial, String, QQueryOperations> measureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'measure');
    });
  }

  QueryBuilder<MyMaterial, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MyMaterial, int, QQueryOperations> purchaseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchaseId');
    });
  }
}
