import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade_guru/helpers/lang.dart';
import 'package:trade_guru/main.dart';
import 'package:trade_guru/models/note.dart';
import 'package:trade_guru/providers/notes_provider.dart';

class Notes extends ConsumerStatefulWidget {
  const Notes({super.key});

  @override
  ConsumerState<Notes> createState() => _NotesState();
}

class _NotesState extends ConsumerState<Notes> {
  List<Note> notes = [];

  void addNote() {
    final titleController = TextEditingController();
    final contentController = TextEditingController();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  Lang.newNote,
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: Lang.title,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: contentController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.white,
                    filled: true,
                    hintText: Lang.content,
                  ),
                  maxLines: 5,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      final note = Note(
                        title: titleController.text,
                        content: contentController.text,
                      );
                      setState(() {
                        notes.add(note);
                      });
                      ref.watch(notesProvider.notifier).addNote(note);
                    },
                    child: Text(Lang.save),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<void> deleteNote(int index) async {
    await ref.watch(notesProvider.notifier).delete(notes[index]);
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Lang.notes),
        centerTitle: true,
        backgroundColor: const Color(0xFF131723),
        foregroundColor: Colors.white,
        actions: [
          if (isAdmin)
            IconButton(
              onPressed: addNote,
              icon: const Icon(Icons.add),
            ),
        ],
      ),
      backgroundColor: const Color(0xFF0A0A0A),
      body: FutureBuilder(
          future: ref.watch(notesProvider.notifier).getNotes(),
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
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
                        subtitle: Text(notes[index].content,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5))),
                        trailing: isAdmin
                            ? IconButton(
                                onPressed: () => deleteNote(index),
                                icon: const Icon(Icons.delete))
                            : null),
                  );
                },
              ),
            );
          }),
    );
  }
}
