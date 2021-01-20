import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'app.dart';

void main() {
  Intl.defaultLocale = 'th';
  initializeDateFormatting();
  runApp(CovidApp());
}
