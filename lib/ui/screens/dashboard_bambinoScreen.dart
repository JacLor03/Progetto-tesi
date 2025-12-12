import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software_analista/datiFinti/dati.dart';
import 'package:software_analista/ui/viewmodels/dashboard_bambinoViewmodel.dart';
import 'package:software_analista/domain/models/bambino.dart';
import 'package:software_analista/ui/widgets/grafico_bubble.dart';
import 'package:software_analista/ui/widgets/grafico_area.dart';
import 'package:software_analista/ui/widgets/grafico_barre.dart';
import 'package:software_analista/ui/widgets/grafico_lineare.dart';
import 'package:software_analista/ui/widgets/grafico_radialBar.dart';
import 'package:software_analista/ui/widgets/grafico_scatter.dart';
import 'package:software_analista/ui/widgets/grafico_torta.dart';

class Dashboard_bambinoScreen extends StatelessWidget {
  final Bambino bambino;

  const Dashboard_bambinoScreen({super.key, required this.bambino});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => dashboard_bambinoViewModel(bambino: bambino),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard Bambino"),
        ),
        body: Consumer<dashboard_bambinoViewModel>(
          builder: (context, vm, child) {
            if (vm.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            final Bambino bambino = vm.bambino;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nome bambino
                  Text(
                    bambino.nome,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Informazioni generali
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Informazioni generali",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text("Cognome: ${bambino.cognome}"),
                          Text("Data di nascita: ${bambino.dataDiNascita}"),
                          Text("Sesso: ${bambino.sesso}"),
                          Text("ID Bambino: ${bambino.id}"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  BarchartWidget(data: vm.getProgressiChartData()),
                  LineChartWidget(data: vm.getProgressiChartData()),
                  PieChartWidget(data: vm.getProgressiChartData()),
                  ScatterChartWidget(data: vm.getProgressiChartData()),
                  AreaChartWidget(data: vm.getProgressiChartData()),
                  RadialBarChartWidget(data: vm.getProgressiChartData()),
                  BubbleChartWidget(data: vm.getProgressiChartData()),
                  


                  // Riepilogo Percorsi 
                  const Text(
                    "Riepilogo Percorsi",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (bambino.progressoBambino == null)
                            const Text("Nessun percorso iniziato",
                            style: TextStyle(fontSize: 16))
                          else Builder(
                            builder: (context) {
                              final progresso = bambino.progressoBambino!;
                              final percorso = getPercorsoById(progresso.percorsoId);
                              if (percorso == null) {
                                return const Text(
                                  "Percorso non trovato",
                                   style: TextStyle(fontSize: 16),
                                   );
                              }
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                "• ${percorso.nome} "
                                "(${progresso.nodiCompletati}/${percorso.numNodi})",
                                style: const TextStyle(fontSize: 16),
                              ),
                            );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
