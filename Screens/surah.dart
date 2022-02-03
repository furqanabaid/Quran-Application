import 'package:QuranApplication/Color/colorScheme.dart';
import 'package:flutter/material.dart';
import 'package:quran/quran.dart';

var colorBack = Color(0xFF0C2D48);

class SurahPage extends StatelessWidget {
  final value;
  SurahPage({this.value});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bBlue,
        appBar: AppBar(
          backgroundColor: fBlue,
          title: Text("${getSurahName(value)}"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Surah Details
              Card(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(5),
                      color: bBlue),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Aya: ${getAyaCount(value)}",
                        style: TextStyle(color: text),
                      ),
                      Text(
                        "Place of Revelation: ${getPlaceOfRevelation(1)}",
                        style: TextStyle(color: text),
                      ),
                    ],
                  ),
                  height: 70,
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  //padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  height: 1000,
                  color: bBlue,
                  child: Expanded(
                    child: ListView.builder(
                        itemCount: getAyaCount(value),
                        itemBuilder: (context, x) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            decoration: BoxDecoration(
                                color: fBlue,
                                border: Border.all(color: borderColor),
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              "${getVerse(value, x + 1)}",
                              textAlign: TextAlign.right,
                              style: TextStyle(color: text, fontSize: 25),
                            ),
                          );
                        }),
                  ))
            ],
          ),
        ));
  }
}
