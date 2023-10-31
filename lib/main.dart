import 'package:basketball_counter/cubit/counter.dart';
import 'package:basketball_counter/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BasketballCounter());
}

class BasketballCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CubitCounter(),
        child: HomePage(),
      ),
    );
  }
}
