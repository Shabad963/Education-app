import 'package:education_app/model/chapter.dart';
import 'package:education_app/services/chapter_service.dart';
import 'package:flutter/material.dart';

class ChapterView extends StatefulWidget {
  const ChapterView({Key? key}) : super(key: key);

  @override
  State<ChapterView> createState() => _ChapterViewState();
}

class _ChapterViewState extends State<ChapterView> {
  List<Chapter>? chapters;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getDatas();
  }

  getDatas() async {
    chapters = await ChapterService().getChapters();
    if (chapters != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Icon(Icons.keyboard_arrow_left),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Center(
            child: Text(
              'Chapters',
              style: TextStyle(fontSize: 30),
            ),
          ),
          SizedBox(height: 5),
          DefaultTabController(
              length: 3, // length of tabs
              initialIndex: 0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(text: 'Chapters'),
                          Tab(text: 'Ques & Ans'),
                          Tab(text: 'Recourse'),
                        ],
                      ),
                    ),
                    Container(
                        height: 400, //height of TabBarView
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: Colors.grey, width: 0.5))),
                        child: TabBarView(children: <Widget>[
                          Visibility(
                            visible: isLoaded,
                            child: ListView.builder(
                                itemCount: chapters?.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => ListTile(
                                      leading: Image.network(
                                        "https://media-exp1.licdn.com/dms/image/C560BAQEE3kPMLi-Ckg/company-logo_200_200/0/1581504585673?e=1666224000&v=beta&t=E6C-Op539zn2YILDXY_9mHrehaycIA3fFA1125bc38U",
                                      ),
                                      title: Text(chapters![index].title),
                                      subtitle:
                                          Text(chapters![index].description),
                                      trailing: Text(
                                        "Price : ${chapters![index].price} Rs",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    )),
                            replacement:
                                Center(child: CircularProgressIndicator()),
                          ),
                          Container(
                            child: Center(
                              child: Text('Questions & Answers coming soon',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text('Recourse coming soon',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ]))
                  ])),
        ],
      ),
    );
  }
}
