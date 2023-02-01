import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {

  final TextEditingController _explain= TextEditingController();
  final TextEditingController _amount=TextEditingController();

  final FirebaseAuth _auth=FirebaseAuth.instance;
  final CollectionReference _firestore=FirebaseFirestore.instance.collection("users");

  DateTime date = new DateTime.now();
  String? selctedItem;
  String? selctedItemi;
  final TextEditingController expalin_C = TextEditingController();
  FocusNode ex = FocusNode();
  final TextEditingController amount_c = TextEditingController();
  FocusNode amount_ = FocusNode();
  final List<String> _item = [
    'Food',
    "Transfer",
    "Transportation",
    "Education"
  ];
  final List<String> _itemei = [
    'Income',
    "Expand",
  ];
  // String day="${date.day}";
  // String month="${date.month}";
  // String year="${date.year}";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: _firestore.doc(_auth.currentUser!.uid).snapshots(),
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: SafeArea(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  child: Column(
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
                        child: Column(
                          children: [
                            SizedBox(height: 40),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Icon(Icons.arrow_back, color: Colors.white),
                                  ),
                                  Text(
                                    'Adding',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.attach_file_outlined,
                                    color: Colors.transparent,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 120,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: 550,
                    width: 340,
                    child:Column(
                      children: [
                        SizedBox(height: 50),
                            Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Container(
                                   padding: EdgeInsets.symmetric(horizontal: 15),
                                    width: 300,
                                    decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                   border: Border.all(
                                    width: 2,
                                 color: Color(0xffC5C5C5),
                                   )
                                    ),
                                    child: DropdownButton<String>(
                                       value: selctedItem,
                                      onChanged: ((value) {
                                      setState(() {
                                      selctedItem = value!;
                                      });
                                      }),
                                    items: _item
                                     .map((e) => DropdownMenuItem(
                                    child: Container(
                                     alignment: Alignment.center,
                                     child: Row(
                                     children: [
                                     Container(
                                     width: 40,
                                      child: Image.asset('Assets/images/${e}.png'),
                                     ),
                                     SizedBox(width: 10),
                                       Text(
                                      e,
                                     style: TextStyle(fontSize: 18),
                                     )
                                          ],
                                        ),
                                         ),
                                        value: e,
                                    ))
                                       .toList(),
                                     selectedItemBuilder: (BuildContext context) => _item
                                       .map((e) => Row(
                                       children: [
                                         Container(
                                          width: 42,
                                          child: Image.asset('Assets/images/${e}.png'),
                                           ),
                                          SizedBox(width: 5),
                                           Text(e)
                                        ],
                                       ))
                                        .toList(),
                                      hint: Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: Text(
                                       'Name',
                                      style: TextStyle(color: Colors.grey),
                                       ),
                                       ),
                                     dropdownColor: Colors.white,
                                       isExpanded: true,
                                         underline: Container(),
                                        ),
                                        ),
                                       ),
                        SizedBox(height: 30),
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 20),
                             child: TextField(
                                 focusNode: ex,
                                controller: _explain,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                           labelText: 'explain',
                               labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
                           enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10),
                             borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
                            focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                             borderSide: BorderSide(width: 2, color: Color(0xff368983))),
        ),
        ),
        ),
                        SizedBox(height: 30),
                           Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: TextField(
                                       keyboardType: TextInputType.number,
                                           focusNode: amount_,
                                             controller: _amount,
                                      decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                  labelText: 'amount',
                                     labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
                                   enabledBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10),
                             borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
                                 focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(width: 2, color: Color(0xff368983))),
                                ),
                               ),
                             ),
                            SizedBox(height: 30),
                            Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 15),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    width: 300,
                                   decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                    width: 2,
                                    color: Color(0xffC5C5C5),
                                    ),
                                    ),
                                    child: DropdownButton<String>(
                                    value: selctedItemi,
                                     onChanged: ((value) {
                                     setState(() {
                                       selctedItemi = value!;
                                     });
                                     }),
                                     items: _itemei
                                     .map((e) => DropdownMenuItem(
                                      child: Container(
                                      alignment: Alignment.center,
                                       child: Row(
                                      children: [
                                      Text(
                                        e,
                                       style: TextStyle(fontSize: 18),
                                      )
                                     ],
                                     ),
                                    ),
                                      value: e,
                                     ))
                                      .toList(),
                                      selectedItemBuilder: (BuildContext context) => _itemei
                                     .map((e) => Row(
                                       children: [Text(e)],
                                      ))
                                       .toList(),
                                     hint: Padding(
                                       padding: const EdgeInsets.only(top: 12),
                                       child: Text(
                                         'How',
                                        style: TextStyle(color: Colors.grey),
                                        ),
                                        ),
                                      dropdownColor: Colors.white,
                                      isExpanded: true,
                                          underline: Container(),
                                    ),
                                    ),
                                    ),
                                  SizedBox(height: 30),
                            Container(
                                 alignment: Alignment.bottomLeft,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 2, color: Color(0xffC5C5C5))),
                                  width: 300,
                                  child: TextButton(
                                   onPressed: () async {
                                     DateTime? newDate = await showDatePicker(
                                    context: context,
                                   initialDate: date,
                                     firstDate: DateTime(2020),
                                    lastDate: DateTime(2100));
                                      if (newDate == Null) return;
                                      setState(() {
                                       date = newDate!;
                                          });
                                       },
                                    child: Text(
                                      'Date : ${date.year} / ${date.day} / ${date.month}',
                                   style: TextStyle(
                                    fontSize: 15,
                                   color: Colors.black,
                                    ),
                                    ),
                                  ),
                                ),
                                   Spacer(),
                           GestureDetector(
                               onTap: ()async {
                                 if(selctedItem.toString().isNotEmpty&&selctedItemi.toString().isNotEmpty&&_explain.text.isNotEmpty&&
                                 _amount.text.isNotEmpty&&date.toString().isNotEmpty){
                                   Map<String,dynamic>map={
                                     "name":selctedItem,
                                     "explain":_explain.text,
                                     "amount":_amount.text,
                                     "type":selctedItemi,
                                     "day":date.day,
                                     "month":date.month,
                                     "year":date.year
                                   };
                                   _firestore
                                       .doc(_auth.currentUser!.uid)
                                       .collection('info')
                                       .doc().set(map);

                                   Navigator.of(context).pop();
                                 }


                               },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xff368983),
                                ),
                                 width: 120,
                                height: 50,
                                     child: Text(
                                   'Save',
                              style: TextStyle(
                              fontFamily: 'f',
                                fontWeight: FontWeight.w600,
                               color: Colors.white,
                              fontSize: 17,
                               ),
                                ),
                              ),
                              ),
                              SizedBox(height: 25),
                      ],
                    ) ,
                  ),
                )

              ],
            ),
          ),
        );
      }
    );
  }
}
