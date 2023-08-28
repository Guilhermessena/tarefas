import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    // ignore: prefer_const_constructors
    Task('Estudar flutter', 3, 'assets/images/dash.png'),
    // ignore: prefer_const_constructors
    Task('Andar de bike', 2, 'assets/images/bike.webp'),
    // ignore: prefer_const_constructors
    Task('Ler', 4, 'assets/images/livro.jpg'),
    // ignore: prefer_const_constructors
    Task('Meditar', 5, 'assets/images/meditar.jpeg'),
    // ignore: prefer_const_constructors
    Task('Jogar', 1, 'assets/images/jogar.jpg'),
  ];

  void newItem(String name, int dificuldade, String urlFoto) {
    taskList.add(
      Task(name, dificuldade, urlFoto),
    );
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
