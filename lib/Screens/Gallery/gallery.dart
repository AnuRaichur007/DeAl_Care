import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

// class Album extends StatefulWidget {
//   @override
//   _AlbumState createState() => _AlbumState();
// }
//
// class _AlbumState extends State<Album> {
//   File _imageFile;
//   UploadTask task;
//   final picker = ImagePicker();
//
//   @override
//   Widget build(BuildContext context) {
//     // final fileName =
//     //     _imageFile != null ? _imageFile.path.split('/').last : 'Hello!';
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "ALBUM",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20.0,
//           ),
//         ),
//         backgroundColor: Colors.cyan.shade800,
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               _imageFile != null ? Image.file(_imageFile) : Text("No images"),
//               if (_imageFile != null) notesDialog(),
//               _imageFile != null
//                   ? ElevatedButton(
//                       onPressed: uploadImage,
//                       child: Text("Save Image", style: TextStyle(fontSize: 20)),
//                     )
//                   : Container(),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.grey.shade700,
//         child: Icon(
//           Icons.add_a_photo,
//           size: 30,
//         ),
//         onPressed: getImage,
//       ),
//     );
//   }
//
//   Future getImage() async {
//     final pickedFile = await picker.getImage(source: ImageSource.camera);
//     if (pickedFile == null) return;
//     setState(() {
//       _imageFile = File(pickedFile.path);
//     });
//   }
//
//   Future uploadImage() async {
//     if (_imageFile == null) return;
//
//     final fileName = _imageFile.path.split('/').last;
//     final destination = 'files/$fileName';
//     task = FirebaseApi.uploadImage(destination, _imageFile);
//     if (task == null) print("Not uploaded");
//     final snapshot = await task.whenComplete(() {});
//     final urlDownload = await snapshot.ref.getDownloadURL();
//     print('Download-link: $urlDownload');
//   }
// }
//
// class notesDialog extends StatefulWidget {
//   const notesDialog({Key key}) : super(key: key);
//
//   @override
//   _notesDialogState createState() => _notesDialogState();
// }
//
// class _notesDialogState extends State<notesDialog> {
//   TextEditingController content = TextEditingController();
//   CollectionReference ref = FirebaseFirestore.instance.collection('notes');
//   Future<bool> notes() {
//     return showDialog(
//       context: context,
//       builder: (context) => new AlertDialog(
//         title: Text('Any notes?'),
//         content: Expanded(
//           child: Container(
//             height: 100,
//             width: 100,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: TextField(
//               controller: content,
//               maxLines: null,
//               expands: true,
//               decoration: InputDecoration(
//                 hintText: 'Content',
//               ),
//             ),
//           ),
//         ),
//         actions: [
//           TextButton(
//               onPressed: () {
//                 ref.add({'content': content.text});
//                 Navigator.of(context).pop(false);
//               },
//               child: Text('Save')),
//           TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(false);
//               },
//               child: Text('Cancel')),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () {
//         notes();
//         return Future.value(false);
//       },
//       child: ElevatedButton(
//         child: Text('Take Notes'),
//         onPressed: () {
//           notes();
//         },
//       ),
//     );
//   }
// }
//
// class FirebaseApi {
//   static UploadTask uploadImage(String destination, File _imageFile) {
//     try {
//       final ref = FirebaseStorage.instance.ref(destination);
//       return ref.putFile(_imageFile);
//     } on FirebaseException catch (e) {
//       return null;
//     }
//   }
// }

class Album extends StatefulWidget {
  @override
  _AlbumState createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  Future<List<FirebaseFile>> futureFiles;

  @override
  void initState(){
    super.initState();
    futureFiles = FirebaseApi.listAll('files/');
  }

  File _imageFile;
  UploadTask task;
  final picker = ImagePicker();
  List listOfImages;

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
    print('Download-link: $urlDownload');
  }

  @override
  Widget build(BuildContext context) {
    // final fileName =
    //     _imageFile != null ? _imageFile.path.split('/').last : 'Hello!';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ALBUM",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.cyan.shade800,
        centerTitle: true,
      ),
      body: FutureBuilder<List<FirebaseFile>>(
          future: futureFiles,
          builder: (context, snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if(snapshot.hasError){
                  return Center(child: Text('Some error occured!'));
                }else{
                  final files = snapshot.data;
                  return Column(
                    children: [
                      Expanded(
                          child: ListView.builder(
                            itemCount: files.length,
                            itemBuilder: (context, index){
                              final file = files[index];
                              print(files.length);
                              return buildFile(context, file);
                            },
                          )
                      ),
                      //_imageFile != null ? Image.file(_imageFile) : Text("No images"),
                      if(_imageFile != null) notesDialog(),
                      _imageFile != null
                          ? ElevatedButton(
                        onPressed: uploadImage,
                        child: Text(
                            "Save Image",
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
    return ListTile(
      leading: Image.network(
        file.url,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      title: Text(
        file.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class notesDialog extends StatefulWidget {
  const notesDialog({Key key}) : super(key: key);

  @override
  _notesDialogState createState() => _notesDialogState();
}

class _notesDialogState extends State<notesDialog> {
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
        actions: [
          TextButton(
              onPressed: (){
                ref.add({'content': content.text});
                Navigator.of(context).pop();
              },
              child: Text('Save')
          ),
          TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text('Cancel')
          ),
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

  static Future<List<FirebaseFile>> listAll(String path) async{
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

