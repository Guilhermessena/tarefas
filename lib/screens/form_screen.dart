import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';
import 'package:nosso_primeiro_projeto/data/task_dao.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({
    required this.context,
    super.key,
  });
  final BuildContext context;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  var nomeController = TextEditingController();
  var dificuldadeController = TextEditingController();
  var imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool validatorValue(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool validatorDifficulty(String? value) {
    if (value != null && value.isEmpty) {
      if (int.parse(value) > 5 || int.parse(value) < 1) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Nova Tarefa',
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            height: 740,
            width: 390,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 4,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nomeController,
                    validator: (value) {
                      if (validatorValue(value)) {
                        return 'Insira um nome';
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nome',
                      fillColor: Colors.white60,
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: dificuldadeController,
                    validator: (value) {
                      if (validatorDifficulty(value)) {
                        return 'Insira um número entre 1 e 5';
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Dificuldade',
                      fillColor: Colors.white60,
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: imageController,
                    validator: (value) {
                      if (validatorValue(value)) {
                        return 'Insira uma URL válida';
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Url da imagem',
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 92,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(
                        width: 2,
                        color: Colors.blue,
                      ),
                    ),
                    child: Image.network(
                      imageController.text,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/images/nophoto.png');
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      TaskDao().save(Task(
                          nomeController.text,
                          int.parse(dificuldadeController.text),
                          imageController.text));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Criado com sucesso'),
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Criar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
