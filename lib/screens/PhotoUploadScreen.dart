import 'dart:io';
import 'package:cakecraft/models/postres.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var docPostre = FirebaseFirestore.instance.collection('cakecraft').doc();

class PhotoUploadScreen extends StatefulWidget {
  const PhotoUploadScreen({super.key});

  @override
  State<PhotoUploadScreen> createState() => _PhotoUploadScreenState();
}

class _PhotoUploadScreenState extends State<PhotoUploadScreen> {
  File? sampleImage; // imagen
  String _myValue = ""; //descripcion
  String? url; //url de la imagen

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Craftea un postre nuevo! :D'),
        centerTitle: true,
      ),
      body: Center(
        child: sampleImage == null
            ? Text("Añade tu PostCraft! :D")
            : enableUpload(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: "Añadir imagen",
        child: Icon(Icons.add_a_photo),
      ),
      /* floatingActionButton: FloatingActionButton(
        onPressed: openCamera,
        tooltip: "Crea imagen",
        child: Icon(Icons.add_a_photo),
      ), */
    );
  }
  // Implementing the camera
  /*  Future<void> openCamera() async {
    var tempImage = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      if (tempImage != null) {
        sampleImage = File(tempImage.path);
      }
    });
  } */

  Future getImage() async {
    var tempImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (tempImage != null) {
        sampleImage = File(tempImage.path);
      }
    });
  }

  Widget enableUpload() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                sampleImage != null
                    ? Image.file(
                        sampleImage!,
                        height: 300.0,
                        width: 600.0,
                      )
                    : const SizedBox.shrink(),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration:
                      InputDecoration(labelText: "Craftea tu descripción"),
                  validator: (value) {
                    return value!.isEmpty
                        ? "Se requiere una descripción aqui"
                        : null;
                  },
                  onSaved: (value) {
                    _myValue = value!;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                ElevatedButton(
                  onPressed: uploadStatusImage,
                  child: Text('Añade un nuevo postre :D'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void uploadStatusImage() async {
    if (validateAndSave()) {
      // subir imagen a firebase storage
      final Reference postImageRef =
          FirebaseStorage.instance.ref().child("Postres");
      var timekey = DateTime.now();
      final UploadTask uploadTask =
          postImageRef.child(timekey.toString() + ".jpg").putFile(sampleImage!);

      TaskSnapshot snapshot = await uploadTask.whenComplete(() => true);
      var imageUrl = await snapshot.ref.getDownloadURL();
      url = imageUrl.toString();
      print("Postre url: " + url!);

      //guardar el postre
      //saveToDatabase(url!);
      if (snapshot.state == TaskState.success) {
        final String urlImg = await snapshot.ref.getDownloadURL();
        print(urlImg);
        print('SE SUBIOOOO');
        var dbTimeKey = DateTime.now();
        var formatDate = DateFormat('MMM d, yyyy');
        var formatTime = DateFormat('EEEE, hh:mm aaa');

        String date = formatDate.format(dbTimeKey);
        String time = formatTime.format(dbTimeKey);
        final prod = Postre(
            id: docPostre.id,
            description: _myValue,
            date: date,
            time: time,
            imageUrl: imageUrl);
        final json = prod.toJson();
        await docPostre.set(json).then((value) {
          setState(() {
            sampleImage = null;

            docPostre =
                FirebaseFirestore.instance.collection('cakecraft').doc();
          });
          print('AgregadOO');
          print(json.values);
        });
      }

      //enviar mensaje de correcta subida de  imagen sjjsjs
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              '"¡Crafteado con éxito! Tu post ha sido horneado a la perfección"'),
          duration: Duration(
              seconds: 4), // Duración en segundos que se mostrará el Snackbar
          action: SnackBarAction(
            label: '',
            onPressed: () {
              // Acción a realizar al presionar el botón de acción
            },
          ),
        ),
      );

      //regresar a home
      Navigator.pop(context);
    }
  }

//
//guardar el postre a firebase database realtime
  void saveToDatabase(String url) {
    var dbTimeKey = DateTime.now();
    var formatDate = DateFormat('MMM d, yyyy');
    var formatTime = DateFormat('EEEE, hh:mm aaa');

    String date = formatDate.format(dbTimeKey);
    String time = formatTime.format(dbTimeKey);

    DatabaseReference rf = FirebaseDatabase.instance.ref();
    var data = {
      "postre": url,
      "description": _myValue,
      "date": date,
      "time": time
    };
    rf.child("CakeCrafts").push().set(data);
  }

  bool validateAndSave() {
    final form = formkey.currentState;
    if (form != null && form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
