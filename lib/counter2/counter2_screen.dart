import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocsample/counter2/bloc/counter2_bloc.dart';


class Counter2Screen extends StatelessWidget {
  static const String routeName = "Counter2Screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<Counter2Bloc, int>(
        builder: (context, count) {
          return Center(
            child: Text(
              '$count',
              style: Theme.of(context).textTheme.display1,
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "adad",
              child: Icon(Icons.add),
              onPressed: () {
                BlocProvider.of<Counter2Bloc>(context).inc();
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "rev",
              child: Icon(Icons.remove),
              onPressed: () {
                BlocProvider.of<Counter2Bloc>(context).dec();
              },
            ),
          ),
        ],
      ),
    );
  }
}
