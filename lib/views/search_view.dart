import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/views/widgets/notes_listview.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String searchController = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchController = value;
                      });
                    },
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios,
                            color: kPrimaryColor),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.05),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide.none),
                      hintText: 'Search',
                    ),
                  ),
                ),
              ),
              NotesListView(
                searchController: searchController,
              ),
            ],
          )),
    );
  }
}
