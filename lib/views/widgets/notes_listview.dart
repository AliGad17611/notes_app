import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({
    super.key,
    this.searchController = '',
  });
  final String searchController;

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).getAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        List<NoteModel> filteredNotes = notes.where((note) {
          return note.title
              .toLowerCase()
              .contains(widget.searchController.toLowerCase());
        }).toList();
        return Expanded(
          child: ListView.builder(
              itemCount: filteredNotes.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return NoteItem(note: filteredNotes[index]);
              }),
        );
      },
    );
  }
}
