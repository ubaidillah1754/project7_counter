import 'package:flutter/material.dart';

class CounterButtons extends StatelessWidget {
  final VoidCallback onAdd;
  final VoidCallback onSubtract;
  final VoidCallback onReset;
  final bool isZero; // Opsional: untuk menonaktifkan visual tombol kurang saat 0

  const CounterButtons({
    super.key,
    required this.onAdd,
    required this.onSubtract,
    required this.onReset,
    required this.isZero,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tombol Kurang (-1)
            ElevatedButton.icon(
              // Jika counter == 0, tombol dinonaktifkan / tidak melakukan apa-apa
              onPressed: isZero ? null : onSubtract,
              icon: const Icon(Icons.remove),
              label: const Text('Kurang (-1)'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
            const SizedBox(width: 16),
            // Tombol Tambah (+1)
            ElevatedButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.add),
              label: const Text('Tambah (+1)'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Tombol Reset
        OutlinedButton.icon(
          onPressed: isZero ? null : onReset,
          icon: const Icon(Icons.refresh),
          label: const Text('Reset ke 0'),
        ),
      ],
    );
  }
}