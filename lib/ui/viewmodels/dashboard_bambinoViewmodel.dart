import 'package:flutter/widgets.dart';
import 'package:software_analista/domain/models/bambino.dart';
import 'package:software_analista/domain/models/progressoPercorso.dart';

class dashboard_bambinoViewModel extends ChangeNotifier {
  Bambino _bambino;
  bool _isLoading = true;

  dashboard_bambinoViewModel({required Bambino bambino}) : _bambino = bambino {
    _init();
  }

  Bambino get bambino => _bambino;
  ProgressoPercorso? get progresso => _bambino.progressoBambino;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> _init() async {
    isLoading = true;
    await Future.delayed(const Duration(milliseconds: 300)); // Simula caricamento
    isLoading = false;
  }

  Future<void> loadBambino(Bambino b) async {
    isLoading = true;
    await Future.delayed(const Duration(milliseconds: 300));
    _bambino = b;
    isLoading = false;
  }

  /*void aggiornaNodiCompletati(int nodiCompletati) {
    final p = _bambino.progressoBambino;
    if (p != null) {
      _bambino.progressoBambino = ProgressoPercorso(
        percorsoId: p.percorsoId,
        nodiCompletati: nodiCompletati,
      );
      notifyListeners();
    }
  }*/

  double percentualeCompletata({int totaleNodi = 10}) {
    final p = _bambino.progressoBambino;
    if (p == null || totaleNodi == 0) return 0.0;
    return (p.nodiCompletati / totaleNodi) * 100;
  }

  List<Map<String, dynamic>> getProgressiChartData({int totaleNodi = 10}) {
    final p = _bambino.progressoBambino;
    if (p == null || p.percorso == null) return [];

    final percentuale = (totaleNodi > 0) ? (p.nodiCompletati / totaleNodi) * 100 : 0.0;

    return [
      {
        "percorso": p.percorso!,
        "percentuale": percentuale,
      }
    ];
  }
}
