import 'package:software_analista/domain/models/progressoPercorso.dart';

class percorso{
  final int numNodi;
  final String nome;
  final String descrizione;
  final DateTime dataInizio;
  final DateTime? dataFIne;
  final progressoPercorso? progresso;

  percorso({
    required this.numNodi,
    required this.nome,
    required this.descrizione,
    required this.dataInizio,
    this.dataFIne,
    this.progresso,
  });
}