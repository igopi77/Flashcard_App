import 'package:flutter/material.dart';
class NewStudySetDetailsView extends StatefulWidget {
  const NewStudySetDetailsView({super.key});

  @override
  State<NewStudySetDetailsView> createState() => _NewStudySetDetailsViewState();
}

class _NewStudySetDetailsViewState extends State<NewStudySetDetailsView> {
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
    );
  }
}
