import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Validation',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: const Center(child: Text('Form Validation')),
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _images(),
                secoundbar(),
                MindControl(),
              ],
            ),
          ))),
    );
  }
}

class MindControl extends StatefulWidget {
  const MindControl({super.key});

  @override
  State<MindControl> createState() => _MindControlState();
}

class _MindControlState extends State<MindControl> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  @override
  void namedispose() {
    name.dispose();
  }

  void phonedispose() {
    phone.dispose();
  }

  void emaildispose() {
    email.dispose();
  }

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'Enter Name', hintText: 'Pongsapuk Lubkim'),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !RegExp(r'^[a-z A-Z +$]').hasMatch(value)) {
                  return 'Enter Correct Name';
                }
                return null;
              },
              controller: name,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'Enter Student Number', hintText: '64130500220'),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                        .hasMatch(value)) {
                  return "Enter Student Number";
                }
                if (value.length < 11 || value.length > 11) {
                  return "SID can't be more or less than 11 digits";
                } else {
                  return null;
                }
              },
              controller: phone,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'Enter Email',
                  hintText: 'pongsapuk.lubk@kmutt.ac.th'),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                  return "Enter Corrent Email Address";
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
                              '${name.text}\n\n${phone.text}\n\n${email.text}'),
                        );
                      },
                    );
                  }
                },
                child: const Text('Submit Data'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _images() {
  return Column(
    children: [Image.asset('pic/tak.jpg')],
  );
}

// Widget titleSection = Container(
//   padding: const EdgeInsets.all(32),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Expanded(
//         child: Text(
//           ' My name is Pongsapuk Lubkim',
//           style: TextStyle(color: Colors.red, fontSize: 50),
//         ),
//       ),
//     ],
//   ),
// );
Widget secoundbar() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Icon(
          Icons.favorite,
          color: Colors.pink,
        ),
        Icon(Icons.audiotrack, color: Colors.green),
        Icon(
          Icons.beach_access,
          color: Colors.blue,
        ),
        // Text(
        //   'My Std. ID is : 64130500220',
        //   style: TextStyle(fontSize: 20),
        // )
      ],
    ),
  );
}
