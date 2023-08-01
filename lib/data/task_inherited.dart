import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    Task('Estudar flutter', 3, 'assets/images/dash.png'),
    Task('Andar de bike', 2, 'assets/images/bike.webp'),
    Task('Ler', 4, 'assets/images/livro.jpg'),
    Task('Meditar', 5, 'assets/images/meditar.jpeg'),
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
