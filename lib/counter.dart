import 'package:flutter/material.dart';

// Reference: https://medium.com/flutter-community/flutter-understanding-counter-app-ca89de564170

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  CounterPageState createState() => CounterPageState();
}

class CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _addOneCounter() {
    setState(() {
      _counter++;
    });
  }

  void _multiplyTwoCounter() {
    setState(() {
      _counter *= 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Counter App"),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              const Text("Push the button"),
              Text(
                'Total : $_counter',
                style: Theme.of(context).textTheme.displayMedium,
              )
            ])),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: _addOneCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: _multiplyTwoCounter,
                  tooltip: 'Multiple',
                  child: const Icon(Icons.brightness_4_sharp),
                )
              ]),
        ));
  }
}
