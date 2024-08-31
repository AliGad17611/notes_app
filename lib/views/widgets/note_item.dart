import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const EditNoteView();
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xffFFCD7A),
        ),
        margin: const EdgeInsets.only(
          top: 8,
        ),
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 16,
          left: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: const Text("Note title",
                  style: TextStyle(fontSize: 30, color: Colors.black)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text("Note content",
                    style: TextStyle(
                        fontSize: 20, color: Colors.black.withOpacity(0.6))),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.trash,
                      size: 24, color: Colors.black)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 32, top: 16),
              child: Text(
                "Note created on ",
                style: TextStyle(
                    fontSize: 16, color: Colors.black.withOpacity(0.6)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
