import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final int dificuldade;
  final String imagem;

  Task(this.nome, this.dificuldade, this.imagem, {super.key});

  int value = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool imageOrNetwork() {
    if (widget.imagem.contains('http')) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
              color: widget.value == 0
                  ? Colors.blue
                  : (widget.value / widget.dificuldade) / 10 >= 1
                      ? Colors.green
                      : (widget.value / widget.dificuldade) / 10 >= 1 / 2
                          ? Colors.yellow
                          : (widget.value / widget.dificuldade) / 10 >= 1 / 4
                              ? Colors.orange
                              : Colors.blue,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        color: Colors.grey,
                        width: 72,
                        height: 100,
                        child: imageOrNetwork()
                            ? Image.network(
                                widget.imagem,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                widget.imagem,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.nome,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          Difficulty(dificuldade: widget.dificuldade)
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.value++;
                        });
                      },
                      child: const SizedBox(
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.arrow_drop_up),
                            Text(
                              'Up',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        value: widget.dificuldade == 0
                            ? 1
                            : (widget.value / widget.dificuldade) / 10,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Nivel ${widget.value}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
