import 'dart:convert';

import 'package:flashcard_app/repository/data.dart';
import 'package:http/http.dart' as http;
import 'package:flashcard_app/model/notesDetails.dart';

Future<dynamic> postNotes(List<Map<String, dynamic>> finalNotes) async {
  var requestBody = {
    "notes" : finalNotes
  };
  print(requestBody);
  var response = await http.post(Uri.parse("${Data.data}postNotes"),
      headers:{"Content-Type":"application/json"},
      body: jsonEncode(requestBody)
  );
  var decodedBody = jsonDecode(response.body);
  //print(decodedBody);
  //NotesDetails.notesDetails.addAll(decodedBody["message"]);
  if (decodedBody["status"] == true) {
    return true;
  }
  return false;
}

Future<void> getPost() async {
  var response = await http.get(Uri.parse(
      "${Data.data}getNotes"),
    headers: {"Content-Type":"application/json"},
  );
  var decodedBody = jsonDecode(response.body);
  if (decodedBody["status"] == true) {
    print("flag1");
    try {
      List<Map<String, dynamic>> notesDetails = List<Map<String, dynamic>>.from(decodedBody["message"]);
      NotesDetails.notesDetails = notesDetails;
      print("From Service : ${NotesDetails.notesDetails}");
    }catch (e) {
      print("Error : ${e}");
    }
    print("flag2");
  }
  else {
    NotesDetails.notesDetails = [];
  }
}