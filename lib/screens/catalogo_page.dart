import 'package:flutter/material.dart';
import 'detalhes_page.dart';
import '../models/aviao.dart';
import '../services/aviacao_service.dart';

class CatalogoPage extends StatelessWidget {
  final String companhia;

  CatalogoPage({required this.companhia});

  @override
  Widget build(BuildContext context) {
    final avioes = AviacaoService.getAvioesByCompanhia(companhia);

    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo de Aviões - $companhia'),
      ),
      body: ListView.builder(
        itemCount: avioes.length,
        itemBuilder: (context, index) {
          final aviao = avioes[index];
          return Card(
            child: ListTile(
              title: Text(aviao.modelo),
              subtitle: Text('Capacidade: ${aviao.capacidade} passageiros'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetalhesPage(aviao: aviao)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}