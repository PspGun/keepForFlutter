import 'package:flutter/material.dart';

class Fact {
  final String title;
  final String description;

  const Fact(this.title, this.description);
}

void main() {
  runApp(
    MaterialApp(
      title: 'Passing Data',
      home: FactsScreen(
        facts: List.generate(
          20,
          (i) => Fact(
            'Factorial ${i + 1}',
            'Factorial of ${i + 1}! is ${fac(i + 1)}',
          ),
        ),
      ),
    ),
  );
}

class FactsScreen extends StatelessWidget {
  const FactsScreen({super.key, required this.facts});

  final List<Fact> facts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Factor'),
      ),
      body: ListView.builder(
        itemCount: facts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(facts[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(fact: facts[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  const DetailScreen({super.key, required this.fact});

  // Declare a field that holds the Todo.
  final Fact fact;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(fact.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(fact.description),
      ),
    );
  }
}

int fac(int n) {
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result *= i;
  }
  return result;
}
