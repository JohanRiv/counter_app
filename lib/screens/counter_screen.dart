import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void addUnit() {
    counter++;
    setState(() {});
  }

  void removeUnit() {
    counter--;
    setState(() {});
  }

  void resetUnit() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize25 = TextStyle(fontSize: 25);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('Clicks Counter', style: fontSize25),
            Text(
              '$counter',
              style: fontSize25,
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        addCounter: addUnit,
        removeCounter: removeUnit,
        resetCounter: resetUnit,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  final Function addCounter;
  final Function removeCounter;
  final Function resetCounter;

  const CustomFloatingActionButton({
    Key? key,
    required this.addCounter,
    required this.removeCounter,
    required this.resetCounter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FloatingActionButton(
          onPressed: () => addCounter(),
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () => resetCounter(),
          child: const Icon(Icons.replay_outlined),
        ),
        FloatingActionButton(
          onPressed: () => removeCounter(),
          child: const Icon(Icons.remove_outlined),
        ),
      ],
    );
  }
}
