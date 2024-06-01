import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotesDisplayingView extends StatefulWidget {
  NotesDisplayingView({super.key,required this.content, required this.title,required this.description,required this.author});

  List<List<String>> content;
  String title;
  String description;
  String author;

  @override
  State<NotesDisplayingView> createState() => _NotesDisplayingViewState();
}

class _NotesDisplayingViewState extends State<NotesDisplayingView> {
  List<bool> starBool = [];

  @override
  void initState() {
    starBool = List.filled(widget.content.length, false);
    super.initState();
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
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 25
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: bodyPartForViewing()),
    );
  }
  Widget aboutNoteCard() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 46, 56, 86)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,top: 15,bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title,
              style: TextStyle(
                  fontFamily: "black",
                  fontSize: 25,
                  color: Colors.white
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "About the ${widget.description}",
              style: TextStyle(
                fontFamily: "extrabold",
                fontSize: 17,
                color: Colors.red.shade300,
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                CircleAvatar(),
                SizedBox(width: 10,),
                Column(
                  children: [
                    Text(
                      "Created by",
                      style: TextStyle(
                          fontFamily: "semibold",
                          fontSize: 17,
                          color: Colors.white
                      ),
                    ),
                    Text(widget.author,
                      style: TextStyle(
                          fontFamily: "extrabold",
                          fontSize: 17,
                          color: Colors.red.shade300
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget bodyPartForViewing() {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50,),
          aboutNoteCard(),
          SizedBox(height: 20,),
          Text(
            "Terms in this set (${widget.content.length})",
            style: TextStyle(
                fontFamily: "black",
                fontSize: 20,
                color: Colors.white
            ),
          ),
          SizedBox(height : 30),
          for (int i=0;i<widget.content.length;i++)
            cardForNotes(widget.content[i],i)
        ],
      ),
    );
  }

  Widget cardForNotes(List<String> content,int i) {
    return Padding(
      padding: const EdgeInsets.only(bottom : 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 46, 56, 86)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left : 20,right : 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        starBool[i] = !starBool[i];
                      });
                    },
                    child: Icon(
                      Icons.star,
                      color: starBool[i] ? Colors.yellow : Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text(
                    "Term : ",
                    style: TextStyle(
                        fontFamily: "black",
                        fontSize: 18,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    content[0],
                    style: TextStyle(
                      fontFamily: "extrabold",
                      fontSize: 18,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Definition : ",
                    style: TextStyle(
                        fontFamily: "black",
                        fontSize: 18,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                    content[1],
                    style: TextStyle(
                        fontFamily: "extrabold",
                        fontSize: 18,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),

            ],
          ),
        ),
      ),
    );
  }
}
