import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class Album extends StatefulWidget {
  @override
  _AlbumState createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  Future<List<FirebaseFile>> futureFiles;

  @override
  void initState() {
    super.initState();
    futureFiles = FirebaseApi.listAll('files/');
  }

  File _imageFile;
  UploadTask task;
  final picker = ImagePicker();
  List listOfImages;
  Map data;
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile == null) return;
    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  Future uploadImage() async {
    if (_imageFile == null) return;
    listOfImages = [];
    listOfImages.add(_imageFile);
    final fileName = _imageFile.path.split('/').last;
    final destination = 'files/$fileName';
    task = FirebaseApi.uploadImage(destination, _imageFile);
    if (task == null) print("Not uploaded");
    final snapshot = await task.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    await FirebaseFirestore.instance
        .collection('notes')
        .add({'url': urlDownload, 'name': fileName});

    final snackBar = SnackBar(
      content: Text(
        'Image Saved Successfully',
        style: TextStyle(fontSize: 16, color: Colors.white),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.black54,
      duration: Duration(seconds: 1),
      shape: StadiumBorder(),
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      behavior: SnackBarBehavior.floating,
      elevation: 2,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
    print('Download-link: $urlDownload');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ALBUM",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.teal.shade700,
        centerTitle: true,
      ),
      body: FutureBuilder<List<FirebaseFile>>(
          future: futureFiles,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(child: Text('Some error occured!'));
                } else {
                  final files = snapshot.data;
                  return Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: files.length,
                          itemBuilder: (context, index) {
                            final file = files[index];
                            print(files.length);
                            return buildFile(context, file);
                          },
                        ),
                      ),
                      if (_imageFile != null) notesDialog(),
                      _imageFile != null
                          ? ElevatedButton(
                              onPressed: uploadImage,
                              child: Text("Save Image",
                                  style: TextStyle(fontSize: 20)
                              ),
                            ) : Container(),
                      ],
                  );
                }
            }
          }
          ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade700,
        child: Icon(
          Icons.add_a_photo,
          size: 30,
        ),
        onPressed: getImage,
      ),
    );
  }

  Widget buildFile(BuildContext context, FirebaseFile file) {
    return Container(
      child: TextButton(
        child: Image.network(
          file.url,
          fit: BoxFit.cover,
        ),
        onPressed: () {
          ImagePage(file);
        },
      ),
    );
  }

  ImagePage(FirebaseFile file) {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(10),
                height: 500,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        file.url,
                        width: 300,
                        height: 300,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: retrieveData(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        );
  }

  Widget retrieveData() {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('note');
    collectionReference.snapshots().listen((snapshot) {
      setState(() {
        data= snapshot.docs[0].data();
      });
    });
    return Text(
      data['content'].toString(),
      maxLines: 3,
      style: TextStyle(fontSize: 15, color: Colors.grey[500]),
      textAlign: TextAlign.center,
    );
  }
}

class notesDialog extends StatefulWidget {
  const notesDialog({Key key}) : super(key: key);

  @override
  _notesDialogState createState() => _notesDialogState();
}

class _notesDialogState extends State<notesDialog> {
  List numberofnotes;
  TextEditingController content = TextEditingController();
  CollectionReference ref = FirebaseFirestore.instance.collection('notes');
  Future<bool> notes() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: Text('Any notes?'),
        content: Expanded(
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: content,
              maxLines: null,
              expands: true,
              decoration: InputDecoration(
                hintText: 'Content',
              ),
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () async{
              await FirebaseFirestore.instance
                  .collection('note')
                  .add({'content': content.text});
              Navigator.pop(context);
              numberofnotes.add(content.text);
              print(numberofnotes.length);
              },
            child: Text('Save'),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Take Notes'),
      onPressed: () {
        notes();
      },
    );
  }
}

class FirebaseApi {
  static UploadTask uploadImage(String destination, File _imageFile) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(_imageFile);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());

  static Future<List<FirebaseFile>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();

    final urls = await _getDownloadLinks(result.items);

    return urls
        .asMap()
        .map((index, url) {
          final ref = result.items[index];
          final name = ref.name;
          final file = FirebaseFile(ref: ref, name: name, url: url);
          return MapEntry(index, file);
        })
        .values
        .toList();
  }
}

class FirebaseFile {
  final Reference ref;
  final String name;
  final String url;

  const FirebaseFile({
    @required this.ref,
    @required this.name,
    @required this.url,
  });
}

