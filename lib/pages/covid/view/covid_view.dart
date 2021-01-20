import 'package:covid_19_thai/pages/covid/covid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:buddhist_datetime_dateformat/buddhist_datetime_dateformat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../services/base.dart';

class CovidView extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'รายงานโควิด-19 ประจำวัน'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    var dformatter = DateFormat('วันที่ d MMM y h:mm', 'th');
    final formatter = new NumberFormat("#,###");
    context.watch<CovidCubit>().getCovidData();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.title,
          style: TextStyle(fontFamily: 'supermarket'),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              // cases -------------------------------
              Container(
                // padding: EdgeInsets.symmetric(horizontalห: 16.0, vertical: 24.0),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                height: 200,
                width: double.maxFinite,
                // height: MediaQuery.of(context).size.height * 0.35,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // const ListTile(
                      //   title: Text('Cases'),
                      //   subtitle: Text('11,262'),
                      // ),
                      new Text('ติดเชื้อสะสม',
                          style: TextStyle(
                              fontFamily: 'supermarket',
                              fontSize: 25,
                              color: Colors.white)),
                      SizedBox(height: 10),
                      new BlocBuilder<CovidCubit, int>(
                          builder: (context, state) {
                        // Future.delayed(const Duration(milliseconds: 10), () {
                        //   context.read<CovidCubit>().getCovidData();
                        return Text(
                            formatter
                                .format(context.watch<CovidCubit>().confirmed)
                                .toString(),
                            style: TextStyle(
                                fontFamily: 'Supermarket',
                                fontSize: 20,
                                color: Colors.white));
                      }),
                      SizedBox(height: 10),
                      new BlocBuilder<CovidCubit, int>(
                          builder: (context, state) {
                        // Future.delayed(const Duration(milliseconds: 10), () {
                        //   context.read<CovidCubit>().getCovidData();
                        return Text(
                            '(+ ' +
                                formatter
                                    .format(context
                                        .watch<CovidCubit>()
                                        .newConfirmed)
                                    .toString() +
                                ' )',
                            style: TextStyle(
                                fontFamily: 'Supermarket',
                                fontSize: 15,
                                color: Colors.white));
                      }),
                    ],
                  ),
                  color: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 8,
                ),
              ),
              // cases -------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Recovered -------------------------------
                  Container(
                    // (start,top,end,bottom)
                    padding: EdgeInsets.fromLTRB(10, 10, 5, 0),
                    height: 200,
                    width: MediaQuery.of(context).size.width / 3,
                    // width: double.maxFinite,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          new Text('หายแล้ว',
                              style: TextStyle(
                                  fontFamily: 'Supermarket',
                                  fontSize: 25,
                                  color: Colors.white)),
                          SizedBox(height: 10),
                          new BlocBuilder<CovidCubit, int>(
                              builder: (context, state) {
                            // Future.delayed(const Duration(milliseconds: 10), () {
                            //   context.read<CovidCubit>().getCovidData();
                            return Text(
                                formatter
                                    .format(
                                        context.watch<CovidCubit>().recovered)
                                    .toString(),
                                style: TextStyle(
                                    fontFamily: 'Supermarket',
                                    fontSize: 20,
                                    color: Colors.white));
                          }),
                          SizedBox(height: 10),
                          new BlocBuilder<CovidCubit, int>(
                              builder: (context, state) {
                            // Future.delayed(const Duration(milliseconds: 10), () {
                            //   context.read<CovidCubit>().getCovidData();
                            return Text(
                                '(+ ' +
                                    formatter
                                        .format(context
                                            .watch<CovidCubit>()
                                            .newRecovered)
                                        .toString() +
                                    ' )',
                                style: TextStyle(
                                    fontFamily: 'Supermarket',
                                    fontSize: 15,
                                    color: Colors.white));
                          }),
                        ],
                      ),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 8,
                    ),
                  ),
                  // recovered -------------------------------
                  // Hospitalize -------------------------------
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                    height: 200,
                    width: MediaQuery.of(context).size.width / 3,
                    // width: 130,
                    // width: double.maxFinite,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          new Text('รักษาอยู่',
                              style: TextStyle(
                                  fontFamily: 'Supermarket',
                                  fontSize: 25,
                                  color: Colors.white)),
                          SizedBox(height: 10),
                          new BlocBuilder<CovidCubit, int>(
                              builder: (context, state) {
                            // Future.delayed(const Duration(milliseconds: 10), () {
                            //   context.read<CovidCubit>().getCovidData();
                            return Text(
                                formatter
                                    .format(context
                                        .watch<CovidCubit>()
                                        .hospitalized)
                                    .toString(),
                                style: TextStyle(
                                    fontFamily: 'Supermarket',
                                    fontSize: 20,
                                    color: Colors.white));
                          }),
                          SizedBox(height: 10),
                        ],
                      ),
                      color: Colors.cyan,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 8,
                    ),
                  ),
                  // Hospitalize -------------------------------
                  // Died -------------------------------
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 10, 10, 0),
                    height: 200,
                    width: MediaQuery.of(context).size.width / 3,
                    // width: double.maxFinite,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          new Text('เสียชีวิต',
                              style: TextStyle(
                                  fontFamily: 'Supermarket',
                                  fontSize: 25,
                                  color: Colors.white)),
                          SizedBox(height: 10),
                          new BlocBuilder<CovidCubit, int>(
                              builder: (context, state) {
                            // Future.delayed(const Duration(milliseconds: 10), () {
                            //   context.read<CovidCubit>().getCovidData();
                            return Text(
                                formatter
                                    .format(context.watch<CovidCubit>().deaths)
                                    .toString(),
                                style: TextStyle(
                                    fontFamily: 'Supermarket',
                                    fontSize: 20,
                                    color: Colors.white));
                          }),
                          SizedBox(height: 10),
                          new BlocBuilder<CovidCubit, int>(
                              builder: (context, state) {
                            // Future.delayed(const Duration(milliseconds: 10), () {
                            //   context.read<CovidCubit>().getCovidData();
                            return Text(
                                '(+ ' +
                                    formatter
                                        .format(context
                                            .watch<CovidCubit>()
                                            .newDeaths)
                                        .toString() +
                                    ' )',
                                style: TextStyle(
                                    fontFamily: 'Supermarket',
                                    fontSize: 15,
                                    color: Colors.white));
                          }),
                        ],
                      ),
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 8,
                    ),
                  ),
                  // Died -------------------------------
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 30, 10, 0),
                child: Text(
                    'อัพเดท: ' +
                        dformatter
                            .formatInBuddhistCalendarThai(
                                context.watch<CovidCubit>().updateDate)
                            .toString(),
                    style: TextStyle(
                      fontFamily: 'Supermarket',
                      fontSize: 15,
                    )),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => context.read<CovidCubit>().refreshAction(),
        tooltip: 'Refresh',
        child: new Icon(Icons.refresh),
      ),
    );
  }
}
