import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var boolDifficulty = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: const Text('Tarefas'),
        ),
        body: AnimatedOpacity(
          duration: const Duration(milliseconds: 800),
          opacity: boolDifficulty ? 1 : 0,
          child: ListView(
            children: const [
              Task('Estudar flutter', 3,
                  'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large'),
              Task('Andar de bike', 2,
                  'https://tswbike.com/wp-content/uploads/2020/09/108034687_626160478000800_2490880540739582681_n-e1600200953343.jpg'),
              Task('Ler', 4,
                  'https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg'),
              Task('Meditar', 5,
                  'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg'),
              Task('Jogar', 1,
                  'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg'),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              boolDifficulty = !boolDifficulty;
            });
          },
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final int dificuldade;
  final String imagem;

  const Task(this.nome, this.dificuldade, this.imagem, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int value = 0;

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
              color: Colors.blue,
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
                        child: Image.network(
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
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: widget.dificuldade >= 1
                                    ? Colors.blue
                                    : Colors.blue[100],
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: widget.dificuldade >= 2
                                    ? Colors.blue
                                    : Colors.blue[100],
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: widget.dificuldade >= 3
                                    ? Colors.blue
                                    : Colors.blue[100],
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: widget.dificuldade >= 4
                                    ? Colors.blue
                                    : Colors.blue[100],
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: widget.dificuldade == 5
                                    ? Colors.blue
                                    : Colors.blue[100],
                                size: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          value++;
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
                            : (value / widget.dificuldade) / 10,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Nivel $value',
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
