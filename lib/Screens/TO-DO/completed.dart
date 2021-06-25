import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Completed extends StatefulWidget {
  const Completed({Key key}) : super(key: key);

  @override
  _CompletedState createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  final tasksCompleteCollections = FirebaseFirestore.instance.collection('CompletedTasks');
  bool isDone=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
            stream: tasksCompleteCollections.orderBy('Title').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if(!snapshot.hasData){
                return Center(
                  child: Text('No Tasks for you to complete!'),
                );
              }
              return ListView(
                children: snapshot.data?.docs?.map(
                      (complete) {
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
                          checkColor: Colors.amber.shade700,
                          focusColor: Colors.teal.shade700,
                          activeColor: Colors.amber.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          value: isDone,
                          onChanged: (value) {
                            setState(() {
                              isDone=isDone;
                            });
                            print(isDone);
                          },
                        ),
                        onTap: () async {
                          if(isDone==true){
                            Timer(Duration(seconds: 5), () {
                              complete.reference.delete();
                            });

                          }
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
                                  complete['Title'],
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  complete['Description'],
                                  style: TextStyle(color: Colors.white),
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
                                      complete['Date'],
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
                                      complete['Time'],
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
