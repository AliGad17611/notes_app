import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:note_app/models/note_model.dart';

import '../../constants.dart';

class AddNoteCubit extends Cubit<AddNoteState> {

  AddNoteCubit() : super(AddNoteInitial());
  Color selectedColor = const Color(0xffFFCC80);
  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      note.color = selectedColor.value;
      Box<NoteModel> noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(errMessage: e.toString()));
    }
  }
}
