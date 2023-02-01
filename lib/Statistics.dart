import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
int totald = 0;

int totalm = 0;

int totaly = 0;

int totalo = 0;

Map<String, double> dataMapd = {
  "Food": 0,
  "Transfer": 0,
  "Transportation": 0,
  "Education": 0,
};

Map<String, double> dataMapm = {
  "Food": 0,
  "Transfer": 0,
  "Transportation": 0,
  "Education": 0,
};
Map<String, double> dataMapy = {
  "Food": 0,
  "Transfer": 0,
  "Transportation": 0,
  "Education": 0,
};
Map<String, double> dataMapo = {
  "Food": 0,
  "Transfer": 0,
  "Transportation": 0,
  "Education": 0,
};
class StatisticsPage extends StatefulWidget {
  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  final FirebaseAuth _auth=FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    final  _firestore1= FirebaseFirestore.instance.collection("users").doc(_auth.currentUser!.uid).collection('info').snapshots();
    Stream<QuerySnapshot<Map<String, dynamic>>> listmap = _firestore1 as Stream<QuerySnapshot<Map<String,dynamic>>>;
    // dataMapd = {
    //   "Food": 0,
    //   "Transfer": 0,
    //   "Transportation": 0,
    //   "Education": 0,
    // };
    // dataMapm = {
    //   "Food": 0,
    //   "Transfer": 0,
    //   "Transportation": 0,
    //   "Education": 0,
    // };
    // dataMapy = {
    //   "Food": 0,
    //   "Transfer": 0,
    //   "Transportation": 0,
    //   "Education": 0,
    // };
    // dataMapo = {
    //   "Food": 0,
    //   "Transfer": 0,
    //   "Transportation": 0,
    //   "Education": 0,
    // };


    listmap.forEach((element) {
      totald = 0;
      totalm = 0;
      totaly = 0;
      totalo = 0;
      QuerySnapshot<Map<String, dynamic>> qm = element as QuerySnapshot<Map<String, dynamic>>;
      print("Tushar" + qm.size.toString());
      List<QueryDocumentSnapshot> qmap = qm.docs as List<QueryDocumentSnapshot>;


      qmap.forEach((element) {
        print("PranjalTS" + element['type'] + element['amount']);
        int amount = 0;
        String type = element['type'];
        if(type=="Expand")
          amount = int.parse(element['amount']);

        totalo += amount;

        var day = new DateTime.now().day;
        var month = new DateTime.now().month;
        var year = new DateTime.now().year;
        if(element['day']==day){
          totald += amount;
          dataMapd[element['name']] = dataMapd[element['name']]! + amount;
          print("Mighty Raju");
          print(dataMapd[element['name']]);
        }

        if(element['month']==month){
          totalm += amount;
          dataMapm[element['name']] = dataMapm[element['name']]! +amount;
          print("Mighty Raju");
          print(dataMapm[element['name']]);
        }

        if(element['year']==year){
          totaly += amount;
          dataMapy[element['name']] = dataMapy[element['name']]! +amount;
          print("Mighty Raju");
          print(dataMapy[element['name']]);
        }
        dataMapo[element['name']] = dataMapo[element['name']]! +amount;

      });

    }
    );
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,

          backgroundColor: Color.fromARGB(255,250,250,250),
          title: Center(child: Text('Statistics',style: TextStyle(fontSize:23,color:Color.fromARGB(255,12,12,12)),),

          ),
          bottom:  TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Color.fromARGB(255,12,12,12),
            padding: EdgeInsets.symmetric(horizontal: 8),
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Creates border
                color: Color(0xff368983),

              ),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,color: Color.fromARGB(0,12,12,12)),
          // indicatorColor: Colors.black,
          tabs: [
            Tab(text: "Daily"),
            Tab(text: "Monthly"),
            Tab(text: "Yearly"),
            Tab(text: "Overall"),
          ]),
        ),
        body: TabBarView(children: <Widget>[
          // type(context, dataMapd,"Today's",totald),
          // type(context, dataMapm,"This Month's",totalm),
          // type(context, dataMapy,"This Year's",totaly),
          // type(context, dataMapo,"Overall",totalo),
          PieChart(
            dataMap: dataMapd,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 52,
            chartRadius: MediaQuery.of(context).size.width / 1.5,
            // colorList: colorList,
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 75,
            centerText: "Today's\n ₹ ${totald}",
            baseChartColor: Color.fromARGB(255,250,250,250),
            centerTextStyle: TextStyle(
                fontSize: 28,
                color: Color(0xff368983),
                backgroundColor: Color.fromARGB(255,250,250,250),
                decorationColor: Color.fromARGB(255,250,250,250)
            ),
            legendOptions: LegendOptions(
              showLegendsInRow: true,

              legendPosition: LegendPosition.bottom,
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: false,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: true,
                decimalPlaces: 1,
                chartValueBackgroundColor: Color.fromARGB(255,250,250,250),
                chartValueStyle: TextStyle(fontSize: 17,
                  color: Color(0xff368983),
                )
            ),
          ),
          PieChart(
            dataMap: dataMapm,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 52,
            chartRadius: MediaQuery.of(context).size.width / 1.5,
            // colorList: colorList,
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 75,
            centerText: "This Month's\n ₹ ${totalm}",
            baseChartColor: Color.fromARGB(255,250,250,250),
            centerTextStyle: TextStyle(
                fontSize: 28,
                color: Color(0xff368983),
                backgroundColor: Color.fromARGB(255,250,250,250),
                decorationColor: Color.fromARGB(255,250,250,250)
            ),
            legendOptions: LegendOptions(
              showLegendsInRow: true,

              legendPosition: LegendPosition.bottom,
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: false,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: true,
                decimalPlaces: 1,
                chartValueBackgroundColor: Color.fromARGB(255,250,250,250),
                chartValueStyle: TextStyle(fontSize: 17,
                  color: Color(0xff368983),
                )
            ),
          ),
          PieChart(
            dataMap: dataMapy,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 52,
            chartRadius: MediaQuery.of(context).size.width / 1.5,
            // colorList: colorList,
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 75,
            centerText: "This Year's\n ₹ ${totaly}",
            baseChartColor: Color.fromARGB(255,250,250,250),
            centerTextStyle: TextStyle(
                fontSize: 28,
                color: Color(0xff368983),
                backgroundColor: Color.fromARGB(255,250,250,250),
                decorationColor: Color.fromARGB(255,250,250,250)
            ),
            legendOptions: LegendOptions(
              showLegendsInRow: true,

              legendPosition: LegendPosition.bottom,
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: false,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: true,
                decimalPlaces: 1,
                chartValueBackgroundColor: Color.fromARGB(255,250,250,250),
                chartValueStyle: TextStyle(fontSize: 17,
                  color: Color(0xff368983),
                )
            ),
          ),
          PieChart(
            dataMap: dataMapo,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 52,
            chartRadius: MediaQuery.of(context).size.width / 1.5,
            // colorList: colorList,
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 75,
            centerText: "Overall\n ₹ ${totalo}",
            baseChartColor: Color.fromARGB(255,250,250,250),
            centerTextStyle: TextStyle(
                fontSize: 28,
                color: Color(0xff368983),
                backgroundColor: Color.fromARGB(255,250,250,250),
                decorationColor: Color.fromARGB(255,250,250,250)
            ),
            legendOptions: LegendOptions(
              showLegendsInRow: true,

              legendPosition: LegendPosition.bottom,
              showLegends: true,
              legendShape: BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: false,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: true,
                decimalPlaces: 1,
                chartValueBackgroundColor: Color.fromARGB(255,250,250,250),
                chartValueStyle: TextStyle(fontSize: 17,
                  color: Color(0xff368983),
                )
            ),
          ),

        ],

        ),
      ),
    );
  }
}
// Widget type(BuildContext context, Map<String, double> dataMap,String text,int total){
//
//   return PieChart(
//     dataMap: dataMap,
//     animationDuration: Duration(milliseconds: 800),
//     chartLegendSpacing: 52,
//     chartRadius: MediaQuery.of(context).size.width / 1.5,
//     // colorList: colorList,
//     initialAngleInDegree: 0,
//     chartType: ChartType.ring,
//     ringStrokeWidth: 75,
//     centerText: "${text}\n ₹ ${total}",
//     baseChartColor: Color.fromARGB(255,250,250,250),
//     centerTextStyle: TextStyle(
//         fontSize: 28,
//         color: Color(0xff368983),
//         backgroundColor: Color.fromARGB(255,250,250,250),
//         decorationColor: Color.fromARGB(255,250,250,250)
//     ),
//     legendOptions: LegendOptions(
//       showLegendsInRow: true,
//
//       legendPosition: LegendPosition.bottom,
//       showLegends: true,
//       legendShape: BoxShape.circle,
//       legendTextStyle: TextStyle(
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     chartValuesOptions: ChartValuesOptions(
//         showChartValueBackground: false,
//         showChartValues: true,
//         showChartValuesInPercentage: true,
//         showChartValuesOutside: true,
//         decimalPlaces: 1,
//         chartValueBackgroundColor: Color.fromARGB(255,250,250,250),
//         chartValueStyle: TextStyle(fontSize: 17,
//           color: Color(0xff368983),
//         )
//     ),
//   );
// }
