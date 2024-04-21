import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  const TaskItem(
      {super.key,
      required this.task,
      required this.onChangedTitle,
      required this.onChangedDescription});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),
        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {}),
        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Share',
          ),
        ],
      ),
      child: Card(
        child: ListTile(
          leading: Checkbox(
            value: task.isDone,
            onChanged: (bool? value) {},
          ),
          title: Text("${task.title}"),
          subtitle: Text("${task.description}"),
          isThreeLine: true,
        ),
      ),
    );
  }
}
