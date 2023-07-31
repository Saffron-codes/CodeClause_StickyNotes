import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_notes/models/note.dart';
import 'package:sticky_notes/view/widgets/note_card.dart';
import 'package:sticky_notes/viewmodel/note_viewmodel.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Note>>(
      stream: Provider.of<NoteViewModel>(context).noteStream,
      builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Show a loading indicator while waiting for data
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.data!.isNotEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (context, index) => NoteCard(
                note: snapshot.data![index],
              ),
              itemCount: snapshot.data!.length,
            );
          } else {
            return const Center(
              child: Text("No Notes"),
            );
          }
        }
      },
    );
  }
}
