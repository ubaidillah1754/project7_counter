import 'package:flutter/material.dart';
import 'counter_display.dart';
import 'counter_buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Praktikum Counter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      // Halaman awal dibuat untuk mempermudah pengujian dispose() saat navigasi
      home: const HomeScreen(),
    );
  }
}

/// Halaman pembuka agar halaman Counter bisa di-pop (ditutup)
/// sehingga lifecycle dispose() dapat terpicu dan terlihat di console.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Praktikum')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CounterPage()),
            );
          },
          child: const Text('Buka Aplikasi Counter'),
        ),
      ),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    // Lifecycle 1: Dipanggil sekali saat widget pertama kali dibuat
    debugPrint('Counter dimulai');
  }

  @override
  void dispose() {
    // Lifecycle 2: Dipanggil saat widget dihancurkan / keluar dari tree
    debugPrint('Counter ditutup');
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    // Aturan: Angka tidak boleh minus
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Passing data _counter ke widget CounterDisplay
            CounterDisplay(counter: _counter),
            const SizedBox(height: 32),
            // Passing 3 callback function ke widget CounterButtons
            CounterButtons(
              onAdd: _incrementCounter,
              onSubtract: _decrementCounter,
              onReset: _resetCounter,
              isZero: _counter == 0,
            ),
          ],
        ),
      ),
    );
  }
}