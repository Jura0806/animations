import 'package:flutter/material.dart';

class ExampleFour extends StatefulWidget {
  const ExampleFour({Key? key}) : super(key: key);
  static const String id = "/example4";

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

@immutable
class Person {
  final String name;
  final int age;
  final String emoji;

  const Person({required this.name, required this.age, required this.emoji});
}

const people = [
  Person(name: 'John', age: 20, emoji: '🙋🏻‍️'),
  Person(name: 'Jane', age: 21, emoji: '👸🏽'),
  Person(name: 'Jack', age: 22, emoji: '🧔🏿‍️'),
];

class _ExampleFourState extends State<ExampleFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("People"),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (ctx, index) {
          final person = people[index];
          return ListTile(
            leading: Hero(
                tag: person.name,
                child: Text(
                  person.emoji,
                  style: const TextStyle(fontSize: 40),
                )),
            title: Text(person.name),
            subtitle: Text('${person.age} years old'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailPage(
                        person: person,
                      )));
            },
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.person}) : super(key: key);
  final Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
            flightShuttleBuilder: (
              flightContext,
              animation,
              flightDirection,
              fromHeroContext,
              toHeroContext,
            ) {
              switch (flightDirection) {
                case HeroFlightDirection.push:
                  return Material(
                    color: Colors.transparent,
                    child: ScaleTransition(
                        scale: animation.drive(Tween(begin: 0.0, end: 1.0)
                            .chain(CurveTween(curve: Curves.fastOutSlowIn))),
                        child: toHeroContext.widget),
                  );
                case HeroFlightDirection.pop:
                  return Material(
                    color: Colors.transparent,
                    child: fromHeroContext.widget,
                  );
              }
            },
            tag: person.name,
            child: Text(
              person.emoji,
              style: const TextStyle(fontSize: 50),
            )),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(person.name, style: const TextStyle(fontSize: 20)),
            const SizedBox(
              height: 20,
            ),
            Text("${person.age} years old",
                style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
