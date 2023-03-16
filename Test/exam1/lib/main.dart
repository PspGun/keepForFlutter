import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Exam',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Layout Exam'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _images(),
              secoundbar(),
              titleSection,
            ],
          )),
    );
  }
}

Widget _images() {
  return Column(
    children: [Image.asset('pic/tak.jpg')],
  );
}

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Text(
          ' My name is Pongsapuk Lubkim',
          style: TextStyle(color: Colors.red, fontSize: 50),
        ),
      ),
    ],
  ),
);
Widget secoundbar() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.favorite,
          color: Colors.pink,
        ),
        Icon(Icons.audiotrack, color: Colors.green),
        Icon(
          Icons.beach_access,
          color: Colors.blue,
        ),
        Text(
          'My Std. ID is : 64130500220',
          style: TextStyle(fontSize: 20),
        )
      ],
    ),
  );
}
