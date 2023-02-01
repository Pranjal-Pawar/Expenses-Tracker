import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class History extends StatefulWidget {

  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final CollectionReference _firestore= FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.grey.shade100,
        // backgroundColor: Color.fromARGB(255,250,250,250),
        title: Center(child: Text('Transection History',
          style: TextStyle(
              fontSize:23,
              color:Color.fromARGB(255,12,12,12)
          ),
        ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:_firestore
          .doc(_auth.currentUser!.uid)
          .collection('info')
          .snapshots(),
        builder:
        (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
              return ListView.builder(
                  itemCount: ((snapshot.data! as QuerySnapshot).docs.length),
                  itemBuilder: (context,index){
                    Map<String,dynamic> _map=snapshot.data!.docs[index]
                        .data() as Map<String,dynamic>;
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: (_map['name']=="Food")?Image.asset('Assets/images/Food.png', height: 40)
                            : ((_map['name']=="Transfer")?Image.asset('Assets/images/Transfer.png'):((_map['name']=="Education")?Image.asset('Assets/images/Education.png'):Image.asset('Assets/images/Transportation.png'))),

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
    );
  }
}
