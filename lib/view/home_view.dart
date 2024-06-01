import 'dart:convert';

import 'package:flashcard_app/model/notesDetails.dart';
import 'package:flashcard_app/services/notes_service.dart';
import 'package:flashcard_app/view/new_study_set_details.dart';
import 'package:flashcard_app/view/notes_displaying_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List<Map<String,dynamic>> allNotes = [];


  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    await getPost();
    setState(() {
      allNotes = NotesDetails.notesDetails;
    });
    print("From Home : ${NotesDetails.notesDetails}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 10, 9, 45),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 10, 9, 45),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "FLASHCARD APP",
              style: TextStyle(
                fontFamily: "black",
                fontSize: 20,
                color: Colors.white
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, (MaterialPageRoute(builder: (context) =>  NewStudySetDetailsView())));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blueAccent
                ),
                child: Icon(
                  Icons.add,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        iconTheme: IconThemeData(
         color: Colors.white,
         size: 28
        ),
      ),
      drawer: Drawer(
        child: ListTile(
        ),
        backgroundColor: Color.fromARGB(255, 10, 9, 45),
      ),
      body: bodyPartOfHomePage(),
    );
  }

  Widget bodyPartOfHomePage() {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          searchbox(),
          SizedBox(height: 50,),
          Text(
              "Recent",
            style: TextStyle(
              fontFamily: "extrabold",
              fontSize: 24,
              color: Colors.white
            ),
          ),
          SizedBox(height: 20,),
          if (allNotes.isNotEmpty)
            cardForNotes(),
          if (allNotes.isEmpty)
            Text(
                "NO RECENTS",
              style: TextStyle(
                fontFamily: "semibold",
                fontSize: 20,
                color: Colors.blueAccent
              ),
            )
        ],
      ),
    );
  }
  Widget searchbox() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 46, 56, 86)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            hintText: "Search For a Flashcards",
            hintStyle: const TextStyle(
              fontFamily: "regular",
              fontSize: 17,
              color: Colors.white
            ),
            icon: Icon(Icons.search_rounded),
            iconColor: Colors.white
          ),
          style : TextStyle(
              color: Colors.white,
              fontFamily : "regular"
          ),
        ),
      ),
    );
  }

  Widget cardForNotes() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(allNotes.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                List<List<String>> content = [];
                if (allNotes[index]["notes"] is List) {
                  // Check if "notes" is a list
                  List<dynamic> notes = allNotes[index]["notes"];
                  if (notes.isNotEmpty) {
                    // Assuming only one item in the list
                    Map<String, dynamic> firstNote = notes[0];
                    String title = firstNote["title"] ?? "";
                    String description = firstNote["description"] ?? "";
                    String author = firstNote["school name"] ?? "";
                    firstNote.forEach((key, value) {
                      if (key != "title" && key != "description" && key != "school name") {
                        List<String> temp = List<String>.from(value ?? []);
                        content.add(temp);
                      }
                    });
                  }
                }
                print(content);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotesDisplayingView(
                      content: content,
                      description: allNotes[index]["notes"][0]["description"],
                      author: allNotes[index]["notes"][0]["school name"],
                      title: allNotes[index]["notes"][0]["title"],
                    ),
                  ),
                );
              },

              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 46, 56, 86)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(allNotes[index]["notes"][0]["title"],style: TextStyle(fontFamily: "extrabold",fontSize: 17,color: Colors.white),),
                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 78, 93, 138)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7,right: 7),
                              child: Text(allNotes[index]["notes"][0]["description"],style: TextStyle(fontFamily: "extrabold",fontSize: 17,color: Colors.white),),
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50,bottom: 10),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.pink
                                  ),
                                  child: CircleAvatar(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(allNotes[index]["notes"][0]["school name"],style: TextStyle(fontFamily: "extrabold",fontSize: 17,color: Colors.white),),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 78, 93, 138)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 7,right: 7),
                                    child: Text("Student",style: TextStyle(fontFamily: "extrabold",fontSize: 17,color: Colors.white),),
                                  )
                              )
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
