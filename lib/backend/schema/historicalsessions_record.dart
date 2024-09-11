import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/utils/util.dart';

class HistoricalsessionsRecord extends FirestoreRecord {
  HistoricalsessionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "sessionID" field.
  String? _sessionID;
  String get sessionID => _sessionID ?? '';
  bool hasSessionID() => _sessionID != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "reg_plate" field.
  String? _regPlate;
  String get regPlate => _regPlate ?? '';
  bool hasRegPlate() => _regPlate != null;

  // "entryTime" field.
  DateTime? _entryTime;
  DateTime? get entryTime => _entryTime;
  bool hasEntryTime() => _entryTime != null;

  // "exitTime" field.
  DateTime? _exitTime;
  DateTime? get exitTime => _exitTime;
  bool hasExitTime() => _exitTime != null;

  // "cost" field.
  double? _cost;
  double get cost => _cost ?? 0.0;
  bool hasCost() => _cost != null;

  // "paid" field.
  bool? _paid;
  bool get paid => _paid ?? false;
  bool hasPaid() => _paid != null;

  // "regimage" field.
  String? _regimage;
  String get regimage => _regimage ?? '';
  bool hasRegimage() => _regimage != null;

  void _initializeFields() {
    _sessionID = snapshotData['sessionID'] as String?;
    _userID = snapshotData['userID'] as String?;
    _regPlate = snapshotData['reg_plate'] as String?;
    _entryTime = snapshotData['entryTime'] as DateTime?;
    _exitTime = snapshotData['exitTime'] as DateTime?;
    _cost = castToType<double>(snapshotData['cost']);
    _paid = snapshotData['paid'] as bool?;
    _regimage = snapshotData['regimage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('historicalsessions');

  static Stream<HistoricalsessionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HistoricalsessionsRecord.fromSnapshot(s));

  static Future<HistoricalsessionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => HistoricalsessionsRecord.fromSnapshot(s));

  static HistoricalsessionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HistoricalsessionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HistoricalsessionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HistoricalsessionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HistoricalsessionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HistoricalsessionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHistoricalsessionsRecordData({
  String? sessionID,
  String? userID,
  String? regPlate,
  DateTime? entryTime,
  DateTime? exitTime,
  double? cost,
  bool? paid,
  String? regimage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sessionID': sessionID,
      'userID': userID,
      'reg_plate': regPlate,
      'entryTime': entryTime,
      'exitTime': exitTime,
      'cost': cost,
      'paid': paid,
      'regimage': regimage,
    }.withoutNulls,
  );

  return firestoreData;
}

class HistoricalsessionsRecordDocumentEquality
    implements Equality<HistoricalsessionsRecord> {
  const HistoricalsessionsRecordDocumentEquality();

  @override
  bool equals(HistoricalsessionsRecord? e1, HistoricalsessionsRecord? e2) {
    return e1?.sessionID == e2?.sessionID &&
        e1?.userID == e2?.userID &&
        e1?.regPlate == e2?.regPlate &&
        e1?.entryTime == e2?.entryTime &&
        e1?.exitTime == e2?.exitTime &&
        e1?.cost == e2?.cost &&
        e1?.paid == e2?.paid &&
        e1?.regimage == e2?.regimage;
  }

  @override
  int hash(HistoricalsessionsRecord? e) => const ListEquality().hash([
        e?.sessionID,
        e?.userID,
        e?.regPlate,
        e?.entryTime,
        e?.exitTime,
        e?.cost,
        e?.paid,
        e?.regimage
      ]);

  @override
  bool isValidKey(Object? o) => o is HistoricalsessionsRecord;
}
