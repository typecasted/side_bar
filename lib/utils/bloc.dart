
import 'dart:async';

class Bloc {

  StreamController<bool> _streamController = StreamController<bool>.broadcast();
  Stream<bool> get stream => _streamController.stream;
  Sink<bool> get sink => _streamController.sink;


  StreamController<bool> _chartStreamController = StreamController<bool>.broadcast();
  Stream<bool> get chartStream => _streamController.stream;
  Sink<bool> get chartSink => _streamController.sink;


  dispose(){
    _streamController.close();
    _chartStreamController.close();
  }
}