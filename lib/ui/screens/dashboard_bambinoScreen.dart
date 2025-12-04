import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software_analista/ui/viewmodels/dashboard_bambinoViewmodel.dart';
import 'package:software_analista/domain/models/bambino.dart';
import 'package:software_analista/ui/widgets/grafico_progressi.dart';

class Dashboard_bambinoScreen extends StatelessWidget {
  final Bambino bambino;

  const Dashboard_bambinoScreen({super.key, required this.bambino});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => dashboard_bambinoViewmodel(bambino: bambino),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard Bambino"),
        ),
        body: Consumer<dashboard_bambinoViewmodel>(
          builder: (context, vm, child) {
            if (vm.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            final Bambino bambino = vm.bambino;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ⭐ NOME BAMBINO
                    Text(
                      bambino.nome,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ⭐ INFORMAZIONI BASE
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
                            Text("Data di nascita: ${bambino.dataDiNascita}"),
                            Text("Sesso: ${bambino.sesso}"),
                            Text("ID Bambino: ${bambino.id}"),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // ⭐ GRAFICO PROGRESSI
                    GraficoProgressi(data: vm.getProgressiChartData()),

                    const SizedBox(height: 30),

                    const Text(
                      "Percorsi completati",
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
                          children: bambino.progressiBambino.map((p) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                "• ${p.percorso.nome} (${p.nodiCompletati}/${p.percorso.numNodi})",
                                style: const TextStyle(fontSize: 16),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
