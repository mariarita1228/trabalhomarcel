import 'package:flutter/material.dart';
import '../models/aviao.dart';

class DetalhesPage extends StatelessWidget {
  final Aviao aviao;

  DetalhesPage({required this.aviao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(aviao.modelo),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Modelo: ${aviao.modelo}', style: TextStyle(fontSize: 20)),
            Text('Capacidade: ${aviao.capacidade} passageiros', style: TextStyle(fontSize: 18)),
            Text('Alcance: ${aviao.alcance} km', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}