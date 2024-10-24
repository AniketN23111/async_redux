import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final int? counter;
  final VoidCallback? onChangePage;
  final VoidCallback? decrementCounter;
  const SecondPage(
      {super.key, this.counter, this.onChangePage, this.decrementCounter});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text('${widget.counter}', style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: widget.decrementCounter,
                child: const Text("Decrement Counter")),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: widget.onChangePage, child: const Text("Go Back")),
          ],
        ),
      ),
    );
  }
}
