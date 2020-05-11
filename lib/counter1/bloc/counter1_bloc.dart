import 'dart:async';

import 'package:flutterblocsample/counter1/event/counter1_event.dart';

class Counter1Bloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter {
    return _counterStateController.sink;
  }
  // For state, exposing only a stream which outputs data
  Stream<int> get counter {
    return _counterStateController.stream;
  }

  final _counterEventController = StreamController<Counter1Event>();
  // For events, exposing only a sink which is an input
  Sink<Counter1Event> get counterEventSink {
    return _counterEventController.sink;
  }

  Counter1Bloc() {
    // Whenever there is a new event, we want to map it to a new state
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(Counter1Event event) {
    if (event is IncrementEvent)
      _counter++;
    else
      _counter--;

    _inCounter.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}