import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: Center(
          child: Paremtwidget(),
        ),
      ),
    );
  }
}

class TapBoxA extends StatefulWidget {
  const TapBoxA({super.key});

  @override
  State<TapBoxA> createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {
  bool _active = true;
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[700]),
        child: Center(
            child: Text(
          _active ? 'A Active' : 'A Inactive',
          style: const TextStyle(fontSize: 32, color: Colors.white),
        )),
      ),
    );
  }
}

class Paremtwidget extends StatefulWidget {
  const Paremtwidget({super.key});

  @override
  State<Paremtwidget> createState() => _ParemtwidgetState();
}

class _ParemtwidgetState extends State<Paremtwidget> {
  bool _active = true;
  void Tap(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TapBoxc(
        active: _active,
        onChanged: Tap,
      ),
    );
  }
}

class TapBoxB extends StatelessWidget {
  const TapBoxB({
    super.key,
    this.active = false,
    required this.onChanged,
  });
  final bool active;
  final ValueChanged<bool> onChanged;
  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 300.0,
        height: 300.0,
        decoration:
            BoxDecoration(color: active ? Colors.red[500] : Colors.grey[500]),
        child: Center(
          child: Text(active ? "Active" : "InActive"),
        ),
      ),
    );
  }
}

class TapBoxc extends StatefulWidget {
  const TapBoxc({super.key, this.active = false, required this.onChanged});
  final bool active;
  final ValueChanged<bool> onChanged;
  @override
  State<TapBoxc> createState() => _TapBoxcState();
}

class _TapBoxcState extends State<TapBoxc> {
  bool _highlight = false;

  void statebool(state) {
    setState(() {
      _highlight = state;
    });
  }

  // void _handleTapDown(TapDownDetails details) {
  //   setState(() {
  //     _highlight = true;
  //   });
  // }

  // void _handleTapUp(TapUpDetails details) {
  //   setState(() {
  //     _highlight = false;
  //   });
  // }

  // void _handleTapCancel() {
  //   setState(() {
  //     _highlight = false;
  //   });
  // }

  // void _handleTap() {
  //   widget.onChanged(!widget.active);
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (details) => statebool(true),
        onTapUp: (details) => statebool(false),
        onTap: () => widget.onChanged(!widget.active),
        onDoubleTapCancel: () => statebool(false),
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
              border: _highlight
                  ? Border.all(color: Colors.teal[700]!, width: 20)
                  : null),
          child: Center(child: Text(widget.active ? 'C Active' : 'C InActive')),
        ));
  }
}
