import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospital_management/modals/record_modals.dart';
import 'package:image_picker/image_picker.dart';

File _imageFile;

class UploadRecords extends StatefulWidget {
  //const UploadRecords({ Key? key }) : super(key: key);

  @override
  _UploadRecordsState createState() => _UploadRecordsState();
}

class _UploadRecordsState extends State<UploadRecords> {
  TextEditingController _c1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UPLOAD RECORDS"),
        elevation: 10,
        shadowColor: Colors.teal,
        backgroundColor: Colors.teal,
      ),
      body: Form(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            _imageFile == null
                ? Text("No image choosen")
                : Image.file(
                    _imageFile,
                    height: 450,
                    width: 350,
                  ),
            Container(
              margin: EdgeInsets.all(5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo[500],
                  elevation: 7,
                  // shadowColor: Colors.blue,
                ),
                onPressed: () {
                  pickImage();
                },
                child: Center(child: Text("Choose Image from Gallery")),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: TextField(
                controller: _c1,
                minLines: 3,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: "Enter description",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.pink,
                    ),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo[500],
                  elevation: 7,
                  //shadowColor: Colors.blue,
                ),
                onPressed: () {
                  uploadRecords();
                  Navigator.pop(context);
                },
                child: Text("Upload Image"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  uploadRecords() async {
    var img = await uploadImage();
    RecordModel sm = new RecordModel();
    sm.docid = FirebaseFirestore.instance.collection("app_users").doc().id;
    sm.imgurl = img.toString();
    sm.des = _c1.text;
    try {
      await FirebaseFirestore.instance
          .collection('app_users/' +
              FirebaseAuth.instance.currentUser.email +
              '/records')
          .doc(sm.docid)
          .set({"imgurl": sm.imgurl, "des": sm.des});
      Fluttertoast.showToast(msg: "successfully created");
    } catch (e) {
      Fluttertoast.showToast(msg: "error occured");
    }
  }

  Future pickImage() async {
    var picker =
        ImagePicker(); //pickImage(source: ImageSource.gallery)) as File;
    final file = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (file != null) {
        _imageFile = File(file.path);
      } else {
        Fluttertoast.showToast(msg: "No image choosen");
      }
    });
  }

  Future<String> uploadImage() async {
    //StorageReference storageReference = FirebaseStorage().ref().child("path");
    var em = FirebaseAuth.instance.currentUser.email;
    //StorageManager ref = FirebaseStorage.;
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    firebase_storage.Reference imgref = storage.ref('$em');

    //File file = _imageFile;

    /* UploadTask task1 =
        imgref.child(DateTime.now().toIso8601String()).putFile(_imageFile);*/
    String imgurl;
    TaskSnapshot addImg = await imgref
        .child(DateTime.now().toIso8601String())
        .putFile(_imageFile);
    if (addImg.state == TaskState.success) {
      imgurl = await addImg.ref.getDownloadURL();

      print(imgurl);
    }
    return imgurl;
  }
}
