import 'package:flutter/material.dart';
import 'package:riverpod_experience/models/todo_model.dart';
import 'package:riverpod_experience/widgets/title_widget.dart';
import 'package:riverpod_experience/widgets/todo_list_item_widget.dart';
import 'package:riverpod_experience/widgets/toolbar_widget.dart';
import 'package:uuid/uuid.dart';

class ToDoApp extends StatelessWidget {
  ToDoApp({super.key});
  final newToDoControlller = TextEditingController();
  final List<ToDoModel> allToDos = [
    ToDoModel(id: const Uuid().v4(), description: "Spora git"),
    ToDoModel(id: const Uuid().v4(), description: "Alışveriş yap"),
    ToDoModel(id: const Uuid().v4(), description: "Ders çalış"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          const TitleWidget(),
          TextField(
            controller: newToDoControlller,
            decoration: const InputDecoration(labelText: "Add a task"),
            onSubmitted: (newToDo) {
              debugPrint("değer $newToDo");
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const ToolBarWidget(),
          for (var i = 0; i < allToDos.length; i++)
            Dismissible(
              key: ValueKey(allToDos[i].id),
              onDismissed: (_) {},
              child: ToDoListItemWidget(
                item: allToDos[i],
              ),
            )
        ],
      ),
    );
  }
}
