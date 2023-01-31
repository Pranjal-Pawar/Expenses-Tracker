import 'package:expense_tracker/Authentication/SignUp.dart';
import 'package:expense_tracker/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../BottomBar.dart';
class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: (){
            },
        ),
        title: Center(
          child: Text(
            "Expense Tracker",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          Container(
            child: IconButton(
                onPressed: () {
                },
                icon: Icon(
                  Icons.logout,
                  color: Color.fromARGB(255,54,137,131),
                )),
          )
        ],
        elevation: 0,
        backgroundColor: Color.fromARGB(255,54,137,131),
      ) ,
      body:Padding(
        padding: EdgeInsets.all(15.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: Container(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "Assets/images/login.png",
                        fit: BoxFit.fitHeight,
                        height: 146,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                      width: 25,
                    ),

                    TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255,54,137,131),),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255,54,137,131),),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        hintText: "Enter email",
                        prefixIcon:Icon(
                          CupertinoIcons.mail_solid,
                          color: Color.fromARGB(255,54,137,131),
                        ),
                        labelText: "Email",
                      ),
                    ),
                    SizedBox(
                      height: 25,
                      width: 25,
                    ),
                    TextField(

                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255,54,137,131),),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255,54,137,131),),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        hintText: "Enter password",
                        prefixIcon:Icon(
                          CupertinoIcons.padlock_solid,
                          color:Color.fromARGB(255,54,137,131),
                        ),
                        labelText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: 25,
                      width: 25,
                    ),
                    ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255,54,137,131),
                        onPrimary:Colors.white,
                        minimumSize: Size(100, 40),
                      ),
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bottom()));
                      },
                      child:Text('Login'),
                    ),
                    SizedBox(
                      height: 25,
                      width: 25,
                    ),
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        GestureDetector(
                            onTap: () {
                             Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
                              },
                            child: Container(
                                alignment: Alignment.center,
                                child: Text("Sign Up",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromARGB(255,54,137,131),
                                        fontWeight: FontWeight.bold)))),
                      ],
                    ),


                  ],
                ),


              ),
            ),
          ),
        ),
      ),

    );
  }
}
