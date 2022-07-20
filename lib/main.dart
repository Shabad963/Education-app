import 'package:education_app/model/subject.dart';
import 'package:education_app/services/subject_service.dart';
import 'package:education_app/views/chapter_view.dart';
import 'package:education_app/views/subject_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Edu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SubjectView(),
    );
  }
}
