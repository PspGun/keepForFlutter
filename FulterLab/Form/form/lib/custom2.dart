import 'dart:ffi';

import 'package:flutter/material.dart';

class MycostomForm2 extends StatefulWidget {
  const MycostomForm2({super.key});

  @override
  State<MycostomForm2> createState() => _MycostomForm2State();
}

class _MycostomForm2State extends State<MycostomForm2> {
  final mc = TextEditingController();
  @override
  void init() {
    super.initState();
    mc.addListener(() {
      print('Second text fieldd: ${mc.text}');
    });
  }

  @override
  void dispose() {
    mc.dispose();
  }

  // void _printLatestValue() {
  //   print('Second text fieldd: ${mc.text}');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Retrieve Text Input')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            TextField(
              onChanged: (text) {
                print('F text field: $text');
              },
            ),
            TextField(
              controller: mc,
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          // When the user presses the button, show an alert dialog containing
          // the text that the user has entered into the text field.
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  // Retrieve the text the that user has entered by using the
                  // TextEditingController.
                  content: Text(mc.text),
                );
              },
            );
          },
          tooltip: 'Show me the value!',
          child: const Icon(Icons.text_fields),
        ));
  }
}
