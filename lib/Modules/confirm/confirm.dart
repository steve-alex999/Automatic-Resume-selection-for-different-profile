import 'dart:core';
import 'dart:convert';
import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:resue/Modules/Home/Components/app_bar.dart';
import 'package:resue/Modules/User_details/user_details.dart';
import 'package:file_picker/file_picker.dart';
import 'package:resue/Modules/confirm/confirm.dart';
import 'package:resue/Modules/listofavilablejobs/Available_jobs.dart';
import 'package:resue/Modules/result/result.dart';
import 'package:resue/components/rounded_button.dart';
import 'package:resue/components/text_field_container.dart';
import 'package:resue/components/variable.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';


Uint8List uploadedImage;
var list_name = [];



class confirm extends StatefulWidget {
  @override
  _confirm createState() => _confirm();
}

class _confirm extends State<confirm> {
  //var now = new DateTime.now();
  final List<String> items = ["1", "2", "Third", "4"];

  //final List<String> items=[];

  //MyApp({Key key, @required this.items}) : super(key: key);

  //@override
  Widget build(BuildContext context) {
    final title = 'Confirm';
    var curr_doc;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: Scaffold(

            body:Center(child:Container(

                decoration: BoxDecoration(
                  image: DecorationImage(

                    image: AssetImage("assets/drop.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),



                child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(flex:15,child:CustomAppBar()),
                      Expanded(flex:10,child:Text("Job Details",style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: 40),


                      ),
                      ),
                      Expanded(flex:60,child:
                      TextFieldContainer(
                        child:RichText(
                          text:TextSpan(

                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.green
                                // insert your font size here
                              ),
                              children: <TextSpan>[

                                TextSpan(text:job_summary)
                              ]
                          ),
                        ),
                      ),
                      ),
                      RoundedButton(

                        text:'Apply',

                        color: Colors.green,
                        press: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  List_of_Ajobs()));
                          print(jobid);
                          print(client_id);
                          var url =
                          Uri.parse(
                              'https://us-central1-resume-b5075.cloudfunctions.net/user1?name='+jobid+'|'+client_id+'|'+FirebaseAuth.instance.currentUser.email);
// Await the http get response, then decode the json-formatted response.
                          var response = await http.post(url,headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                          },
                            body: jsonEncode(<String, String>{
                              'title':  "",
                            }),);
                          if (response.statusCode == 200) {
                            var jsonResponse = convert.jsonDecode(response.body);
                            var itemCount = jsonResponse['totalItems'];
                            print('Number of books about http: $itemCount.');
                          } else {
                            print('Request failed with status: ${response.statusCode}.');
                          }

                          //Send to API
                        },
                      ),
                    ]
                )
            )
            )



        )
    );
  }
}
