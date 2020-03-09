import 'package:flutter/material.dart';
import 'package:lg_movel/models/nota.dart';

class NotaController extends ChangeNotifier {
  List<Nota> notas = [];

  void adicionarNovaNota(Nota nota) {
    notas.add(nota);
    notifyListeners();
  }

  void removerNota(Nota nota) {
    notas.remove(nota);
    notifyListeners();
  }
}
