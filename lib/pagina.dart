import 'package:flutter/material.dart';

class Pagina extends StatefulWidget {
  const Pagina({super.key});

  @override
  State<Pagina> createState() => _PaginaState();
}

class _PaginaState extends State<Pagina> {
  final List<String> _lista = ['Turma 1', 'Turma 2', 'Turma 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Turmas"),
      ),
      body: Container(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: _lista.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    color: Colors.purple,
                    child: Center(child: Text(' ${_lista[index]}')),
                  );
                }),
          )),
    );
  }
}
