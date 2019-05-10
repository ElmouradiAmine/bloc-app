import 'dart:async';

import 'package:bloc_test3/widgets/bloc_provider.dart';

class CounterBloc implements BlocBase{
  int _counter;


  //Streams to handle the counter
  StreamController<int> _counterController = StreamController<int>();
  Sink<int> get _inCounter => _counterController.sink;
  Stream<int> get outCounter => _counterController.stream;

  //Streams to handle the increment of the counter
  StreamController<int> _incrementController = StreamController<int>();
  Sink<int> get incrementCounter => _incrementController.sink;

  CounterBloc(){
    _counter = 0;
    _incrementController.stream.listen(_increment);
  }


  @override
  void dispose() {
    _counterController.close();
    _incrementController.close();
  }

  void _increment(int data){
    _counter = _counter + 1;
    _inCounter.add(_counter);
  }





}