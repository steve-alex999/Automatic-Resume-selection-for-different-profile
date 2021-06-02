import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resue/Modules/Login/login_screen.dart';
import 'package:resue/Modules/User_details/user_details.dart';
import 'package:resue/Modules/admin_login/login_screen.dart';
import 'package:resue/Modules/applied_jobs/Applied_jobs.dart';
import 'package:resue/Modules/listofavilablejobs/Available_jobs.dart';


import 'menu_item.dart';

class CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height:size.height*0.0001 ,
      width: size.width,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(

        color: Colors.white,
        borderRadius: BorderRadius.circular(46),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 30,
            color: Colors.black.withOpacity(0.16),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[

          SizedBox(height:size.height*0.1,width: 5),

          Spacer(),
          MenuItem(
            title: "Home",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return List_of_Ajobs();
                  },
                ),
              );
            },
          ),

          MenuItem(
            title: "Details",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FormScreen();
                  },
                ),
              );
            },
          ),

          MenuItem(
            title: "Applied Jobs",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return List_of_Appjobs();
                  },
                ),
              );
            },
          ),

          MenuItem(
            title: "Login",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AdminLoginScreen();
                  },
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}
