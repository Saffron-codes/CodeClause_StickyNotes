import 'package:flutter/material.dart';
import 'package:sticky_notes/view/widgets/notes_list.dart';

class AllNotesView extends StatelessWidget {
  const AllNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: NotesList(),
      floatingActionButton: FloatingActionButton(onPressed: ()=>Navigator.pushNamed(context, "/note/new"),child: const Icon(Icons.add),),
    );
  }
}
