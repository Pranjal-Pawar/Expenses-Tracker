import 'package:expense_tracker/Authentication/LogIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../BottomBar.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LogIn()));
              }
          ),
          title: Center(
              child: Text(
                "Expense Tracker",
                style: TextStyle(color: Colors.white),
              )),
          actions: [
            Container(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.logout,
                    color:Color.fromARGB(255,54,137,131),
                  )),
            )
          ],
          backgroundColor: Color.fromARGB(255,54,137,131),
        ),
        body:SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Container(
                  padding: EdgeInsets.all(1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "Assets/images/login.png",
                          fit: BoxFit.fitHeight,
                          height: 134,
                        ),
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
                          hintText: "Enter name",
                          prefixIcon: Icon(
                            CupertinoIcons.person_solid,
                            color:Color.fromARGB(255,54,137,131),
                          ),
                          labelText: "Name",
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                          hintText: "Enter Address",
                          prefixIcon: Icon(
                            Icons.add_chart_sharp,
                            color:Color.fromARGB(255,54,137,131),
                          ),
                          labelText: "Address",
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 20,
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
                          hintText: "Enter mobile number",
                          prefixIcon: Icon(
                            CupertinoIcons.phone_solid,
                            color:Color.fromARGB(255,54,137,131),
                          ),
                          labelText: "Mobile",
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                          prefixIcon: Icon(
                            CupertinoIcons.mail_solid,
                            color:Color.fromARGB(255,54,137,131),
                          ),
                          labelText: "Email",
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                          hintText: "Enter passwaord",
                          prefixIcon: Icon(
                            CupertinoIcons.padlock_solid,
                            color:Color.fromARGB(255,54,137,131),
                          ),
                          labelText:"Password",
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                          hintText: "rewrite password",
                          prefixIcon: Icon(
                            CupertinoIcons.lock_circle,
                            color:Color.fromARGB(255,54,137,131),
                          ),
                          labelText: "Confirmed Password",
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        width: 25,
                      ),
                      ElevatedButton(
                          style:ElevatedButton.styleFrom(
                            primary:Color.fromARGB(255,54,137,131),
                            onPrimary: Colors.white,
                            minimumSize: Size(100,40),
                          ),
                          onPressed:(){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bottom()));
                          },
                          child:Text("SignUp")
                      ),
                    ],

                  ),

                ),
              ),
            ),
          ),
        );

  }
}
