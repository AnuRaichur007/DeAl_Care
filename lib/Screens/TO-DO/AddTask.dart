import 'package:deal_care/Screens/TO-DO/Mytasks.dart';
import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();

  final dateController = TextEditingController();
  final timeController = TextEditingController();
  String input = '';
  String description = '';
  String date = '';
  String time = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        backgroundColor: Colors.teal.shade700,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Add Task',
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
                  'Title',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an Title' : null,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade900,
                    focusColor: Colors.teal.shade600,
                    hoverColor: Colors.grey.shade600,
                  ),
                  onChanged: (value) {
                    input = value;
                    print(input);
                  }),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Description',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextFormField(
                  validator: (val) => val.isEmpty
                      ? 'Enter atleast one word description'
                      : null,
                  maxLines: 8,
                  minLines: 3,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade900,
                    focusColor: Colors.teal.shade600,
                    hoverColor: Colors.grey.shade600,
                  ),
                  onChanged: (value) {
                    description = value;
                    print(description);
                  }),
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
                  fillColor: Colors.grey.shade900,
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
                onChanged: (value) {
                  date = value;
                  print(date);
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
                    fillColor: Colors.grey.shade900,
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
                  onChanged: (value) {
                    time = value;
                    print(timeController.text);
                  }),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {}
            },
            child: Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
    // return FloatingActionButton(
    //     backgroundColor: Colors.teal.shade600,
    //     child: Icon(
    //       Icons.add,
    //       color: Colors.white,
    //     ),
    //     onPressed: () {
    //       showDialog(
    //           barrierDismissible: false,
    //           context: context,
    //           builder: (BuildContext context) {
    //             return SingleChildScrollView(
    //               child: AlertDialog(
    //                 backgroundColor: Colors.teal.shade700,
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(15)),
    //                 title: Padding(
    //                   padding: const EdgeInsets.all(10.0),
    //                   child: Text(
    //                     'Add Task',
    //                     style: TextStyle(color: Colors.white),
    //                   ),
    //                 ),
    //                 content: Form(
    //                   key: _formKey,
    //                   child: Column(
    //                     children: [
    //                       Padding(
    //                         padding: const EdgeInsets.all(15.0),
    //                         child: Text(
    //                           'Title',
    //                           style: TextStyle(color: Colors.white),
    //                         ),
    //                       ),
    //                       TextFormField(
    //                           validator: (val) =>
    //                               val.isEmpty ? 'Enter an Title' : null,
    //                           style: TextStyle(color: Colors.white),
    //                           decoration: InputDecoration(
    //                             filled: true,
    //                             fillColor: Colors.grey.shade900,
    //                             focusColor: Colors.teal.shade600,
    //                             hoverColor: Colors.grey.shade600,
    //                           ),
    //                           onChanged: (value) {
    //                             input = value;
    //                             print(input);
    //                           }),
    //                       Padding(
    //                         padding: const EdgeInsets.all(15.0),
    //                         child: Text(
    //                           'Description',
    //                           style: TextStyle(color: Colors.white),
    //                         ),
    //                       ),
    //                       TextFormField(
    //                           validator: (val) => val.isEmpty
    //                               ? 'Enter atleast one word description'
    //                               : null,
    //                           maxLines: 8,
    //                           minLines: 3,
    //                           style: TextStyle(color: Colors.white),
    //                           decoration: InputDecoration(
    //                             filled: true,
    //                             fillColor: Colors.grey.shade900,
    //                             focusColor: Colors.teal.shade600,
    //                             hoverColor: Colors.grey.shade600,
    //                           ),
    //                           onChanged: (value) {
    //                             description = value;
    //                             print(description);
    //                           }),
    //                       Padding(
    //                         padding: const EdgeInsets.all(15.0),
    //                         child: Text(
    //                           'Date',
    //                           style: TextStyle(color: Colors.white),
    //                         ),
    //                       ),
    //                       TextFormField(
    //                         validator: (val) =>
    //                             val.isEmpty ? 'Pick a date' : null,
    //                         readOnly: true,
    //                         controller: dateController,
    //                         style: TextStyle(color: Colors.white),
    //                         decoration: InputDecoration(
    //                           filled: true,
    //                           fillColor: Colors.grey.shade900,
    //                           focusColor: Colors.teal.shade600,
    //                           hoverColor: Colors.grey.shade600,
    //                         ),
    //                         onTap: () async {
    //                           var date = await showDatePicker(
    //                               context: context,
    //                               initialDate: DateTime.now(),
    //                               firstDate: DateTime(1900),
    //                               lastDate: DateTime(2100));
    //                           dateController.text =
    //                               date.toString().substring(0, 10);
    //                         },
    //                         onChanged: (value) {
    //                           date = value;
    //                           print(date);
    //                         },
    //                       ),
    //                       Padding(
    //                         padding: const EdgeInsets.all(15.0),
    //                         child: Text(
    //                           'Time',
    //                           style: TextStyle(color: Colors.white),
    //                         ),
    //                       ),
    //                       TextFormField(
    //                           validator: (val) =>
    //                               val.isEmpty ? 'Pick a time' : null,
    //                           readOnly: true,
    //                           controller: timeController,
    //                           style: TextStyle(color: Colors.white),
    //                           decoration: InputDecoration(
    //                             filled: true,
    //                             fillColor: Colors.grey.shade900,
    //                             focusColor: Colors.teal.shade600,
    //                             hoverColor: Colors.grey.shade600,
    //                           ),
    //                           onTap: () async {
    //                             var time = await showTimePicker(
    //                               initialTime: TimeOfDay.now(),
    //                               context: context,
    //                             );
    //                             timeController.text = time.format(context);
    //                           },
    //                           onChanged: (value) {
    //                             time = value;
    //                             print(timeController.text);
    //                           }),
    //                     ],
    //                   ),
    //                 ),
    //                 actions: <Widget>[
    //                   TextButton(
    //                     onPressed: () {
    //                       Navigator.of(context).pop();
    //                     },
    //                     child: Text(
    //                       'Cancel',
    //                       style: TextStyle(color: Colors.white),
    //                     ),
    //                   ),
    //                   TextButton(
    //                     onPressed: () {
    //                       if (_formKey.currentState.validate()) {
    //                         setState(() {
    //                           Navigator.of(context).pop();
    //                         });
    //                       }
    //                     },
    //                     child: Text(
    //                       'Add',
    //                       style: TextStyle(color: Colors.white),
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             );
    //           });
    //     });
  }
}
