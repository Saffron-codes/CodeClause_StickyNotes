import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/note_viewmodel.dart';

class AddNoteView extends StatelessWidget {
  AddNoteView({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<void> addNote(BuildContext context) async {
    final noteViewModel = context.read<NoteViewModel>();
    noteViewModel.addNote(titleController.text, descriptionController.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNote(context),
        child: const Icon(Icons.done),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 30)),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                hintText: "Type something...",
                border: InputBorder.none,
                hintStyle: TextStyle(
                  // fontSize: 10
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
