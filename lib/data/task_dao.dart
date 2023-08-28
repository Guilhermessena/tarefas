import 'package:nosso_primeiro_projeto/components/task.dart';
import 'package:nosso_primeiro_projeto/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String _tableName = 'taskTable';

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_taskName TEXT,'
      '$_taskDifficulty INTEGER,'
      '$_taskImage TEXT)';

  static const String _taskName = 'name';
  static const String _taskDifficulty = 'difficulty';
  static const String _taskImage = 'image';

  save(Task tarefa) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> taskMap = toMap(tarefa);
    var itemExists = await find(tarefa.nome);
    if (itemExists.isEmpty) {
      return await db.insert(_tableName, taskMap);
    } else {
      return await db.update(
        _tableName,
        taskMap,
        where: '$_taskName = ?',
        whereArgs: [tarefa.nome],
      );
    }
  }

  Future<List<Task>> find(String nome) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: '$_taskName = ?',
      whereArgs: [nome],
    );
    return toList(result);
  }

  Future<List<Task>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
    );
    return toList(result);
  }

  delete(String tarefa) async {
    final Database db = await getDatabase();
    return await db.delete(
      _tableName,
      where: '$_taskName = ?',
      whereArgs: [tarefa],
    );
  }

  Map<String, dynamic> toMap(Task tarefa) {
    final Map<String, dynamic> mapTask = {};
    mapTask[_taskName] = tarefa.nome;
    mapTask[_taskDifficulty] = tarefa.dificuldade;
    mapTask[_taskImage] = tarefa.imagem;
    return mapTask;
  }

  List<Task> toList(List<Map<String, dynamic>> mapTask) {
    List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapTask) {
      final Task tarefa = Task(
        linha[_taskName],
        linha[_taskDifficulty],
        linha[_taskImage],
      );
      tarefas.add(tarefa);
    }
    return tarefas;
  }
}
