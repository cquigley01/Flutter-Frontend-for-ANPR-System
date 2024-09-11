import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/utils/util.dart';

class ParkingsessionsRecord extends FirestoreRecord {
  ParkingsessionsRecord._(
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

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _sessionID = snapshotData['sessionID'] as String?;
    _userID = snapshotData['userID'] as String?;
    _regPlate = snapshotData['reg_plate'] as String?;
    _entryTime = snapshotData['entryTime'] as DateTime?;
    _exitTime = snapshotData['exitTime'] as DateTime?;
    _cost = castToType<double>(snapshotData['cost']);
    _paid = snapshotData['paid'] as bool?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('parkingsessions');

  static Stream<ParkingsessionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParkingsessionsRecord.fromSnapshot(s));

  static Future<ParkingsessionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ParkingsessionsRecord.fromSnapshot(s));

  static ParkingsessionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ParkingsessionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParkingsessionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParkingsessionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ParkingsessionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ParkingsessionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createParkingsessionsRecordData({
  String? sessionID,
  String? userID,
  String? regPlate,
  DateTime? entryTime,
  DateTime? exitTime,
  double? cost,
  bool? paid,
  String? image,
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
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class ParkingsessionsRecordDocumentEquality
    implements Equality<ParkingsessionsRecord> {
  const ParkingsessionsRecordDocumentEquality();

  @override
  bool equals(ParkingsessionsRecord? e1, ParkingsessionsRecord? e2) {
    return e1?.sessionID == e2?.sessionID &&
        e1?.userID == e2?.userID &&
        e1?.regPlate == e2?.regPlate &&
        e1?.entryTime == e2?.entryTime &&
        e1?.exitTime == e2?.exitTime &&
        e1?.cost == e2?.cost &&
        e1?.paid == e2?.paid &&
        e1?.image == e2?.image;
  }

  @override
  int hash(ParkingsessionsRecord? e) => const ListEquality().hash([
        e?.sessionID,
        e?.userID,
        e?.regPlate,
        e?.entryTime,
        e?.exitTime,
        e?.cost,
        e?.paid,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is ParkingsessionsRecord;
}
