import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


class SharedPrefScreen extends StatelessWidget {
  const SharedPrefScreen({Key? key}) : super(key: key);

// This widget is the root of the application

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Шеф,два счетчика!!!',
      home: FlutterDemo(storage: CounterStorage()),
    );
  }
}

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
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

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }
}

class FlutterDemo extends StatefulWidget {
  const FlutterDemo({Key? key, required this.storage}) : super(key: key);

  final CounterStorage storage;

  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _counter1 = 0;
  int _counter2 = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter2 = value;
      });
    });
  }

  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter1 = (prefs.getInt('counter1') ?? 0);
    });
  }

  //Incrementing counter after click
  void _incrementCounter1() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter1 = (prefs.getInt('counter1') ?? 0) + 1;
      prefs.setInt('counter', _counter1);
    });
  }


  Future<File> _incrementCounter2() {
    setState(() {
      _counter2++;
    });

    // Write the variable as a string to the file.
    return widget.storage.writeCounter(_counter2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Шеф, два счетчика'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'НАЖАТЬ КНОПКУ:',
            ),
            Text(
              '$_counter1',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
            ElevatedButton(
                onPressed: _incrementCounter1,
                                child: Text('ЖМИ!')),
            Text(
              'Красная кнопка нажата: $_counter2  ${_counter2 == 1 ? '' : 'раз(а)'}.',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6,
            ),
            ElevatedButton(onPressed: _incrementCounter2,
                child: Text('И ТУТ ЖМИ!'),
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(255, 0, 0, 1),
            ),),
          ],
        ),
      ),


    );
  }
}

/*

//was
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
  int _counter1 = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  //Loading counter value on start
  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter1 = (prefs.getInt('counter') ?? 0);
    });
  }

  //Incrementing counter after click
  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter1= (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter1);
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
              '$_counter1',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                onPressed: _incrementCounter,
                                child: Text('ЖМИ!')),
             /*Text(
            'Кнопка $_counter2 нажата ${_counter2 == 1 ? '' : 's'}.',
            style: Theme.of(context).textTheme.headline4,
          ),
          ElevatedButton(onPressed: _incrementCounter, child: Text('И ТУТ ЖМИ!')),
          */],
        ),
      ),



    );
  }
}

// COUNTER TWO





  /*
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
}*/
*/
