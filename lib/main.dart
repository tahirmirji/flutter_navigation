import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FirestoreApp());
}

class FirestoreApp extends StatefulWidget {
  FirestoreApp({Key key}) : super(key: key);

  @override
  _FirestoreAppState createState() => _FirestoreAppState();
}

class _FirestoreAppState extends State<FirestoreApp> {
  Future<void> addStudent() async {
    final firestore = FirebaseFirestore.instance.collection('students');
    await firestore.add({'name': 'student10', 'rollno': 10});
  }

  Widget buildList(BuildContext context) {
    return new StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('students')
            .doc('VAyu2iLFdTkAGn7K1kWn')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text("Loading");
          }
          var userDocument = snapshot.data;
          return new Text(userDocument['name'],
              style: GoogleFonts.roboto(
                fontSize: 25,
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firestore Demo'),
        ),
        body: Container(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  addStudent();
                },
                child: Text(
                  'Add Student to Database',
                  style: GoogleFonts.poppins(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                width: 400,
                height: 400,
                child: buildList(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
