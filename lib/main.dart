import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'services/aviacao_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AviacaoService.loadCompanhias();
  runApp(AviacaoApp());
}

class AviacaoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Aviões',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}