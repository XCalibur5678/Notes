import 'package:flutter/material.dart';

// ... (Note class definition - see step 2)

void main() {
  runApp(MyApp());
}

class Note {
  String title;
  String content;

  Note({required this.title, required this.content});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Notes',
      home: NoteListScreen(),
    );
  }
}

class NoteListScreen extends StatefulWidget {
  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  List<Note> notes = []; // Our in-memory note list

  // ... (Methods for adding, editing, deleting notes)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Notes')),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notes[index].title),
            subtitle: Text(notes[index].content),
            onTap: () {
              // ... (Navigate to note editing screen)
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ... (Navigate to note adding screen)
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class NoteEditScreen extends StatefulWidget {
  final Note note;

  NoteEditScreen({required this.note});

  @override
  _NoteEditScreenState createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.content);
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Note')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(hintText: 'Title'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: contentController,
              decoration: InputDecoration(hintText: 'Content'),
              maxLines: null,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // ... (Save note and navigate back)
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
