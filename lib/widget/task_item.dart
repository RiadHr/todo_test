import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../provider/task_provider.dart';

class TaskItem extends StatelessWidget {
  final int index;
  final Task task;
  final VoidCallback onDeleteTask;

  const TaskItem({
    Key? key,
    required this.index,
    required this.task,
    required this.onDeleteTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    void editTaskHandler(String title, String description, int index) {
      context.read<TaskProvider>().editTask(title, description, index);
      print("Edited task at index $index");
    }

    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => showDialog(
              context: context,
              builder: (context) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 250),
                  child: Column(
                    children: [
                      const Text('Edit Task', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                      TextField(
                        controller: titleController,
                        onChanged: (value) {},
                        decoration: const InputDecoration(label: Text("Title"), border: OutlineInputBorder()),
                      ),
                      TextField(
                        controller: descriptionController,
                        onChanged: (value) {},
                        decoration: const InputDecoration(label: Text("Description"), border: OutlineInputBorder()),
                      ),
                      ElevatedButton(
                        onPressed: () => editTaskHandler(titleController.text, descriptionController.text, index),
                        child: const Text("Edit", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26)),
                      )
                    ],
                  ),
                );
              },
            ),
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: Card(
        child: ListTile(
          leading: Checkbox(
            value: task.isDone,
            onChanged: (bool? value) => onDeleteTask(),
          ),
          title: Text("${task.title}"),
          subtitle: Text("${task.description}"),
          isThreeLine: true,
        ),
      ),
    );
  }
}