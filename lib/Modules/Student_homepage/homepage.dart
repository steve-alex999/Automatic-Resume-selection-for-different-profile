import 'package:flutter/material.dart';
import 'package:resue/Modules/Login/login_screen.dart';
import 'package:resue/Modules/applied_jobs/Applied_jobs.dart';
import 'package:resue/Modules/client/client_details.dart';
import 'package:resue/Modules/listofjobs/listofjobs.dart';

class SimpleAppBarPage extends StatefulWidget {
  @override
  _SimpleAppBarPageState createState() => _SimpleAppBarPageState();
}

class _SimpleAppBarPageState extends State<SimpleAppBarPage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(

        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red],
            ),
          ),
        ),
        bottom: TabBar(
          //isScrollable: true,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          tabs: [
            Tab(icon: Icon(Icons.home), text: 'Add Job'),
            Tab(icon: Icon(Icons.star), text: 'List of Posted Jobs'),
            Tab(icon: Icon(Icons.star), text: 'Applied Jobs')

          ],
        ),
        elevation: 20,
        titleSpacing: 5,
      ),
      body: TabBarView(
        children: [
          MybApp(),
          List_of_jobs(),
          List_of_Appjobs()

        ],
      ),
    ),
  );

  Widget buildPage(String text) => Center(
    child: Text(
      text,
      style: TextStyle(fontSize: 28),
    ),
  );
}