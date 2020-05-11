import 'package:flutter/material.dart';
import 'package:flutterblocsample/counter1/bloc/counter1_bloc.dart';
import 'package:flutterblocsample/counter1/event/counter1_event.dart';

class Counter1Screen extends StatelessWidget {
  static const String routeName = "Example1Screen";
  @override
  Widget build(BuildContext context) {
    final _bloc = Counter1Bloc();
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: _bloc.counter,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Center(
              child: Text(
                '${snapshot.data}',
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "add",
            onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: "sub",
            onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
