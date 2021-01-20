import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../covid.dart';
import 'covid_view.dart';

class CovidPage extends StatelessWidget {
  const CovidPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CovidCubit(),
      child: CovidView(),
    );
  }
}
