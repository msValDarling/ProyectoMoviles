import 'dart:async';

import 'package:cakecraft/models/postres.dart';
import 'package:cakecraft/screens/PhotoUploadScreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CakeCraftHome extends StatefulWidget {
  const CakeCraftHome({Key? key}) : super(key: key);

  @override
  State<CakeCraftHome> createState() => _CakeCraftHomeState();
}

class _CakeCraftHomeState extends State<CakeCraftHome> {
  List<Postres> postresList = [];
  @override
  void initState() {
    super.initState();
  }

  Future<String> getDownloadURL(String filename) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('Craftea postres! :D')
        .child(filename);
    return await ref.getDownloadURL();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CakeCraftHome, Hola :D")),
      body: Container(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink.shade100,
        child: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //--------------------------
            IconButton(
              icon: Icon(Icons.add_a_photo),
              iconSize: 40,
              color: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PhotoUploadScreen();
                }));
              },
            )
          ],
        )),
      ),
    );
  }
}
