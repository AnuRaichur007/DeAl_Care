import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deal_care/Screens/TO-DO/Mytasks.dart';
import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();
  final CollectionReference tasksTODOCollections =
      FirebaseFirestore.instance.collection('TasksTODO');

  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  bool isDone;

  void clearText() {
    dateController.clear();
    timeController.clear();
    title.clear();
    description.clear();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();
    super.dispose();
  }

  final snackBar = SnackBar(
    content: Text(
      'Task Added Successfully!',
      style: TextStyle(
        color: Colors.white,
        fontSize: 15.0,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AlertDialog(
          backgroundColor: Colors.teal.shade600,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'Add Task',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          content: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Title',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextFormField(
                  controller: title,
                  validator: (val) => val.isEmpty ? 'Enter an Title' : null,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade800,
                    focusColor: Colors.teal.shade600,
                    hoverColor: Colors.grey.shade600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Description',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextFormField(
                  controller: description,
                  validator: (val) =>
                      val.isEmpty ? 'Enter atleast one word description' : null,
                  maxLines: 8,
                  minLines: 3,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade800,
                    focusColor: Colors.teal.shade600,
                    hoverColor: Colors.grey.shade600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Date',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Pick a date' : null,
                  readOnly: true,
                  controller: dateController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade800,
                    focusColor: Colors.teal.shade600,
                    hoverColor: Colors.grey.shade600,
                  ),
                  onTap: () async {
                    var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));
                    dateController.text = date.toString().substring(0, 10);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Time',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Pick a time' : null,
                  readOnly: true,
                  controller: timeController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade800,
                    focusColor: Colors.teal.shade600,
                    hoverColor: Colors.grey.shade600,
                  ),
                  onTap: () async {
                    var time = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );
                    timeController.text = time.format(context);
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  await tasksTODOCollections.add({
                    'Title': title.text,
                    'Description': description.text,
                    'Date': dateController.text,
                    'Time': timeController.text,
                  }).whenComplete(() {
                    MyTasks();
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    clearText();
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
      ),
    );
  }
}
