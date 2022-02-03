import 'package:QuranApplication/Screens/surah.dart';
import 'package:flutter/material.dart';
import 'package:quran/quran.dart';
import 'package:QuranApplication/Color/colorScheme.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //------------------------Main Header
  Widget Header() {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Image(
            fit: BoxFit.fitWidth,
            image: AssetImage("assets/MainHeader.png"),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                child: Text(
                  "بِسْمِ اِ۬للَّهِ اِ۬لرَّحْمَٰنِ اِ۬لرَّحِيم",
                  style: TextStyle(
                      color: text, fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                child: Text(
                  "القرآن",
                  style: TextStyle(
                      color: white, fontWeight: FontWeight.bold, fontSize: 50),
                ),
              ),
            ],
          )
        ],
      ),
      height: 240,
    );
  }

  //------------------------Main Tab
  Widget MainTab() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //surah Button
          FlatButton(
            onPressed: () {
              debugPrint("--Surah--");
            },
            child: Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: fBlue,
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  "Surah",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500, color: text),
                ),
              ),
            ),
          ),
          //details Button
          FlatButton(
            onPressed: () {
              debugPrint("Details");
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text(
                "Details",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w500, color: text),
              ),
            ),
          ),
        ],
      ),
      height: 50,
    );
  }

  //------------------------Surah List
  Widget ListOfSurah() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 550,
      child: GridView.count(
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        children: List.generate(114, (index) {
          return FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (Context) => SurahPage(value: index + 1)));
            },
            child: Center(
              child: Container(
                width: 180,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(5),
                  color: fBlue,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${getSurahName(index + 1)}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: text,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      Divider(
                        color: white,
                        height: 20,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${getSurahNameEnglish(index + 1)}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: text,
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                        ),
                      ),
                    ]),
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bBlue,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Header(),
              //MainTab(),
              DefaultTabController(
                  length: 2,
                  child: Row(
                    children: [
                      Container(
                        height: 15,
                        width: 150,
                        color: white,
                      ),
                      Container(
                        height: 15,
                        width: 150,
                        color: white,
                      ),
                    ],
                  )),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 10,
                color: white,
              ),
              ListOfSurah(),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
