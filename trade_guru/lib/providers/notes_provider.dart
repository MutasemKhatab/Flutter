import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade_guru/models/note.dart';

class NotesProviderNotifier extends StateNotifier<List<Note>> {
  NotesProviderNotifier() : super([]);

  final fs = FirebaseFirestore.instance;

  Future<void> addNote(Note note) async {
    final doc = await fs.collection('notes').add({});
    note.id = doc.id;
    await doc.set(note.toJson());
    state = [note, ...state];
  }

  Future<void> delete(Note note) async {
    await fs.collection('notes').doc(note.id).delete();
    state = state.where((element) => element != note).toList();
  }

  Future<List<Note>> getNotes({bool forceFetch = false}) async {
    if (state.isNotEmpty && !forceFetch) {
      return state;
    }
    await fetchNotes();
    return state;
  }

  Future<void> fetchNotes() async {
    final snapshot = await fs.collection('notes').get();
    final notes = snapshot.docs.map((e) => Note.fromJson(e.data())).toList();
    state = notes;
  }
}

final notesProvider = StateNotifierProvider<NotesProviderNotifier, List<Note>>(
  (ref) => NotesProviderNotifier(),
);
