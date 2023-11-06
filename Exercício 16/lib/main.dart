import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

//Funciona no emulador android do android x64
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inicialize o banco de dados e o passe para o aplicativo
  final database = await openDatabase(
    'todo_database.db',
    version: 1,
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE todos(id INTEGER PRIMARY KEY, task TEXT, complete INTEGER)',
      );
    },
  );

  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  final Database database;

  MyApp({Key? key, required this.database}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(database: database),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Database database;

  MyHomePage({Key? key, required this.database}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> todos = [];

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    final List<Map<String, dynamic>> maps =
        await widget.database.query('todos');

    setState(() {
      todos = List.generate(maps.length, (i) {
        return Todo(
          id: maps[i]['id'],
          task: maps[i]['task'],
          complete: maps[i]['complete'] == 1,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].task),
            leading: Icon(
              todos[index].complete
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
            ),
            onTap: () {
              setState(() {
                todos[index].complete = !todos[index].complete;
              });
              widget.database.update(
                'todos',
                {'complete': todos[index].complete ? 1 : 0},
                where: 'id = ?',
                whereArgs: [todos[index].id],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var id = await showDialog<int>(
            context: context,
            builder: (context) {
              return AddTodoDialog();
            },
          );
          if (id != null) {
            _loadTodos();
          }
        },
        tooltip: 'Add Todo',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Todo {
  int id;
  String task;
  bool complete;

  Todo({
    required this.id,
    required this.task,
    required this.complete,
  });
}

class AddTodoDialog extends StatefulWidget {
  @override
  _AddTodoDialogState createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add a new todo'),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: 'Enter todo task'),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('CANCEL'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('ADD'),
          onPressed: () async {
            final String task = controller.text;
            if (task.isNotEmpty) {
              final id = await insertTodo(
                task: task,
              );
              Navigator.of(context).pop(id);
            }
          },
        ),
      ],
    );
  }

  Future<int> insertTodo({required String task}) async {
    final Database database = await openDatabase('todo_database.db');
    return await database.insert(
      'todos',
      {'task': task, 'complete': 0},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
