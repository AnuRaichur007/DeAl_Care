import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

// class Gallery extends StatefulWidget {
//   @override
//   _GalleryState createState() => _GalleryState();
// }
//
// class _GalleryState extends State<Gallery> {
//   File _imageFile;
//   final picker = ImagePicker();
//   String _uploadedFileURL;
//
//   Future getImage() async {
//     final pickedFile = await picker.getImage(source: ImageSource.camera);
//     setState(() {
//       _imageFile = File(pickedFile.path);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Album"),
//         backgroundColor: Colors.cyan.shade800,
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           child: Column(
//             children: <Widget>[
//               _imageFile != null
//                   ? Image.file(_imageFile)
//                   : FlatButton(
//                       child: Icon(
//                         Icons.add_a_photo,
//                         size: 50,
//                       ),
//                       onPressed: getImage,
//                     ),
//               _imageFile != null
//                   ? FlatButton(
//                       // onPressed: uploadFile,
//                       onPressed: () async {
//                         String fileName = _imageFile.path.split('/').last;
//                         FirebaseStorage firebaseStorageRef =
//                             FirebaseStorage.instance;
//                         Reference ref = firebaseStorageRef
//                             .ref()
//                             .child('upload/$_imageFile.path');
//                         UploadTask uploadTask = ref.putFile(_imageFile);
//                         print(uploadTask);
//                         ref.getDownloadURL().then(
//                               (value) => print("Done: $value"),
//                             );
//                       },
//                       child: Text(
//                         "Upload Image",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     )
//                   : Container(),
//               Text('Uploaded Image'),
//               _uploadedFileURL != null
//                   ? Image.network(
//                       _uploadedFileURL,
//                       height: 150,
//                     )
//                   : Text("No images"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  File _imageFile;
  UploadTask task;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final fileName = _imageFile != null
        ? _imageFile.path.split('/').last
        : 'No files selected';
    return Scaffold(
      appBar: AppBar(
        title: Text("Album"),
        backgroundColor: Colors.cyan.shade800,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              _imageFile != null
                  ? Image.file(_imageFile)
                  : FloatingActionButton(
                      child: Icon(
                        Icons.add_a_photo,
                        size: 20,
                      ),
                      onPressed: getImage,
                    ),
              Text(
                fileName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              _imageFile != null
                  ? TextButton(
                      onPressed: uploadImage,
                      child: Text(
                        "Upload Image",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile == null) return;
    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  Future uploadImage() async {
    if (_imageFile == null) return;

    final fileName = _imageFile.path.split('/').last;
    final destination = 'files/$fileName';
    task = FirebaseApi.uploadImage(destination, _imageFile);
    if (task == null) print("Not uploaded");
    final snapshot = await task.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download-link: $urlDownload');
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
}
