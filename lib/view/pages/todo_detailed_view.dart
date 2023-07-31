import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_notes/models/note.dart';
import 'package:sticky_notes/utils.dart';

import '../../viewmodel/note_viewmodel.dart';

class TodoDetailedView extends StatefulWidget {
  const TodoDetailedView({super.key});

  @override
  State<TodoDetailedView> createState() => _TodoDetailedViewState();
}

class _TodoDetailedViewState extends State<TodoDetailedView> {
  late Note note;
  bool _showText = false;
  bool showSaveIcon = false;
  final ScrollController _scrollController = ScrollController();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _showText = _scrollController.offset >= 18;
      });
    });
  }

  void updateNote() async {
    final Note updatedNote = Note(note.id, titleController.text,descriptionController.text, note.color, note.createdAt);
    final noteViewModel = context.read<NoteViewModel>();
    noteViewModel.updateNote(updatedNote);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final noteFromNav = ModalRoute.of(context)!.settings.arguments as Note;
    note = noteFromNav;
    descriptionController.text = note.description;
    titleController.text = note.title;
    // final noteViewModel = Provider.of<NoteViewModel>(context);

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),
            floating: true,
            // expandedHeight: 200,
            // flexibleSpace: Container(), // You can remove the FlexibleSpaceBar
            title: AnimatedOpacity(
              opacity: _showText ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Text(note.title),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  TextField(
                    controller: titleController,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    onEditingComplete: () {},
                    decoration: const InputDecoration(
                      hintText: "Description",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    formatTimestamp(note.createdAt),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  TextField(
                    controller: descriptionController,
                    maxLines: null,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      hintText: "Description",
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 30),
                    ),
                    onEditingComplete: () {
                      print("editing done for DES");
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>updateNote(),
        child: const Icon(Icons.done),
      ),
    );
  }
}
