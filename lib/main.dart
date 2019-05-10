
import 'package:bloc_test3/blocs/user_bloc.dart';
import 'package:bloc_test3/pages/bloc_user_page.dart';
import 'package:bloc_test3/widgets/bloc_provider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc pattern demo',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(bloc: UserBloc(),
      child:BlocUserPage()),
    );
  }
}

