// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'app/data/models/incident_case.dart';
import 'app/data/models/non_governmental_organization.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 3541860583653262145),
      name: 'IncidentCase',
      lastPropertyId: const IdUid(6, 4174176320212213089),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8657518089658452557),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(3, 930836263734566126),
            name: 'caseName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 6981647595654974255),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8669257669440271945),
            name: 'valueCost',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 4174176320212213089),
            name: 'organizationId',
            type: 11,
            flags: 520,
            indexId: const IdUid(1, 5309573881119795786),
            relationTarget: 'NonGovernamentalOrganization')
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 7228886646688818442),
      name: 'NonGovernamentalOrganization',
      lastPropertyId: const IdUid(5, 3472203058708687167),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5543446367063064329),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 181722515775966408),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 3439369215004910234),
            name: 'loginCode',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 606953709044300118),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 3472203058708687167),
            name: 'phoneNumber',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(1, 4478626835104914355),
            name: 'incidents',
            targetId: const IdUid(1, 3541860583653262145))
      ],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(2, 7228886646688818442),
      lastIndexId: const IdUid(1, 5309573881119795786),
      lastRelationId: const IdUid(1, 4478626835104914355),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [7752429427564858712],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    IncidentCase: EntityDefinition<IncidentCase>(
        model: _entities[0],
        toOneRelations: (IncidentCase object) => [object.organization],
        toManyRelations: (IncidentCase object) => {},
        getId: (IncidentCase object) => object.id,
        setId: (IncidentCase object, int id) {
          object.id = id;
        },
        objectToFB: (IncidentCase object, fb.Builder fbb) {
          final caseNameOffset = fbb.writeString(object.caseName);
          final descriptionOffset = fbb.writeString(object.description);
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addOffset(2, caseNameOffset);
          fbb.addOffset(3, descriptionOffset);
          fbb.addFloat64(4, object.valueCost);
          fbb.addInt64(5, object.organization.targetId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = IncidentCase(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              caseName: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              description: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''),
              valueCost: const fb.Float64Reader()
                  .vTableGet(buffer, rootOffset, 12, 0));
          object.organization.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0);
          object.organization.attach(store);
          return object;
        }),
    NonGovernamentalOrganization:
        EntityDefinition<NonGovernamentalOrganization>(
            model: _entities[1],
            toOneRelations: (NonGovernamentalOrganization object) => [],
            toManyRelations: (NonGovernamentalOrganization object) => {
                  RelInfo<NonGovernamentalOrganization>.toMany(1, object.id):
                      object.incidents
                },
            getId: (NonGovernamentalOrganization object) => object.id,
            setId: (NonGovernamentalOrganization object, int id) {
              object.id = id;
            },
            objectToFB: (NonGovernamentalOrganization object, fb.Builder fbb) {
              final nameOffset = fbb.writeString(object.name);
              final loginCodeOffset = fbb.writeString(object.loginCode);
              final emailOffset = fbb.writeString(object.email);
              fbb.startTable(6);
              fbb.addInt64(0, object.id);
              fbb.addOffset(1, nameOffset);
              fbb.addOffset(2, loginCodeOffset);
              fbb.addOffset(3, emailOffset);
              fbb.addInt64(4, object.phoneNumber);
              fbb.finish(fbb.endTable());
              return object.id;
            },
            objectFromFB: (Store store, ByteData fbData) {
              final buffer = fb.BufferContext(fbData);
              final rootOffset = buffer.derefObject(0);

              final object = NonGovernamentalOrganization(
                  name: const fb.StringReader(asciiOptimization: true)
                      .vTableGet(buffer, rootOffset, 6, ''),
                  id: const fb.Int64Reader()
                      .vTableGet(buffer, rootOffset, 4, 0),
                  loginCode: const fb.StringReader(asciiOptimization: true)
                      .vTableGet(buffer, rootOffset, 8, ''),
                  email: const fb.StringReader(asciiOptimization: true)
                      .vTableGet(buffer, rootOffset, 10, ''),
                  phoneNumber: const fb.Int64Reader()
                      .vTableGetNullable(buffer, rootOffset, 12));
              InternalToManyAccess.setRelInfo(
                  object.incidents,
                  store,
                  RelInfo<NonGovernamentalOrganization>.toMany(1, object.id),
                  store.box<NonGovernamentalOrganization>());
              return object;
            })
  };

  return ModelDefinition(model, bindings);
}

/// [IncidentCase] entity fields to define ObjectBox queries.
class IncidentCase_ {
  /// see [IncidentCase.id]
  static final id =
      QueryIntegerProperty<IncidentCase>(_entities[0].properties[0]);

  /// see [IncidentCase.caseName]
  static final caseName =
      QueryStringProperty<IncidentCase>(_entities[0].properties[1]);

  /// see [IncidentCase.description]
  static final description =
      QueryStringProperty<IncidentCase>(_entities[0].properties[2]);

  /// see [IncidentCase.valueCost]
  static final valueCost =
      QueryDoubleProperty<IncidentCase>(_entities[0].properties[3]);

  /// see [IncidentCase.organization]
  static final organization =
      QueryRelationToOne<IncidentCase, NonGovernamentalOrganization>(
          _entities[0].properties[4]);
}

/// [NonGovernamentalOrganization] entity fields to define ObjectBox queries.
class NonGovernamentalOrganization_ {
  /// see [NonGovernamentalOrganization.id]
  static final id = QueryIntegerProperty<NonGovernamentalOrganization>(
      _entities[1].properties[0]);

  /// see [NonGovernamentalOrganization.name]
  static final name = QueryStringProperty<NonGovernamentalOrganization>(
      _entities[1].properties[1]);

  /// see [NonGovernamentalOrganization.loginCode]
  static final loginCode = QueryStringProperty<NonGovernamentalOrganization>(
      _entities[1].properties[2]);

  /// see [NonGovernamentalOrganization.email]
  static final email = QueryStringProperty<NonGovernamentalOrganization>(
      _entities[1].properties[3]);

  /// see [NonGovernamentalOrganization.phoneNumber]
  static final phoneNumber = QueryIntegerProperty<NonGovernamentalOrganization>(
      _entities[1].properties[4]);

  /// see [NonGovernamentalOrganization.incidents]
  static final incidents =
      QueryRelationToMany<NonGovernamentalOrganization, IncidentCase>(
          _entities[1].relations[0]);
}
