import 'package:flashcard_app/model/notesDetails.dart';
import 'package:flashcard_app/view/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class NewStudySetDetailsView extends StatefulWidget {
  NewStudySetDetailsView({super.key});

  @override
  State<NewStudySetDetailsView> createState() => _NewStudySetDetailsViewState();

}

class _NewStudySetDetailsViewState extends State<NewStudySetDetailsView> {

  int index = 5;
  Map<String,dynamic> notesDetails = {};
  List<Map<String,dynamic>> finalNotes = [] ;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController schoolController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 10, 9, 45),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 10, 9, 45),
        iconTheme: IconThemeData(
            color: Colors.white,
            size: 35
        ),
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
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: bodyPartOfForm()),
    );
  }

  Widget bodyPartOfForm() {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          basicInfoAboutNote(),
          SizedBox(height: 50,),
          Text("Terms and Definition",
            style: TextStyle(
                fontFamily: "semibold",
                fontSize: 17,
                color: Colors.white
            ),
          ),
          for (int i=0;i<index;i++)
            cardForEachSlide(i),

          GestureDetector(
            onTap: () {
              setState(() {
                index++;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5),
                  child: Icon(Icons.add,
                    color: Colors.white,
                    size: 30,
                  )
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: () {
              Navigator.push(context, (MaterialPageRoute(builder: (context) => const HomeView())));
              notesDetails["title"] = titleController.text;
              notesDetails["description"] = descriptionController.text;
              notesDetails["school name"] = schoolController.text;
              finalNotes.add(notesDetails);
              NotesDetails.notesDetails.addAll(finalNotes);
              print(NotesDetails.notesDetails);
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pink
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontFamily: "semibold",
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30,)
        ],
      ),
    );
  }

  Widget cardForEachSlide(int index) {
    TextEditingController termController = TextEditingController();
    TextEditingController definitionController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 46, 56, 86)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              TextField(
                  decoration: InputDecoration(
                      hintText: "Enter term",
                      hintStyle: TextStyle(
                          fontFamily: "semibold",
                          color: Colors.white,
                          fontSize: 17
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white,width: 2
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      )
                  ),
                controller: termController,
              ),
              SizedBox(height: 6,),
              Text("TERM",
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: "semibold",
                    color: Colors.white
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                  decoration: InputDecoration(
                      hintText: "Enter definition",
                      hintStyle: TextStyle(
                          fontFamily: "semibold",
                          color: Colors.white,
                          fontSize: 17
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white,width: 2
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      )
                  ),
                controller: definitionController,
              ),
              SizedBox(height: 6,),
              Text("DEFINITION",
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: "semibold",
                    color: Colors.white
                ),
              ),
              SizedBox(height: 30,),
              Center(
                child: MaterialButton(
                    onPressed: (){
                      notesDetails[index.toString()] = [termController.text,definitionController.text];
                      print(notesDetails);
                    },
                  child: Text("OK"),
                  color: Colors.blueAccent,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  )
                ],
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }

  Widget basicInfoAboutNote() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30,),
        Text(
          "Create a new study set",
          style: TextStyle(
              fontFamily: "black",
              fontSize: 20,
              color: Colors.white
          ),
        ),
        SizedBox(height: 30,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 46, 56, 86),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Enter a title, like --> Biology - Chapter 22",
                  hintStyle: TextStyle(
                      fontFamily: "semibold",
                      fontSize: 17,
                      color: Colors.white
                  )
              ),
              controller: titleController,
            ),
          ),
        ),
        SizedBox(height: 20,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 46, 56, 86),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Add a description...",
                hintStyle: TextStyle(
                    fontFamily: "semibold",
                    fontSize: 17,
                    color: Colors.white
                ),
              ),
              maxLines: 4,
              controller: descriptionController,
            ),
          ),
        ),
        SizedBox(height: 20,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 46, 56, 86),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "School name",
                  hintStyle: TextStyle(
                      fontFamily: "semibold",
                      fontSize: 17,
                      color: Colors.white
                  )
              ),
              controller: schoolController,
            ),
          ),
        ),
      ],
    );
  }


}
