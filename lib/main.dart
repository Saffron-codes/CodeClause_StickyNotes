import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sticky_notes/services/note_service.dart';
import 'package:sticky_notes/view/app.dart';
import 'package:sticky_notes/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final firestore = FirebaseFirestore.instance;
  final noteservice = NoteService(firestore);
  
  runApp(StickyNotes(noteservice));
}

