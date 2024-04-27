import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onEditTask;
  final VoidCallback onDeleteTask;
  const TaskItem(
      {super.key,
      required this.task,
      required this.onEditTask,
      required this.onDeleteTask});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) =>null,
                // showDialog(
                //     context: context,
                //     builder: (context) {
                //       return SizedBox(
                //         height: 250,
                //        width: 250,
                //        child: Column(
                //          children: [
                //            TextField(),
                //            TextField()
                //          ],
                //        )
                //       );
                //     },
            // ),
            backgroundColor: Color(0xFF21B7CA),
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


// Widget EditShowDialog() => Center(
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//
//     ],
//   ),
// );