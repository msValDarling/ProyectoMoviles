import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:cakecraft/models/postres.dart';
import 'package:cakecraft/screens/PhotoUploadScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
//import 'package:cached_network_image/cached_network_image.dart';

class CakeCraftHome extends StatefulWidget {
  const CakeCraftHome({Key? key}) : super(key: key);

  @override
  State<CakeCraftHome> createState() => _CakeCraftHomeState();
}

class _CakeCraftHomeState extends State<CakeCraftHome> {
  //List<Postres> postresList = [];
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

  /* Future<String> getPost() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("CakeCrafts");
    DatabaseEvent event = await ref.once();
    print(event.snapshot.value);

    return "aaa";
  } */

  /* Future<Object?> getPostres() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("CakeCrafts");
    DatabaseEvent event = await ref.once();
    //print(event.snapshot.value);
    /* var obj = event.snapshot.value;
    //print(obj);
    List<dynamic> dataList = [];

    obj.forEach((key, value) {
      dataList.add(value);
    }); */
    //Map data = event.snapshot.value;
    // Mostrar la lista de datos
    //print(dataList);
    return event.snapshot.value;
  } */
  /* Future<List<Postres>> getYears() async {
    Completer<List<Postres>> completer = new Completer<List<Postres>>();

    List<Postres> postres;

    FirebaseDatabase.instance
        .ref()
        .child("CakeCrafts")
        .once()
        .then((value) {
           Map<dynamic, dynamic> postreMap = value.snapshot.value;
          postreMap.forEach((key, value) {
            years.add(Year.fromJson(key, value));
          });
        });

      completer.complete(postres);
    

    return completer.future;
  } */
  /* Stream<List<Postre>> readPostres() {

    /* print("--->${FirebaseFirestore.instance.collection('cakecraft')}");
    return FirebaseFirestore.instance.collection('cakecraft').snapshots().map(
        (event) => event.docs.map((e) => Postre.fromJson(e.data())).toList()); */
  } */
  Stream<List<Postre>> readPostres() =>
      FirebaseFirestore.instance.collection('cakecraft').snapshots().map(
          (event) => event.docs.map((e) => Postre.fromJson(e.data())).toList());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CakeCraftHome, Hola :D")),
      //-----------------------------
      body: StreamBuilder(
        stream: readPostres(),
        builder: (context, snapshot) {
          print("->${snapshot.data}");
          if (snapshot.hasData) {
            return GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(7),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .8,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  print("-> ${snapshot.data![index]}");
                  return Column(
                    children: [
                      Text(
                        snapshot.data![index].date!,
                        overflow: TextOverflow.ellipsis,
                      ),
                      InkWell(
                        child: Image.network(snapshot.data![index].imageUrl!),
                        onTap: () {},
                      ),
                      Text('\$${snapshot.data![index].description}'),
                    ],
                  );
                });
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
//aqui
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
