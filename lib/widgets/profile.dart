import 'package:flutter/material.dart';
class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xff368983),
        elevation: 0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: Text(
                  "Profile"
              ),
            ),
            SizedBox(
              width: 92,
            ),
            IconButton(
              onPressed:(){

              },
              icon:Icon(
                Icons.logout_sharp,
                size: 28,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      body:Container(
        color: Color.fromARGB(255, 248,243,247),
        child:Stack(
          children:[
            Stack(
              children: [
                Container(
                  height: size.height/ 3.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight:Radius.circular(70),
                        bottomLeft:Radius.circular(70)
                        ),
                    color:Color(0xff368983),
                  ),
                ),
                // Container(
                //   height: size.height/ 3.6,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(size.width/7.8),
                //     color: Colors.cyan[200],
                //   ),
                // ),
                // Container(
                //   height: size.height/ 3.9,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(size.width/7.8),
                //     color: Colors.cyan[100],
                //   ),
                // ),
                // Container(
                //   height: size.height/ 4.2,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(size.width/7.8),
                //     color: Colors.cyan[50],
                //   ),
                // ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      // backgroundColor: ,
                      backgroundImage: AssetImage("Assets/images/businessman (1).png"),
                      radius: 70,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                    "XYZ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 248,243,247)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.phone_sharp,
                                color: Colors.black,
                              ),
                              Text(
                                ' Phone number',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text(
                           "1234567890",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                          Divider(),
                          Row(
                            children: [
                              Icon(
                                Icons.email_sharp,
                                color: Colors.black,
                              ),
                              Text(
                                ' Email',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text(
                           "a@gmail.com",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                          Divider(),
                          Row(
                            children: [
                              Icon(
                                Icons.addchart_rounded,
                                color: Colors.black,
                              ),
                              Text(
                                ' Address',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text(
                           "Pune",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                            maxLines: 2,
                          ),
                        ],
                      ) ,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
