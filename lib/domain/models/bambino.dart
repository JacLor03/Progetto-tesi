import 'package:software_analista/domain/models/percorso.dart';

enum Sesso {Maschio, Femmina, Altro}

class bambino{
    final String id;
    final String nome;
    final String cognome;
    final DateTime DataDiNascita;
    final Sesso sesso;
    final List<percorso> percorsiBambino;

    bambino({
      required this.id,
      required this.nome,
      required this.cognome,
      required this.DataDiNascita,
      required this.sesso,
      this.percorsiBambino = const[],
    });

}