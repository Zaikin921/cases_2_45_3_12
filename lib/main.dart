import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            home:  Scaffold(
                body: Container(
                  width: double.infinity,
                  child: Column(children: [
                    SizedBox(height: 70,),
                    SizedBox(width: 130, height: 105, child: Placeholder(),),
                    SizedBox(height: 30,),
                    Text('Введите логин и пароль'),
                    SizedBox(height: 30,),
                    const SizedBox(width: 284,
                      child: TextField (
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFeceff1),
                          labelText: 'Телефон'
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    const SizedBox(width: 284,
                      child: TextField (
                        obscureText: true,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFeceff1),
                            labelText: 'Пароль'
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    SizedBox(width: 154, height: 55, child: ElevatedButton(onPressed: () {}, child: Text('Войти'))),
                    SizedBox(height: 60,),
                    InkWell(child: Text('Регистрация'), onTap: () {} ),
                    SizedBox(height: 30,),
                    InkWell(child: Text('Забыли пароль?'), onTap: () {} ),
                  ],),
                )
                        ),
    );
  }
}


