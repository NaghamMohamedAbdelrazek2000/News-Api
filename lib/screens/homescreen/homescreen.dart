
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Political News/Political.dart';
import '../Science/science.dart';
import '../sports/sports.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(text:'Sports', icon:Icon(Icons.sports)),
            Tab(text:'Science',icon:Icon(Icons.science)),
            Tab(text:'Political News',icon:Icon(Icons.policy)),
          ],),
        ),
        body: TabBarView(children: [
          SportsPage(),
        SciencePage(),
          PoliticalNews(),
        ],

        ),
      ),
    );
  }
}
