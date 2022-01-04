import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
    Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(
            color: const Color(0xFFD4C16B), width: 3));

    return MaterialApp(
      home:  Scaffold(
          body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(color: Color.fromARGB(250, 241, 227, 1)),
              width: double.infinity,
              child: Column(children: [
                SizedBox(height: 60,),
                SizedBox(width: 125, height: 105, child: Image(image: AssetImage('assets/logo.png'),),),
                SizedBox(height: 25,),
                const Text('Введите логин и пароль',
                    style: TextStyle(fontSize: 20, color: Color.fromRGBO(181, 121, 35, 1))),
                SizedBox(height: 25,),
                const SizedBox(width: 224,
                  child: TextField (
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFeceff1),
                        enabledBorder: borderStyle,
                        focusedBorder: borderStyle,
                        labelText: 'Телефон'
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                const SizedBox(width: 224,
                  child: TextField (
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFeceff1),
                        enabledBorder: borderStyle,
                        focusedBorder: borderStyle,
                        labelText: 'Пароль'
                    ),
                  ),
                ),
                SizedBox(height: 60,),
                SizedBox(width: 154, height: 55, child:
                ElevatedButton(onPressed: () {},
                  child: Text('Войти'),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFFb57923),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.0),
                      )
                  ),
                ),
                ),
                SizedBox(height: 45,),
                InkWell(child: Text('Регистрация', style: TextStyle(fontSize: 20, color: Color.fromRGBO(181, 121, 35, 1))), onTap: () {} ),
                SizedBox(height: 25,),
                InkWell(child: Text('Забыли пароль?', style: TextStyle(fontSize: 20, color: Color.fromRGBO(181, 121, 35, 1))), onTap: () {} ),
              ],),
            ),
          )
      ),
    );
  }
}


