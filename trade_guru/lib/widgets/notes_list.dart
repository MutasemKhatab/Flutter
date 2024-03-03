import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade_guru/helpers/lang.dart';
import 'package:trade_guru/models/note.dart';
import 'package:trade_guru/providers/notes_provider.dart';

class NotesList extends ConsumerStatefulWidget {
  const NotesList({super.key});
  @override
  ConsumerState<NotesList> createState() => _NotesListState();
}

class _NotesListState extends ConsumerState<NotesList> {
  List<Note> notes = [];

  Future<void> deleteNote(int index) async {
    await ref.watch(notesProvider.notifier).delete(notes[index]);
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ref.watch(notesProvider.notifier).getNotes(forceFetch: true),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error', style: TextStyle(color: Colors.white)),
            );
          }
          notes = snapshot.data as List<Note>;
          if (notes.isEmpty) {
            return Center(
              child: Text(Lang.noNotesYet,
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
            );
          }
          return Container(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color(0xFF131723),
                  child: ListTile(
                    title: Text(notes[index].title,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white)),
                    subtitle: Text(notes[index].content,
                        style: TextStyle(color: Colors.white.withOpacity(0.5))),
                  ),
                );
              },
            ),
          );
        });
  }
}
