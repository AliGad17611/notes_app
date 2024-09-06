import 'package:flutter/material.dart';
import 'package:note_app/views/search_view.dart';
import 'package:note_app/views/widgets/custom_app_bar.dart';
import 'package:note_app/views/widgets/custom_floating_action_button.dart';
import 'package:note_app/views/widgets/notes_listview.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: const CustomFloatingActionButton(),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomAppBar(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SearchView();
                  }));
                },
                title: 'Notes',
                icon: Icons.search,
              ),
              const NotesListView(),
            ],
          ),
        ));
  }
}
