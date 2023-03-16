import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final sid = TextEditingController();
  final email = TextEditingController();
  @override
  void init() {
    super.initState();
    name.addListener(() {
      print('Second text fieldd: ${name.text}');
    });
  }

  @override
  void namedispose() {
    name.dispose();
  }

  void siddispose() {
    sid.dispose();
  }

  void emaildispose() {
    email.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  hintText: 'Pongsapuk Lubkim'),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !RegExp(r'^[a-z A-Z +$]').hasMatch(value)) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: name,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'SID',
                  border: OutlineInputBorder(),
                  hintText: '64130500220'),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                        .hasMatch(value)) {
                  return "enter only number";
                }
                if (value.length > 12) {
                  return "SID can't be more 12 digits";
                } else {
                  return null;
                }
              },
              controller: sid,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  hintText: 'pongsapuk.lubk@kmutt.ac.th'),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                  return "enter valid email";
                } else {
                  return null;
                }
              },
              controller: email,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          content: Text(
                              '${name.text}\n\n${sid.text}\n\n${email.text}'),
                        );
                      },
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
