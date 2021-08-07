import 'package:counter/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {
          final wasIncremented = state.wasIncremented;
          if (wasIncremented != null) {
            if (wasIncremented) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Incremented'),
                duration: Duration(milliseconds: 300),
              ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Decremented'),
                duration: Duration(milliseconds: 300),
              ));
            }
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'This is the counter value:',
                ),
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      heroTag: 'decBtn1',
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                      },
                      tooltip: 'Decrement',
                      child: Icon(Icons.remove),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    FloatingActionButton(
                      heroTag: 'incBtn1',
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      },
                      tooltip: 'Increment',
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                MaterialButton(
                  color: widget.color,
                  onPressed: () {
                    Navigator.of(context).pushNamed('/second');
                  },
                  child: Text('Go to second screen'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
