import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/add_note_colors_listview.dart';
import 'package:note_app/views/widgets/custom_button.dart';
import 'package:note_app/views/widgets/custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String title = "";
  String content = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: "Enter Note Title",
            onSaved: (value) {
              title = value ?? "";
            },
          ),
          const Spacer(
            flex: 2,
          ),
          CustomTextFormField(
            hintText: "Enter Note Content",
            onSaved: (value) {
              content = value ?? "";
            },
            maxlines: 6,
          ),
          const Spacer(
            flex: 2,
          ),
          const ColorsListView(),
          const Spacer(
            flex: 3,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                onPressed: () {
                  onPressed();
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void onPressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      NoteModel note = NoteModel(
        title: title,
        content: content,
        date: DateFormat('MMM d, yyyy').format(DateTime.now()),
        color: const Color(0xffFFCC80).value,
      );
      BlocProvider.of<AddNoteCubit>(context).addNote(note);
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }
}
