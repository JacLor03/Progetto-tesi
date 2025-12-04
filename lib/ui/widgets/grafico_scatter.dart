import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ScatterChartWidget extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const ScatterChartWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(minimum: 0, maximum: 100),
          title: ChartTitle(text: 'Grafico Scatter'),
          series: <ScatterSeries>[
            ScatterSeries<Map<String, dynamic>, String>(
              dataSource: data,
              xValueMapper: (datum, _) => datum['percorso'] as String,
              yValueMapper: (datum, _) => datum['percentuale'] as double,
              color: Colors.orange,
              markerSettings: const MarkerSettings(isVisible: true),
            )
          ],
        ),
      ),
    );
  }
}
