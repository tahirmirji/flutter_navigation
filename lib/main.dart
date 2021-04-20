import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(FirestoreApp());
}

class FirestoreApp extends StatefulWidget {
  FirestoreApp({Key key}) : super(key: key);

  @override
  _FirestoreAppState createState() => _FirestoreAppState();
}

class _FirestoreAppState extends State<FirestoreApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Hello World'),
    );
  }
}
