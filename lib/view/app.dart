import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sticky_notes/services/note_service.dart';
import 'package:sticky_notes/view/pages/add_note_view.dart';
import 'package:sticky_notes/view/pages/all_notes_view.dart';
import 'package:sticky_notes/view/pages/todo_detailed_view.dart';
import 'package:sticky_notes/viewmodel/note_viewmodel.dart';

class StickyNotes extends StatelessWidget {
  final NoteService noteService;
  const StickyNotes(this.noteService,{super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(context) => NoteViewModel(noteService),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(
          useMaterial3: true
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          //#3B3B3B
          brightness: Brightness.dark,
          // scaffoldBackgroundColor: Color(0xFF232323),
          // appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF232323)),
          // floatingActionButtonTheme: const FloatingActionButtonThemeData(
          //   foregroundColor: Colors.white
          // ),
          // colorScheme: ColorScheme.dark(
          //   primary: Color(0xFF232323),
          // )
        ),
        themeMode: ThemeMode.dark,
        // home: TodoDetailedView(),s
        initialRoute: "/home",
        routes: {
          "/home":(context) => const AllNotesView(),
          "/note":(context) => const TodoDetailedView(),
          "/note/new":(context) =>  AddNoteView()
        },
      ),
    );
  }
}