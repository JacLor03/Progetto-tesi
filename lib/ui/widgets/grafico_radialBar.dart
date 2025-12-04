import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialBarChartWidget extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const RadialBarChartWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SfCircularChart(
          title: ChartTitle(text: 'Progressi Radial Bar'),
          series: <RadialBarSeries<Map<String, dynamic>, String>>[
            RadialBarSeries<Map<String, dynamic>, String>(
              dataSource: data,
              xValueMapper: (datum, _) => datum['percorso'],
              yValueMapper: (datum, _) => datum['percentuale'],
              cornerStyle: CornerStyle.bothCurve,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            ),
          ],
        ),
      ),
    );
  }
}
