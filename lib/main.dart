import 'package:app_todo/formulario.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/list': (context) => Home(),
        '/form': (context) => Formulario(),
      },
      initialRoute: '/list',
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> list = [];
  // ignore: prefer_typing_uninitialized_variables

  var index;

  void addList(value) {
    list.add(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final resultado = Navigator.of(context)
              .push(
                  new MaterialPageRoute(builder: (context) => new Formulario()))
              .then((value) {
            if (value != null) {
              setState(() {
                addList(value);
              });
            }
          });
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Column(children: [
              ListTile(
                title: Text(
                  '${index + 1} - ${list[index]}',
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5),
                child: Divider(
                color: Colors.grey
              )

                
              )
            ]);
          }),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
