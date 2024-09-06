import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/custom_app_bar.dart';
import 'package:note_app/views/widgets/custom_text_form_field.dart';
import 'package:note_app/views/widgets/edit_view_colors_listview.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String title;
  late String content;
  late int colorIndex;

  @override
  void initState() {
    super.initState();
    title = widget.note.title;
    content = widget.note.content;
    colorIndex = widget.note.color;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomAppBar(
              onPressed: () {
                onPressed();
              },
              title: 'Edit Note',
              icon: Icons.check,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextFormField(
              initialValue: title,
              hintText: "Note Title",
              onSaved: (value) {
                title = value ?? "";
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              initialValue: content,
              hintText: "Note Content",
              onSaved: (value) {
                content = value ?? "";
              },
              maxlines: 6,
            ),
            const SizedBox(
              height: 20,
            ),
            EditViewColorsListView(
              note: widget.note,
            ),
          ],
        ),
      )),
    );
  }

  void onPressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      widget.note.title = title;
      widget.note.content = content;
      widget.note.save();
      BlocProvider.of<NotesCubit>(context).getAllNotes();
      Navigator.pop(context);
    }
  }
}
