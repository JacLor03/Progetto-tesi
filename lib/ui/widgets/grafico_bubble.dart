import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BubbleChartWidget extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const BubbleChartWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SfCartesianChart(
          title: ChartTitle(text: 'Bubble Chart Progressi'),
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(minimum: 0, maximum: 100),
          series: <BubbleSeries<Map<String, dynamic>, String>>[
            BubbleSeries<Map<String, dynamic>, String>(
              dataSource: data,
              xValueMapper: (datum, _) => datum['percorso'],
              yValueMapper: (datum, _) => datum['percentuale'],
              sizeValueMapper: (datum, _) => datum['percentuale'], // dimensione della bolla
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            ),
          ],
        ),
      ),
    );
  }
}
