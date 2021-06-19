import 'package:flutter/material.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({Key key}) : super(key: key);

  @override
  _AddNotesState createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  String notes = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
                              validator: (val) =>
                                  val.isEmpty ? 'Enter an Note' : null,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade900,
                                focusColor: Colors.teal.shade600,
                                hoverColor: Colors.grey.shade600,
                              ),
                              onChanged: (value) {
                                notes = value;
                                print(notes);
                              }),
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
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              Navigator.of(context).pop();
                            });
                          }
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
        });
    ;
  }
}
