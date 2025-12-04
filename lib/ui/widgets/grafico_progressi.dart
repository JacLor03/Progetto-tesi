import 'package:flutter/material.dart';
import 'package:cristalyse/cristalyse.dart';

class GraficoProgressi extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  GraficoProgressi({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Progressi del bambino",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // GRAFICO CRISTALYSE
            SizedBox(
              height: 300,
              child: CristalyseChart()
                  .data(data)
                  .mapping(x: "percorso", y: "percentuale")
                  .geomBar(color: Colors.blue, borderRadius: BorderRadius.circular(6))
                  .scaleXOrdinal()
                  .scaleYContinuous(min: 0, max: 100)
                  .theme(ChartTheme.defaultTheme())
                  .build(),
            ),
          ],
        ),
      ),
    );
  }
}
