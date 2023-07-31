import 'package:flutter/foundation.dart';
import 'package:sticky_notes/models/note.dart';
import 'package:sticky_notes/services/note_service.dart';

class NoteViewModel with ChangeNotifier {
  final NoteService noteService;

  bool updateNoteLoading = false;

  late Stream<List<Note>> _noteStream;

  NoteViewModel(this.noteService) {
    _noteStream = noteService.getAllNotes();
  }

  Stream<List<Note>> get noteStream => _noteStream;

  Future<void> updateNote(Note note) async {
    updateNoteLoading = true;
    notifyListeners();
    try {
      noteService.updateNote(note);
      updateNoteLoading = false;
      notifyListeners();
    } catch (e) {
      updateNoteLoading = true;
      notifyListeners();
    }
  }

  Future<void> deleteNote(String id) async {
    noteService.deleteNote(id);
  }

  Future<void> addNote(String title,String description) async {
    noteService.createNote(title, description);
  }
}
