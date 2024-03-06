import 'package:flutter/material.dart';

void main() {
  runApp(FibonacciApp());
}

class FibonacciApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fibonacci App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FibonacciScreen(),
    );
  }
}

class FibonacciScreen extends StatefulWidget {
  @override
  _FibonacciScreenState createState() => _FibonacciScreenState();
}

class _FibonacciScreenState extends State<FibonacciScreen> {
  TextEditingController _controller = TextEditingController();
  String _fibonacciResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        leading: const Icon(Icons.menu),
        title: const Text('Fibonacci Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your  position',
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder()),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.greenAccent)),
                onPressed: () {
                  int position = int.tryParse(_controller.text) ?? 0;
                  setState(() {
                    _fibonacciResult = calculateFibonacci(position).toString();
                  });
                },
                child: const Text('Calculate'),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Fibonacci Result',
                style: TextStyle(fontSize: 20, color: Colors.redAccent),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                _fibonacciResult,
                style: const TextStyle(fontSize: 17),
              )
            ],
          ),
        ),
      ),
    );
  }

  BigInt calculateFibonacci(int n) {
    if (n == 0) return BigInt.zero;
    if (n == 1) return BigInt.one;
    BigInt fibNMinus1 = BigInt.one;
    BigInt fibNMinus2 = BigInt.zero;
    BigInt fib = BigInt.zero;
    for (int i = 2; i <= n; i++) {
      fib = fibNMinus1 + fibNMinus2;
      fibNMinus2 = fibNMinus1;
      fibNMinus1 = fib;
    }
    return fib;
  }
}
