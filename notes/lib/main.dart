import 'package:flutter/material.dart';
import 'package:notes/notes_list_screen.dart'; // Adjust import path if needed

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Notes App',
      home: NotesListScreen(),
    );
  }
}
