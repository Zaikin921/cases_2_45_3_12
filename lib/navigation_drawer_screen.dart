import 'package:flutter/material.dart';

class NavigationDrawerScreen extends StatefulWidget {
  const NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  _NavigationDrawerScreenState createState() => _NavigationDrawerScreenState();
}

class _NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
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
        ),
        drawer: Drawer(
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
        ),
        body: Center(child: Text("Содержание")),
      ),
          );
  }
}
