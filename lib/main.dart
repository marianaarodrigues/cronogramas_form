import 'package:cronogramas_form/pagina.dart';
// import 'package:cronogramas_form/cadastro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cronogramas',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      home: const Pagina(),
    );
  }
}
