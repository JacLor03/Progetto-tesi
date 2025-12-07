import 'package:software_analista/domain/models/progressoPercorso.dart';
import 'package:software_analista/domain/models/sesso.dart';

class Bambino{
    final String id;
    final String nome;
    final String cognome;
    final DateTime dataDiNascita;
    final Sesso sesso;
    final ProgressoPercorso? progressoBambino;
    final String? percorsoId;

    Bambino({
      required this.id,
      required this.nome,
      required this.cognome,
      required this.dataDiNascita,
      required this.sesso,
      this.percorsoId,
      this.progressoBambino,
  });

}
