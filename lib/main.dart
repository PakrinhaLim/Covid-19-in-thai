import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'services/base.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:buddhist_datetime_dateformat/buddhist_datetime_dateformat.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  Intl.defaultLocale = 'th';
  initializeDateFormatting();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var api_url = 'https://covid19.th-stat.com/api/open/today';
  int confirmed;
  int recovered;
  int hospitalized;
  int deaths;
  int newConfirmed;
  int newRecovered;
  int newHospitalized;
  int newDeaths;
  DateTime updateDate;
  Future getCovidData(BuildContext context) async {
    NetworkHelper networkHelper = NetworkHelper();
    await networkHelper.getData(context).then((data) => {
          setState(() {
            this.confirmed = data['Confirmed'];
            this.recovered = data['Recovered'];
            this.hospitalized = data['Hospitalized'];
            this.deaths = data['Deaths'];
            this.newConfirmed = data['NewConfirmed'];
            this.newRecovered = data['NewRecovered'];
            this.newHospitalized = data['NewHospitalized'];
            this.newDeaths = data['NewDeaths'];
            this.updateDate =
                DateFormat('d/M/yy h:m').parse(data['UpdateDate']);
          })
        });
  }

  @override
  void initState() {
    super.initState();
    this.getCovidData(context);
  }

  _refreshAction() {
    // Get.snackbar('Data Updated', '',snackPosition: SnackPosition.TOP,colorText: Colors.white,backgroundColor: Colors.grey[900]); // change MaterialApp to GetMaterialApp
    this.getCovidData(context).then((value) => {
          Fluttertoast.showToast(
              msg: "Data Updated",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey[600],
              textColor: Colors.white,
              fontSize: 16.0)
        });
  }

  @override
  Widget build(BuildContext context) {
    var dformatter = DateFormat('วันที่ d MMM y h:mm', 'th');
    final formatter = new NumberFormat("#,###");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
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
                      new Text(formatter.format(this.confirmed).toString(),
                          style: TextStyle(
                              fontFamily: 'Supermarket',
                              fontSize: 20,
                              color: Colors.white)),
                      SizedBox(height: 10),
                      new Text(
                          '(+ ' +
                              formatter.format(this.newConfirmed).toString() +
                              ' )',
                          style: TextStyle(
                              fontFamily: 'Supermarket',
                              fontSize: 15,
                              color: Colors.white)),
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
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    height: 200,
                    width: 130,
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
                          new Text(formatter.format(this.recovered).toString(),
                              style: TextStyle(
                                  fontFamily: 'Supermarket',
                                  fontSize: 20,
                                  color: Colors.white)),
                          SizedBox(height: 10),
                          new Text(
                              '(+ ' +
                                  formatter
                                      .format(this.newRecovered)
                                      .toString() +
                                  ' )',
                              style: TextStyle(
                                  fontFamily: 'Supermarket',
                                  fontSize: 15,
                                  color: Colors.white)),
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
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    height: 200,
                    width: 130,
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
                          new Text(
                              formatter.format(this.hospitalized).toString(),
                              style: TextStyle(
                                  fontFamily: 'Supermarket',
                                  fontSize: 20,
                                  color: Colors.white)),
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
                    padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                    height: 200,
                    width: 130,
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
                          new Text(formatter.format(this.deaths).toString(),
                              style: TextStyle(
                                  fontFamily: 'Supermarket',
                                  fontSize: 20,
                                  color: Colors.white)),
                          SizedBox(height: 10),
                          new Text(
                              '(+ ' +
                                  formatter.format(this.newDeaths).toString() +
                                  ' )',
                              style: TextStyle(
                                  fontFamily: 'Supermarket',
                                  fontSize: 15,
                                  color: Colors.white)),
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
                            .formatInBuddhistCalendarThai(this.updateDate)
                            .toString(),
                    style: TextStyle(
                      fontFamily: 'Supermarket',
                      fontSize: 15,
                    )),
              ),
              // WillPopScope(child: Text('Data Updated'), onWillPop: () => _refreshAction(context)),
              // Builder(builder: (context) {
              //   return WillPopScope(
              //       child: Text('Data Updated'),
              //       onWillPop: () => _refreshAction(context));
              // })
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _refreshAction,
        tooltip: 'Refresh',
        child: new Icon(Icons.refresh),
      ),
    );
  }
}
