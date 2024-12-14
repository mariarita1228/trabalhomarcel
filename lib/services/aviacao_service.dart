import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/aviao.dart';

class AviacaoService {
  static List<dynamic> _companhias = [];

  // Carrega os dados do arquivo JSON
  static Future<void> loadCompanhias() async {
    final String jsonString = await rootBundle.loadString('assets/avioes.json');
    final jsonResponse = json.decode(jsonString);
    _companhias = jsonResponse['companhias'];
  }

  // Retorna os nomes das companhias
  static List<String> getCompanhias() {
    return _companhias.map<String>((companhia) => companhia['nome'] as String).toList();
  }

  // Obtém os aviões de uma companhia
  static List<Aviao> getAvioesByCompanhia(String companhiaNome) {
    try {
      final companhia = _companhias.firstWhere((c) => c['nome'] == companhiaNome);
      return (companhia['avioes'] as List)
          .map((avio) => Aviao(
                modelo: avio['modelo'],
                capacidade: avio['capacidade'],
                alcance: avio['alcance'],
              ))
          .toList();
    } catch (e) {
      return []; // Retorna uma lista vazia se não encontrar a companhia
    }
  }
}
