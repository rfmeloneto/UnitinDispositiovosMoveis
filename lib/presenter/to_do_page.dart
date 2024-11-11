import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primeiro_app/domain/activity_entity.dart';
import 'package:primeiro_app/presenter/bloc/to_do_bloc_store.dart';
import 'package:primeiro_app/presenter/bloc/to_do_evets.dart';
import 'package:primeiro_app/presenter/bloc/to_do_states.dart';
import 'package:primeiro_app/infra/activite_usecase_imp.dart';

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
    widget.store.add(GetActivitiesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder(
              bloc: widget.store,
              builder: (context, state) {
                if (state is LoadingToDoState) {
                  return const CircularProgressIndicator();
                }
                if (state is ErrorToDoState) {
                  return Text(state.message);
                }
                if (state is LoadedToDoState) {
                  if (state.activities.isEmpty) {
                    return Text(state.message);
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.activities.length,
                      itemBuilder: (context, index) {
                        // return Text(state.activities[index].title);
                        return Dismissible(
                          background: Container(color: Colors.red),
                          key: ValueKey(state.activities[index]),
                          onDismissed: (direction) {
                            widget.store.add(RemoveActivityEvent(index: index));
                          },
                          child: Card(
                            margin: const EdgeInsets.all(10),
                            elevation: 3,
                            child: ListTile(
                              title: Text(state.activities[index].title),
                              subtitle:
                                  Text(state.activities[index].description),
                              leading: Checkbox(
                                value: state.activities[index].isDone,
                                onChanged: (value) {
                                  widget.store
                                      .add(IsDoneActivityEvent(index: index));
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Text('Erro');
                }
              },
            ),
            ElevatedButton(
              child: const Text('Adicionar Tarefa'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Adicionar uma atividade'),
                      content: SizedBox(
                        height: 150,
                        child: Form(
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
                      ),
                      actions: [
                        TextButton(
                          child: const Text('Salvar'),
                          onPressed: () {
                            widget.store.add(AddActivityEvent(
                                activity: ActivityEntity(
                                    title: titleController.text,
                                    description: descriptionController.text)));
                            titleController.clear();
                            descriptionController.clear();
                            widget.store.add(GetActivitiesEvent());
                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: const Text('Fechar'),
                          onPressed: () {
                            widget.store.add(GetActivitiesEvent());
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
