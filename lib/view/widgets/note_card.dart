import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_notes/models/note.dart';
import 'package:sticky_notes/utils.dart';

import '../../viewmodel/note_viewmodel.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  const NoteCard({required this.note, super.key});

  Future<void> deleteNote(BuildContext context)async{
    final noteViewModel = context.read<NoteViewModel>();
    noteViewModel.deleteNote(note.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/note", arguments: note),
      child: Container(
        height: 100,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: hexToColor(note.color),
            borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  note.description,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 74, 74, 74),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      formatTimestamp(note.createdAt),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 74, 74, 74)),
                    ),
                  ],
                )
              ],
            ),
            Positioned(
              right: 0,
              child: GestureDetector(
                onTap: ()=>deleteNote(context),
                child: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
