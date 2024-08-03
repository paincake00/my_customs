// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_custom.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMyCustomCollection on Isar {
  IsarCollection<MyCustom> get myCustoms => this.collection();
}

const MyCustomSchema = CollectionSchema(
  name: r'MyCustom',
  id: 6890816537719325659,
  properties: {
    r'cost': PropertySchema(
      id: 0,
      name: r'cost',
      type: IsarType.double,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.string,
    ),
    r'imageName': PropertySchema(
      id: 2,
      name: r'imageName',
      type: IsarType.string,
    ),
    r'isUsed': PropertySchema(
      id: 3,
      name: r'isUsed',
      type: IsarType.long,
    ),
    r'materialList': PropertySchema(
      id: 4,
      name: r'materialList',
      type: IsarType.object,
      target: r'MaterialList',
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'selfCost': PropertySchema(
      id: 6,
      name: r'selfCost',
      type: IsarType.double,
    )
  },
  estimateSize: _myCustomEstimateSize,
  serialize: _myCustomSerialize,
  deserialize: _myCustomDeserialize,
  deserializeProp: _myCustomDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'MaterialList': MaterialListSchema},
  getId: _myCustomGetId,
  getLinks: _myCustomGetLinks,
  attach: _myCustomAttach,
  version: '3.1.0+1',
);

int _myCustomEstimateSize(
  MyCustom object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.date.length * 3;
  {
    final value = object.imageName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 +
      MaterialListSchema.estimateSize(
          object.materialList, allOffsets[MaterialList]!, allOffsets);
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _myCustomSerialize(
  MyCustom object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.cost);
  writer.writeString(offsets[1], object.date);
  writer.writeString(offsets[2], object.imageName);
  writer.writeLong(offsets[3], object.isUsed);
  writer.writeObject<MaterialList>(
    offsets[4],
    allOffsets,
    MaterialListSchema.serialize,
    object.materialList,
  );
  writer.writeString(offsets[5], object.name);
  writer.writeDouble(offsets[6], object.selfCost);
}

MyCustom _myCustomDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MyCustom();
  object.cost = reader.readDouble(offsets[0]);
  object.date = reader.readString(offsets[1]);
  object.id = id;
  object.imageName = reader.readStringOrNull(offsets[2]);
  object.isUsed = reader.readLong(offsets[3]);
  object.materialList = reader.readObjectOrNull<MaterialList>(
        offsets[4],
        MaterialListSchema.deserialize,
        allOffsets,
      ) ??
      MaterialList();
  object.name = reader.readString(offsets[5]);
  object.selfCost = reader.readDouble(offsets[6]);
  return object;
}

P _myCustomDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readObjectOrNull<MaterialList>(
            offset,
            MaterialListSchema.deserialize,
            allOffsets,
          ) ??
          MaterialList()) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _myCustomGetId(MyCustom object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _myCustomGetLinks(MyCustom object) {
  return [];
}

void _myCustomAttach(IsarCollection<dynamic> col, Id id, MyCustom object) {
  object.id = id;
}

extension MyCustomQueryWhereSort on QueryBuilder<MyCustom, MyCustom, QWhere> {
  QueryBuilder<MyCustom, MyCustom, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MyCustomQueryWhere on QueryBuilder<MyCustom, MyCustom, QWhereClause> {
  QueryBuilder<MyCustom, MyCustom, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<MyCustom, MyCustom, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterWhereClause> idBetween(
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

extension MyCustomQueryFilter
    on QueryBuilder<MyCustom, MyCustom, QFilterCondition> {
  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> costEqualTo(
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

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> costGreaterThan(
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

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> costLessThan(
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

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> costBetween(
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

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> dateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> dateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> dateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> dateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> dateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> dateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date',
        value: '',
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> imageNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageName',
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> imageNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageName',
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> imageNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> imageNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> imageNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> imageNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> imageNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> imageNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> imageNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> imageNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> imageNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageName',
        value: '',
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition>
      imageNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageName',
        value: '',
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> isUsedEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> isUsedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> isUsedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> isUsedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isUsed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> nameContains(
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

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> selfCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'selfCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> selfCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'selfCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> selfCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'selfCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> selfCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'selfCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension MyCustomQueryObject
    on QueryBuilder<MyCustom, MyCustom, QFilterCondition> {
  QueryBuilder<MyCustom, MyCustom, QAfterFilterCondition> materialList(
      FilterQuery<MaterialList> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'materialList');
    });
  }
}

extension MyCustomQueryLinks
    on QueryBuilder<MyCustom, MyCustom, QFilterCondition> {}

extension MyCustomQuerySortBy on QueryBuilder<MyCustom, MyCustom, QSortBy> {
  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> sortByCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.asc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> sortByCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.desc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> sortByImageName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageName', Sort.asc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> sortByImageNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageName', Sort.desc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> sortByIsUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUsed', Sort.asc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> sortByIsUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUsed', Sort.desc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> sortBySelfCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selfCost', Sort.asc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> sortBySelfCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selfCost', Sort.desc);
    });
  }
}

extension MyCustomQuerySortThenBy
    on QueryBuilder<MyCustom, MyCustom, QSortThenBy> {
  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> thenByCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.asc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> thenByCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cost', Sort.desc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> thenByImageName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageName', Sort.asc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> thenByImageNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageName', Sort.desc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> thenByIsUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUsed', Sort.asc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> thenByIsUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUsed', Sort.desc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> thenBySelfCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selfCost', Sort.asc);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QAfterSortBy> thenBySelfCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'selfCost', Sort.desc);
    });
  }
}

extension MyCustomQueryWhereDistinct
    on QueryBuilder<MyCustom, MyCustom, QDistinct> {
  QueryBuilder<MyCustom, MyCustom, QDistinct> distinctByCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cost');
    });
  }

  QueryBuilder<MyCustom, MyCustom, QDistinct> distinctByDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QDistinct> distinctByImageName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QDistinct> distinctByIsUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isUsed');
    });
  }

  QueryBuilder<MyCustom, MyCustom, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MyCustom, MyCustom, QDistinct> distinctBySelfCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'selfCost');
    });
  }
}

extension MyCustomQueryProperty
    on QueryBuilder<MyCustom, MyCustom, QQueryProperty> {
  QueryBuilder<MyCustom, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MyCustom, double, QQueryOperations> costProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cost');
    });
  }

  QueryBuilder<MyCustom, String, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<MyCustom, String?, QQueryOperations> imageNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageName');
    });
  }

  QueryBuilder<MyCustom, int, QQueryOperations> isUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isUsed');
    });
  }

  QueryBuilder<MyCustom, MaterialList, QQueryOperations>
      materialListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'materialList');
    });
  }

  QueryBuilder<MyCustom, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MyCustom, double, QQueryOperations> selfCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'selfCost');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MaterialListSchema = Schema(
  name: r'MaterialList',
  id: -1874940743647656394,
  properties: {
    r'materials': PropertySchema(
      id: 0,
      name: r'materials',
      type: IsarType.longList,
    )
  },
  estimateSize: _materialListEstimateSize,
  serialize: _materialListSerialize,
  deserialize: _materialListDeserialize,
  deserializeProp: _materialListDeserializeProp,
);

int _materialListEstimateSize(
  MaterialList object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.materials.length * 8;
  return bytesCount;
}

void _materialListSerialize(
  MaterialList object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.materials);
}

MaterialList _materialListDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MaterialList();
  object.materials = reader.readLongList(offsets[0]) ?? [];
  return object;
}

P _materialListDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension MaterialListQueryFilter
    on QueryBuilder<MaterialList, MaterialList, QFilterCondition> {
  QueryBuilder<MaterialList, MaterialList, QAfterFilterCondition>
      materialsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'materials',
        value: value,
      ));
    });
  }

  QueryBuilder<MaterialList, MaterialList, QAfterFilterCondition>
      materialsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'materials',
        value: value,
      ));
    });
  }

  QueryBuilder<MaterialList, MaterialList, QAfterFilterCondition>
      materialsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'materials',
        value: value,
      ));
    });
  }

  QueryBuilder<MaterialList, MaterialList, QAfterFilterCondition>
      materialsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'materials',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MaterialList, MaterialList, QAfterFilterCondition>
      materialsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'materials',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MaterialList, MaterialList, QAfterFilterCondition>
      materialsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'materials',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MaterialList, MaterialList, QAfterFilterCondition>
      materialsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'materials',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MaterialList, MaterialList, QAfterFilterCondition>
      materialsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'materials',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MaterialList, MaterialList, QAfterFilterCondition>
      materialsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'materials',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MaterialList, MaterialList, QAfterFilterCondition>
      materialsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'materials',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension MaterialListQueryObject
    on QueryBuilder<MaterialList, MaterialList, QFilterCondition> {}
