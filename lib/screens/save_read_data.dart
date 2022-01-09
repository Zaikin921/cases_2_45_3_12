import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


class SharedPrefScreen extends StatelessWidget {
  const SharedPrefScreen({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Пример записи и сохранения',
      home: MyHomePage(title: 'Пример записи и сохранения'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//COUNTER ONE

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  //Loading counter value on start
  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  //Incrementing counter after click
  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  //


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'НАЖАТЬ КНОПКУ:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                onPressed: _incrementCounter,
                                child: Text('ЖМИ!')),
               ],
        ),
      ),



    );
  }
}

// COUNTER TWO


@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Пример записи и сохранения',
    home: FlutterDemo(storage: CounterStorage()),
  );
  }

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter1.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeCounter(int counter1) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter1');
  }
}



class FlutterDemo extends StatefulWidget {
  const FlutterDemo({Key? key, required this.storage}) : super(key: key);

  final CounterStorage storage;

  @override
  _FlutterDemoState createState() => _FlutterDemoState();
  }

  class _FlutterDemoState extends State<FlutterDemo> {
  int _counter = 0;

  @override
  void initState() {
  super.initState();
  widget.storage.readCounter().then((int value) {
  setState(() {
  _counter = value;
  });
  });
  }

  Future<File> _incrementCounter() {
  setState(() {
  _counter++;
  });

  // Write the variable as a string to the file.
  return widget.storage.writeCounter(_counter);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Кнопка $_counter нажата ${_counter == 1 ? '' : 's'}.',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(onPressed: _incrementCounter, child: Text('И ТУТ ЖМИ!')),
          ],
        ),
      ),



    );
  }
}

