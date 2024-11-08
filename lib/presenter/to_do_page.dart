import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primeiro_app/domain/activity_entity.dart';
import 'package:primeiro_app/presenter/bloc/to_do_bloc_store.dart';
import 'package:primeiro_app/presenter/bloc/to_do_states.dart';
import 'package:primeiro_app/usecase/activite_usecase_imp.dart';

class ToDoPage extends StatefulWidget {
  final ActivityStore store = ActivityStore(ActivityUseCaseImp());
  ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    widget.store.activityUseCase.getActivities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder(
              bloc: widget.store,
              builder: (context, state) {
                if (state is InitialToDoState) {
                  if (state.activities.isEmpty) {
                    return Text(state.message);
                  }
                  return ListView.builder(
                    itemCount: state.activities.length,
                    itemBuilder: (context, index) {
                      return Text(state.activities[index].title);
                    },
                  );
                }
                if (state is LoadingToDoState) {
                  return const CircularProgressIndicator();
                }
                if (state is ErrorToDoState) {
                  return Text(state.message);
                }
                if (state is LoadedToDoState) {
                  return ListView.builder(
                    itemCount: state.activities.length,
                    itemBuilder: (context, index) {
                      return Text(state.activities[index].title);
                    },
                  );
                } else {
                  return const Text('Erro');
                }
              },
            ),
            ElevatedButton(
                onPressed: () {
                  widget.store.activityUseCase.getActivities();
                },
                child: const Text('Carregar Tarefas')),
            ElevatedButton(
              child: const Text('Adicionar Tarefa'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Adicionar uma atividade'),
                      content: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextField(
                              decoration: const InputDecoration(
                                  labelText: 'Título da Atividade'),
                              controller: titleController,
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                  labelText: 'Descrição da Atividade'),
                              controller: descriptionController,
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text('Salvar'),
                          onPressed: () {
                            widget.store.activityUseCase.addActivity(
                              ActivityEntity(
                                title: titleController.text,
                                description: descriptionController.text,
                              ),
                            );
                            titleController.clear();
                            descriptionController.clear();

                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: const Text('Fechar'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
