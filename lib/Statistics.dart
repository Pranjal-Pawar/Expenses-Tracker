import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class StatisticsPage extends StatelessWidget {

  Map<String, double> dataMap = {
    "Food": 5,
    "Transfer": 3,
    "Transportation": 2,
    "Education": 2,
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
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
          type(context, dataMap,"Today's"),
          type(context, dataMap,"This Month's"),
          type(context, dataMap,"This Year's"),
          type(context, dataMap,"Overall"),

        ],

        ),
      ),
    );
  }
}
Widget type(BuildContext context, Map<String, double> dataMap,String text){
  return PieChart(
    dataMap: dataMap,
    animationDuration: Duration(milliseconds: 800),
    chartLegendSpacing: 52,
    chartRadius: MediaQuery.of(context).size.width / 1.5,
    // colorList: colorList,
    initialAngleInDegree: 0,
    chartType: ChartType.ring,
    ringStrokeWidth: 75,
    centerText: "${text}\n \$ 2500",
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
  );
}
