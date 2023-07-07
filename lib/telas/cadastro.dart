import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Variáveis de estado
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _datainiciocontroller = TextEditingController();
  final TextEditingController _datafimcontroller = TextEditingController();
  final TextEditingController _horasaulacontroller = TextEditingController();
  final TextEditingController _cursocontroller = TextEditingController();
  String? _selectedCurso;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Turmas"),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Turno
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: "Turno: ",
                      // border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.wb_sunny_outlined),
                    ),
                    value: _selectedCurso,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedCurso = value;
                      });
                    },
                    items: const [
                      DropdownMenuItem<String>(
                        value: "Matutino",
                        child: Text("Matutino"),
                      ),
                      DropdownMenuItem<String>(
                        value: "Vespertino",
                        child: Text("Vespertino"),
                      ),
                      DropdownMenuItem<String>(
                        value: "Noturno",
                        child: Text("Noturno"),
                      ),
                    ],
                  ),

                  // Data de início
                  DateTimeField(
                    controller: _datainiciocontroller,
                    decoration: const InputDecoration(
                      labelText: "Data de início: ",
                      // border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_month_outlined),
                    ),
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                    },
                    format: DateFormat("yyyy-MM-dd"),
                  ),

                  // Data de término
                  DateTimeField(
                    controller: _datafimcontroller,
                    decoration: const InputDecoration(
                      labelText: "Data de término: ",
                      // border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_month_outlined),
                    ),
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                    },
                    format: DateFormat("yyyy-MM-dd"),
                  ),

                  // Horas-aula por dia
                  TextFormField(
                    controller: _horasaulacontroller,
                    decoration: const InputDecoration(
                      labelText: "Horas-aula por dia: ",
                      // border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.access_alarm),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo obrigatório";
                      }
                      return null;
                    },
                  ),

                  // Curso
                  TextFormField(
                    controller: _cursocontroller,
                    decoration: const InputDecoration(
                      labelText: "Curso: ",
                      // border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.book_outlined),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo obrigatório";
                      }
                      return null;
                    },
                  ),

                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          debugPrint("Turma cadastrada com sucesso!");
                          Fluttertoast.showToast(
                              msg: "Turma cadastrada com sucesso!",
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.green);
                        }
                      },
                      child: const Text("Cadastrar")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
