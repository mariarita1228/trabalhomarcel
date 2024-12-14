import 'package:flutter/material.dart';
import 'catalogo_page.dart';
import '../services/aviacao_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> companhias = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCompanhias();
  }

  // Carrega as companhias do arquivo JSON
  Future<void> _loadCompanhias() async {
    await AviacaoService.loadCompanhias();
    setState(() {
      companhias = AviacaoService.getCompanhias(); // Obtém as companhias carregadas
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo de Aviões'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Sobre'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Informações sobre o projeto'),
              onTap: () {
                Navigator.pop(context);
                showAboutDialog(
                  context: context,
                  applicationName: 'Catálogo de Aviões',
                  applicationVersion: '1.0',
                  children: <Widget>[
                    SizedBox(height: 16),
                    Text(
                      'Integrantes do Grupo:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Maria Rita Costa Brasil de Almeida'),
                    Text('Layra Sthefane Silva Carvalho'),
                    Text('Anna Cibelly Caldas'),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator() // Exibe carregando até obter as companhias
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropdownButton<String>(
                    items: companhias.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text("Selecione a Companhia Aérea"),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CatalogoPage(companhia: newValue),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
