import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTasks extends StatefulWidget {
  const MyTasks({Key key}) : super(key: key);

  @override
  _MyTasksState createState() => _MyTasksState();
}

class _MyTasksState extends State<MyTasks> {
  final tasksTODOCollections =
      FirebaseFirestore.instance.collection('TasksTODO');
  final tasksCompleteCollections = FirebaseFirestore.instance.collection('CompletedTasks');
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
            stream: tasksTODOCollections.orderBy('Title').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if(!snapshot.hasData){
                return Center(
                  child: Text('No Tasks for you to complete!'),
                );
              }
              return ListView(
                children: snapshot.data?.docs?.map(
                      (task) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          margin: EdgeInsets.all(10.0),
                          color: Colors.grey.shade700,
                          shadowColor: Colors.red.shade600,
                          elevation: 4.0,
                          child: ListTile(
                            leading: Checkbox(
                              checkColor: Colors.teal.shade700,
                              focusColor: Colors.teal.shade700,
                              activeColor: Colors.teal.shade700,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              value: isDone,
                              onChanged: (value) {
                                setState(() {
                                  isDone = !isDone;
                                });
                                print(isDone);
                              },
                            ),
                            onTap: () async {
                              setState(() {
                                isDone=!isDone;
                              });
                              if(isDone==true){
                                await tasksCompleteCollections.add({
                                  'Title': task['Title'],
                                  'Description':task['Description'],
                                  'Date': task['Date'],
                                  'Time': task['Time'],
                                });
                                task.reference.delete();
                                setState(() {
                                  isDone=false;
                                });
                              }
                            },
                            onLongPress: () {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                        backgroundColor: Colors.teal.shade700,
                                        title: Text(
                                          'Delete this task?',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                task.reference.delete();
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                'Delete',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                        ]);
                                  });
                            },
                            tileColor: Colors.grey.shade700,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            minVerticalPadding: 10.0,
                            title: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      task['Title'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      task['Description'],
                                      style: TextStyle(color: Colors.white,fontSize: 12,),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Date:',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          task['Date'],
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50.0,
                                        ),
                                        Text('Time:',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          task['Time'],
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )?.toList() ??
                    [],
              );
            }),
      ),
    );
  }
}
