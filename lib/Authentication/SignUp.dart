import 'package:expense_tracker/Authentication/LogIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../BottomBar.dart';
import 'Methods.dart';


class SignUp extends StatefulWidget {
   SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _name=TextEditingController();
  final TextEditingController _address=TextEditingController();
  final TextEditingController _phoneNo=TextEditingController();
  final TextEditingController _email=TextEditingController();
  final TextEditingController _password=TextEditingController();
  final TextEditingController _confirmPassword=TextEditingController();
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    bool obc_text=true;
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
        body:isLoading
        ?Center(child: Container(child: CircularProgressIndicator()))
            :Center(
               child: SafeArea(
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
                     controller: _name,
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
                         controller: _address,
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
                        controller: _phoneNo,
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
                        controller: _email,
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
                        controller: _password,
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
                        controller: _confirmPassword,
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
                          if(_name.text.isNotEmpty&&
                                _address.text.isNotEmpty&&
                              _phoneNo.text.isNotEmpty&&
                               _email.text.isNotEmpty&&
                             _password.text.isNotEmpty&&
                               _confirmPassword.text.isNotEmpty){
                               setState(() {
                             isLoading=true;
                               });

                       signUp(
                       _name.text,
                       _address.text,
                       _phoneNo.text,
                         _email.text,
                        _password.text,
                         _confirmPassword.text)
                        .then((user){
                        if(user!=null){
                         setState(() {
                         isLoading=false;
                       });
                        Navigator.push(
                        context,
                          MaterialPageRoute(
                         builder:(_)=>Bottom()));
                        }else{
                         setState(() {
                            isLoading=false;
                        });
                       }
                       });
                       }else {
                         print("please fill the form correctly");
                        }
                          },

                          child:Text("SignUp")
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}
