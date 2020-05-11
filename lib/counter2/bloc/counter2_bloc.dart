import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocsample/counter2/event/example2_event.dart';

class Counter2Bloc extends Bloc<Counter2Event, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(Counter2Event event) async* {
    switch (event) {
      case Counter2Event.decrement:
        yield state - 1;
        break;
      case Counter2Event.increment:
        yield state + 1;
        break;
    }
  }

  void inc(){
    add(Counter2Event.increment);
  }

  void dec(){
    add(Counter2Event.decrement);
  }
}
