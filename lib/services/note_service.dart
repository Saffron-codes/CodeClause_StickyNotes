import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sticky_notes/models/note.dart';
import 'package:sticky_notes/utils.dart';

class NoteService {
  final FirebaseFirestore firestore;
  NoteService(this.firestore);

  Stream<List<Note>> getAllNotes() {
    return firestore.collection("notes").orderBy("createdAt",descending: true).snapshots().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => Note.fromJson(doc.data()))
          .toList();
    });
  }

  void createNote(String title, String description) async {
    final noteColor = generateRandomColor();
    final note = Note(null, title, description,noteColor, Timestamp.now());
    try {
    await firestore.runTransaction((transaction) async {
      final docRef = firestore.collection('notes').doc();
       transaction.set(docRef, note.toJson());
      transaction.update(docRef, {'id': docRef.id});
    });
    } catch (e) {
      throw Exception("Error creating Note");
    }
  }

  Future<void> updateNote(Note note) async {
    try {
      await firestore.collection("notes").doc(note.id).update(note.toJson());
      return;
    } catch (e) {
      throw Exception("Updation error");
    }
  }

  Future<void> deleteNote(String id) async {
    try {
      await firestore.collection('notes').doc(id).delete();
    } catch (e) {
      throw Exception("Error deleting Note");
    }
  }
}
