import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
// import '../view/covid_view.dart';
import '../../../services/base.dart';
import 'package:intl/intl.dart';
// import 'package:equatable/equatable.dart';

// part 'covid_state.dart';

/// {@template counter_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}

class CovidCubit extends Cubit<int> {
  /// {@macro counter_cubit}
  CovidCubit() : super(0);

  int confirmed = 0;
  int recovered = 0;
  int hospitalized = 0;
  int deaths = 0;
  int newConfirmed = 0;
  int newRecovered = 0;
  int newHospitalized = 0;
  int newDeaths = 0;
  DateTime updateDate = DateTime.now();

  Future getCovidData() async {
    NetworkHelper networkHelper = NetworkHelper();
    await networkHelper.getData().then((data) {
      this.confirmed = data['Confirmed'];
      this.recovered = data['Recovered'];
      this.hospitalized = data['Hospitalized'];
      this.deaths = data['Deaths'];
      this.newConfirmed = data['NewConfirmed'];
      this.newRecovered = data['NewRecovered'];
      this.newHospitalized = data['NewHospitalized'];
      this.newDeaths = data['NewDeaths'];
      this.updateDate = DateFormat('d/M/yy h:m').parse(data['UpdateDate']);
      // print(data);
      // return data;
    });
    emit(state);
    // print(state);
  }

  void refreshAction() {
    // context.read<_MyHomePageState>()
    getCovidData().then((value) => {
          Fluttertoast.showToast(
              msg: "Data Updated",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey[600],
              textColor: Colors.white,
              fontSize: 16.0),
          emit(state)
        });
  }
}
