import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software_analista/ui/screens/lista_bambiniScreen.dart';
import 'package:software_analista/domain/models/percorso.dart';
import 'package:software_analista/ui/viewmodels/lista_percorsiViewmodel.dart';
import 'package:software_analista/ui/widgets/percorso_card.dart';
import 'package:software_analista/ui/widgets/tab_button.dart';

class Lista_percorsiScreen extends StatefulWidget {
  const Lista_percorsiScreen({super.key});

  @override
  State<Lista_percorsiScreen> createState() => _Lista_percorsiScreenState();
}

class _Lista_percorsiScreenState extends State<Lista_percorsiScreen> {
  int selectedTab = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Percorsi disponibili"),
        centerTitle: true,
      ),

      body: Column(
        children: [
          const SizedBox(height: 10),

          // BARRA DI SWITCH TRA PAGINE
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              tab_button(
                label: "Lista Bambini",
                isSelected: selectedTab == 0,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Lista_bambiniScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(width: 12),
              tab_button(
                label: "Lista Percorsi",
                isSelected: selectedTab == 1, // questa pagina è attiva
                onTap: () {
                  // già qui
                },
              ),
            ],
          ),

          const SizedBox(height: 20),

          // 🔄 LISTA PERCORSI
          Expanded(
            child: Consumer<lista_percorsiViewModel>(
              builder: (context, vm, _) {
                if (vm.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (vm.percorsi.isEmpty) {
                  return const Center(
                    child: Text(
                      "Nessun percorso registrato",
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: vm.percorsi.length,
                  itemBuilder: (context, index) {
                    final percorso = vm.percorsi[index];
                    return percorso_card(percorso: percorso);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
