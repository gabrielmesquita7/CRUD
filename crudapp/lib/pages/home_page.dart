import 'package:crudapp/services/firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FiretostoreService firestoreService = FiretostoreService();

  final TextEditingController noteController = TextEditingController();

  void openNoteBox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: noteController,
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                firestoreService.addNote(noteController.text);
                noteController.clear();
                Navigator.pop(context);
              },
              child: Text("Salvar")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notas"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
      ),
    );
  }
}
