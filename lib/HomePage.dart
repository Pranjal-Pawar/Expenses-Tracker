import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/History.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Authentication/Methods.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final CollectionReference _firestore= FirebaseFirestore.instance.collection("users");
  int income = 0;
  int expense = 0;
  int total = 0;
  @override
  Widget build(BuildContext context) {
    final  _firestore1= FirebaseFirestore.instance.collection("users").doc(_auth.currentUser!.uid).collection('info').snapshots();
    Stream<QuerySnapshot<Map<String, dynamic>>> listmap = _firestore1 as Stream<QuerySnapshot<Map<String,dynamic>>>;

    listmap.forEach((element) {
      QuerySnapshot<Map<String, dynamic>> qm = element as QuerySnapshot<Map<String, dynamic>>;
      print(qm.size.toString());
      List<QueryDocumentSnapshot> qmap = qm.docs as List<QueryDocumentSnapshot>;
      income=0;
      expense=0;
      total=0;

      qmap.forEach((element) {
        print( element['type'] + element['amount']);
        int amount = int.parse(element['amount']);
        String type = element['type'];

        if(type=="Income"){
          income += amount;
        }
        else {
          expense += amount;
        }
      });
      total = income-expense;
      print(income.toString() + " " + expense.toString() + " " + total.toString());

    });
    return Scaffold(
      backgroundColor: Color.fromARGB(255,250,250,250),
        body: StreamBuilder<QuerySnapshot>(
            stream: _firestore
            .doc(_auth.currentUser!.uid)
            .collection('info')
            .snapshots(),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
            if(!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 350,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 240,
                                decoration: BoxDecoration(
                                  color: Color(0xff368983),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 20,
                                      left: 330,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(7),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          color: Color.fromRGBO(250, 250, 250, 0.1),
                                          child: IconButton(
                                            onPressed:(){
                                              LogOut(context);
                                            },
                                            icon:Icon(
                                              Icons.logout_sharp,
                                              size: 28,
                                              color: Colors.white,
                                            ),
                                          )
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20, left: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Hello!!!",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: Color.fromARGB(255, 224, 223, 223),
                                            ),
                                          ),
                                          Text(
                                            _auth.currentUser!.displayName.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 140,
                            left: 37,
                            child: Container(
                              height: 170,
                              width: 315,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(47, 125, 121, 0.3),
                                    offset: Offset(0, 6),
                                    blurRadius: 12,
                                    spreadRadius: 6,
                                  ),
                                ],
                                color: Color.fromARGB(255, 47, 125, 121),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total Balance',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Icon(
                                          Icons.more_horiz,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 7),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          "₹" + total.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 13,
                                              backgroundColor: Color.fromARGB(
                                                  255, 85, 145, 141),
                                              child: Icon(
                                                Icons.arrow_downward,
                                                color: Colors.white,
                                                size: 19,
                                              ),
                                            ),
                                            SizedBox(width: 7),
                                            Text(
                                              'Income',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: Color.fromARGB(255, 216, 216, 216),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 13,
                                              backgroundColor: Color.fromARGB(
                                                  255, 85, 145, 141),
                                              child: Icon(
                                                Icons.arrow_upward,
                                                color: Colors.white,
                                                size: 19,
                                              ),
                                            ),
                                            SizedBox(width: 7),
                                            Text(
                                              'Expenses',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: Color.fromARGB(255, 216, 216, 216),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "+₹" + income.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "-₹" + expense.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:17,right: 13),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Transactions History',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19,
                                  color: Colors.black,
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (_) => History()));
                                },
                                child: Text(
                                  'See all',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 340,
                          child: StreamBuilder<QuerySnapshot>(
                            stream: _firestore
                              .doc(_auth.currentUser!.uid)
                              .collection('info')
                              .snapshots(),
                            builder:
                                (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
                              if(!snapshot.hasData)
                                return Center(child: CircularProgressIndicator());
                                 return ListView.builder(
                                itemCount: 3,
                                  itemBuilder: (context,index){
                                    Map<String,dynamic> _map=snapshot.data!.docs[index]
                                        .data() as Map<String,dynamic>;
                                    return ListTile(
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: (_map['name']=="Food")?Image.asset('Assets/images/Food.png', height: 40)
                                         : ((_map['name']=="Transfer")?Image.asset('Assets/images/Transfer.png')
                                            :((_map['name']=="Education")?Image.asset('Assets/images/Education.png')
                                            :Image.asset('Assets/images/Transportation.png'))),
                                      ),
                                      title: Text(
                                        _map['name'],
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      subtitle: Text(
                                        _map['day'].toString()+"-"+_map['month'].toString()+"-"+_map['year'].toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      trailing: Text(
                                        (_map['type']=='Income'?'+':'-')+"₹"+_map['amount'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 19,
                                          color:(_map['type']=='Income'?Colors.green:Colors.red),
                                        ),
                                      ),
                                    );
                                  }
                              );
                            }
                          ),
                        )
                      ],
                    )
                  ],
                )
            );
          }
        )
    );
  }
}
