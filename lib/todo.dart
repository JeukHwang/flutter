import 'package:flutter/material.dart';

// Reference: https://kyungsnim.net/85

class ToDo {
  bool isDone = false;
  String title;

  ToDo(this.title);
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ToDoListPage(),
      ),
    );
  }
}

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  ToDoListPageState createState() => ToDoListPageState();
}

class ToDoListPageState extends State<ToDoListPage> {
  final _items = <ToDo>[];
  final _todoController = TextEditingController();

  void _addToDo(ToDo todo) {
    setState(() {
      _items.add(todo);
      _todoController.text = '';
    });
  }

  void _deleteTodo(ToDo todo) {
    setState(() {
      _items.remove(todo);
    });
  }

  void _toggleTodo(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Todo App: Something left to do"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      controller: _todoController,
                    )),
                    ElevatedButton(
                      onPressed: () => _addToDo(ToDo(_todoController.text)),
                      child: const Text(
                        "추가하기",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: ListView(
                  children:
                      _items.map((todo) => _buildItemWidget(todo)).toList(),
                ))
              ],
            )));
  }

  Widget _buildItemWidget(ToDo todo) {
    return ListTile(
        onTap: () => _toggleTodo(todo),
        trailing: IconButton(
            icon: const Icon(Icons.delete), onPressed: () => _deleteTodo(todo)),
        title: Text(
          todo.title,
          style: todo.isDone
              ? const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontStyle: FontStyle.italic,
                )
              : null,
        ));
  }
}
