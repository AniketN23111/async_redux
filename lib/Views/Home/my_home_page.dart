import 'package:flutter/material.dart';
import 'package:last_step/Constants/route_names.dart';

/// This is the "dumb-widget". It has no notion of the store, the state, the
/// connector or the view-model. It just gets the parameters it needs to display
/// itself, and callbacks it should call when reacting to the user interface.
class MyHomePage extends StatefulWidget {
  final int? counter;
  final VoidCallback? onIncrement;

  const MyHomePage({
    super.key,
    this.counter,
    this.onIncrement,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Increment Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text('${widget.counter}', style: const TextStyle(fontSize: 30)),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesNames.mySecondPage);
                },
                child: const Text('Next Page')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesNames.databaseOperation);
                },
                child: const Text('Get Product')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesNames.uploadFile);
                },
                child: const Text('File Upload')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.onIncrement,
        child: const Icon(Icons.add),
      ),
    );
  }
}
