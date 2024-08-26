import 'package:cloud_firestore/cloud_firestore.dart';

class FiretostoreService {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');
  //CREATE
  Future<void> addNote(String note) {
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }

  //READ
  Stream<QuerySnapshot> getNotes() {
    final notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
  }

  //UPDATE
  Future<void> updateNote(String newnote, String docID) {
    return notes.doc(docID).update({
      'note': newnote,
      'timestamp': Timestamp.now(),
    });
  }

  //DELETE
  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}
