import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({Key key}) : super(key: key);

  @override
  _AddNotesState createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  void clearText() {
    notes.clear();
  }

  final CollectionReference notesCollections =
      FirebaseFirestore.instance.collection('Tasknotes');
  TextEditingController notes = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal.shade600,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: AlertDialog(
                      backgroundColor: Colors.teal.shade700,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      title: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Add Notes',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      content: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                'Notes',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            TextFormField(
                              controller: notes,
                              validator: (value) =>
                                  value.isEmpty ? 'Enter an Note' : null,
                              style: TextStyle(color: Colors.white),
                              maxLines: 5,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade900,
                                focusColor: Colors.teal.shade600,
                                hoverColor: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            await notesCollections.add({
                              'TasksNotes': notes.text,
                            }).whenComplete(() {
                              Navigator.of(context).pop();
                              clearText();
                            });
                          },
                          child: Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  );
                });
          }),
      body: Center(
        child: StreamBuilder(
            stream: notesCollections.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return ListView(
                children: snapshot.data?.docs?.map(
                  (note) {
                    return Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 80.0),
                      color: Colors.grey.shade700,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      shadowColor: Colors.red.shade700,
                      child: ListTile(
                        minVerticalPadding: 20.0,
                        title: Text(
                          note['TasksNotes'],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                )?.toList()?? [],
              );
            }),
      ),
    );
  }
}
