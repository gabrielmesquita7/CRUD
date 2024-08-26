import 'package:cloud_firestore/cloud_firestore.dart';
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

  void openNoteBox({String? docID}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: noteController,
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                if (docID == null) {
                  firestoreService.addNote(noteController.text);
                } else {
                  firestoreService.updateNote(noteController.text, docID);
                }

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
      body: StreamBuilder<QuerySnapshot>(
          stream: firestoreService.getNotes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List noteslist = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: noteslist.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = noteslist[index];
                    String docID = document.id;
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    String noteText = data['note'];

                    return ListTile(
                        title: Text(noteText),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () => openNoteBox(docID: docID),
                                icon: const Icon(Icons.settings)),
                            IconButton(
                                onPressed: () =>
                                    firestoreService.deleteNote(docID),
                                icon: const Icon(Icons.delete)),
                          ],
                        ));
                  });
            } else {
              return const Text("Sem notas");
            }
          }),
    );
  }
}
