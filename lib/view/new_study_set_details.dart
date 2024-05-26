import 'package:flutter/cupertino.dart';
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
          for (int i=0;i<5;i++)
            cardForEachSlide()
        ],
      ),
    );
  }

  Widget cardForEachSlide() {
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
                  )
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
                  )
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  )
                ],
              ),
              SizedBox(height: 10,)
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
            ),
          ),
        ),
      ],
    );
  }


}
