import 'package:flutter/material.dart';
import 'package:flutter_todo_app/counter.dart';
import 'package:flutter_todo_app/todo.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  static Map<String, StatelessWidget Function(dynamic context)> Function(dynamic context)
      routes = (context) => {
            '/': (context) => const IndexApp(),
            '/todo': (context) => const TodoApp(),
            '/counter': (context) => const CounterApp(),
          };

  const MainApp({super.key});

  @override
  build(BuildContext context) {
    return MaterialApp(
        title: "Don't Give App",
        initialRoute: '/',
        routes: MainApp.routes(context));
    // routes: { for (var entry in routes.entries) entry.key: (context) => Widget(entry.value) }
    // routes: routes.entries.map((entry) => entry.key).toList().to);
  }
}

class IndexApp extends StatelessWidget {
  const IndexApp({super.key});

  @override
  Widget build(BuildContext context) {
    var slugs = MainApp.routes(null).keys.toList();
    slugs.remove('/');
    return Scaffold(
        appBar: AppBar(
          title: const Text("Main"),
        ),
        body: ListView(
            children: slugs
                .map((slug) => ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, slug),
                    child: Text(slug)))
                .toList()));
  }
}
