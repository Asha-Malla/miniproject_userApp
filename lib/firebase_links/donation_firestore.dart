/*import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hospital_management/firebase_links/cru_donor_class.dart';

final CollectionReference myCollection =
    FirebaseFirestore.instance.collection('todolist');

class FirestoreService {
  Future<CrUdonor> createTODOTask(
      String name,
      String phone,
      String date,
      // ignore: non_constant_identifier_names
      String bloodtype,
      String address,
      String email_id) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(myCollection.doc());

      final CrUdonor task =
          new CrUdonor(name, phone, date, bloodtype, address, email_id);
      final Map<String, dynamic> data = task.toMap();
      await tx.set(ds.reference, data);
      return data;
    };

    return FirebaseFirestore.instance
        .runTransaction(createTransaction)
        .then((mapData) {
      return CrUdonor.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Stream<QuerySnapshot> getTaskList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = myCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }
    if (limit != null) {
      snapshots = snapshots.take(limit);
    }
    return snapshots;
  }
}
*/
