import 'package:flutter/material.dart';
import 'package:primeiro_app/data/data_base_helper.dart';
import 'package:primeiro_app/domain/activity_model.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  late Future<List<Task>> _taskList;

  @override
  void initState() {
    super.initState();
    _updateTaskList();
  }

  void _updateTaskList() {
    setState(() {
      _taskList = _databaseHelper.getTasks();
    });
  }

  void _showTaskDialog({Task? task}) {
    final TextEditingController titleController =
        TextEditingController(text: task?.title ?? '');
    final TextEditingController descriptionController =
        TextEditingController(text: task?.description ?? '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(task == null ? 'Nova Tarefa' : 'Editar Tarefa'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              final String title = titleController.text.trim();
              final String description = descriptionController.text.trim();

              if (title.isNotEmpty && description.isNotEmpty) {
                final newTask = Task(
                  id: task?.id,
                  title: title,
                  description: description,
                  isCompleted: task?.isCompleted ?? false,
                );

                if (task == null) {
                  _databaseHelper.insertTask(newTask);
                } else {
                  _databaseHelper.updateTask(newTask);
                }

                _updateTaskList();
              }

              Navigator.pop(context);
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: FutureBuilder<List<Task>>(
        future: _taskList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhuma tarefa encontrada.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final task = snapshot.data![index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: task.isCompleted,
                        onChanged: (value) {
                          final updatedTask = Task(
                            id: task.id,
                            title: task.title,
                            description: task.description,
                            isCompleted: value ?? false,
                          );

                          _databaseHelper.updateTask(updatedTask);
                          _updateTaskList();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _showTaskDialog(task: task),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _databaseHelper.deleteTask(task.id!);
                          _updateTaskList();
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTaskDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
