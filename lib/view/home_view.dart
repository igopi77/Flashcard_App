import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List<String> notes = ["Angles","9 Terms", "Kate_Napolitano"];
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
          cardForNotes()
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
        ),
      ),
    );
  }

  Widget cardForNotes() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(6, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 46, 56, 86)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(notes.length, (index) {
                      if (index == 0) {
                        return Text(notes[index],style: TextStyle(fontFamily: "extrabold",fontSize: 17,color: Colors.white),);
                      }
                      else if (index == 1) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 78, 93, 138)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 7,right: 7),
                              child: Text(notes[index],style: TextStyle(fontFamily: "extrabold",fontSize: 17,color: Colors.white),),
                            )
                          ),
                        );
                      }
                      else {
                        return Padding(
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
                                child: Text(notes[index],style: TextStyle(fontFamily: "extrabold",fontSize: 17,color: Colors.white),),
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 78, 93, 138)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 7,right: 7),
                                    child: Text("Teacher",style: TextStyle(fontFamily: "extrabold",fontSize: 17,color: Colors.white),),
                                  )
                              )
                            ],
                          ),
                        );
                      }
                    })
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
