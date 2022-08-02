import 'package:education_app/model/subject.dart';
import 'package:education_app/services/subject_service.dart';
import 'package:education_app/views/chapter_view.dart';
import 'package:flutter/material.dart';

class SubjectView extends StatefulWidget {
  const SubjectView({Key? key}) : super(key: key);

  @override
  State<SubjectView> createState() => _SubjectViewState();
}

class _SubjectViewState extends State<SubjectView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: const [
        SizedBox(
          height: 150,
        ),
        Center(
          child: Text(
            'Subject',
            style: TextStyle(fontSize: 30),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        SubjectTile()
      ]),
    );
  }
}

class SubjectTile extends StatefulWidget {
  const SubjectTile({
    Key? key,
  }) : super(key: key);

  @override
  State<SubjectTile> createState() => _SubjectTileState();
}

class _SubjectTileState extends State<SubjectTile> {
  List<Subject>? subjects;
  var isLoaded = false;

  List images = [
    "https://thumbs.dreamstime.com/b/blue-round-english-subject-concept-vector-linear-blue-round-concept-english-subject-school-lesson-children-education-102989283.jpg",
    "https://thumbs.dreamstime.com/b/science-background-research-outline-icons-biotechnology-medical-elements-linear-dna-concept-tiny-line-vector-design-stem-154441020.jpg",
    "https://cdn.w600.comps.canstockphoto.fr/bleu-maths-concept-sujet-clipart-vecteur_csp54225959.jpg"
  ];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    subjects = await SubjectService().getSubjects();
    if (subjects != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Visibility(
        visible: isLoaded,
        child: GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          itemCount: subjects?.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChapterView(),
                  ),
                );
              },
              child: Card(
                elevation: 10,
                shadowColor: Colors.black,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.network(
                              images[index],
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            subjects![index].name,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 8,
          ),
        ),
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
