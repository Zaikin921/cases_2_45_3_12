import 'package:flutter/material.dart';
import 'package:norm_fu/utils/global_theme.dart';
import 'package:norm_fu/utils/string.dart';


class ThemeDemoApp extends StatelessWidget {
  const ThemeDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
      home: ThemeDemoScreen(),
    );
  }
}

class ThemeDemoScreen extends StatefulWidget {
  const ThemeDemoScreen({Key? key}) : super(key: key);

  @override
  _ThemeDemoScreenState createState() => _ThemeDemoScreenState();
}

class _ThemeDemoScreenState extends State<ThemeDemoScreen> {
  double _currentSliderValue = 20;
  bool _isDarkTheme = false;

  Widget _navigationDraw() => Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(250, 241, 227, 1),
            ),
            child: Container(
              height: 200,
              child: const  Text('Содержание'),
            )),
        ListTile(
          leading: const Icon(Icons.one_k_rounded),
          title: const Text("Список"),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.one_k_rounded),
          title: const Text("Список2"),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.three_k_rounded),
          title: const Text("Список3"),
        )
      ],
    ),
  );

  PreferredSizeWidget _appBar() => AppBar(
    backgroundColor: Colors.orangeAccent,
    title: const Text('Пример'),
    actions: <Widget>[
      IconButton(
        tooltip: "Балланс",
        onPressed: () {},
        icon: const Icon(Icons.ac_unit),
      ),
      IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),


    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: _navigationDraw(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text('Заголовок', style: Theme.of(context).textTheme.headline6),
              Container(
                height: 100,
                color: Theme.of(context).colorScheme.secondary,
              ),
            Row(
              children: const [
                Text('Логин: '),
                Expanded(child: TextField()),
              ],
            ),
              Row(
                children: const [
                  Text('Пароль: '),
                  Expanded(child: TextField()),
                ],
              ),
            ElevatedButton(onPressed: () {} , child: Text('Войти')),
            Text(Strings.longBodyText),
            Slider(
                value: _currentSliderValue,
                max: 100,
                divisions: 5,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                }),
            ],
          ),
        ),
      )
    );
  }
}

