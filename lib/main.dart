import 'package:flashcard_app/view/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  Widget app = MaterialApp(
    initialRoute: "/home",
    routes: {
      "/home" : (context) => const HomeView()
    },
  );

  runApp(app);
}