
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../pages/home_page.dart';
import '../provider/task_provider.dart';

class TaskItem extends StatefulWidget {
  final int index;
  final Task task;
  final VoidCallback onDeleteTask;

  const TaskItem({super.key,
     required this.index,
     required this.task,
    required this.onDeleteTask
  });

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  void editTaskHandler(String title,String description,int index){
    setState(() {
      context.read<TaskProvider>().editTask(title,description, index);
      logger.w("edited worked");
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =TextEditingController();
    TextEditingController descriptionController =TextEditingController();
    String title ="";
    String description = "";

    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) => showDialog(
                    context: context,
                    builder: (context) {
                      return  Card(
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 250),
                        child: Column(
                          children: [
                            const Text('Edit Task',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                            TextField(
                              controller: titleController,
                              onChanged: (value){
                                setState(() {title =titleController.text;});
                                },
                              decoration: const InputDecoration(label: Text("Title"),border: OutlineInputBorder(),),
                            ),
                            TextField(
                              controller:descriptionController ,
                              onChanged: (value) {
                                setState(() {description = descriptionController.text;});
                                },
                              decoration :const InputDecoration(label: Text("Description"),border: OutlineInputBorder(),),
                            ),
                            ElevatedButton(
                                onPressed:() {setState(() {editTaskHandler(title,description,widget.index);});},
                                child: const Text("Edit",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 26),)
                            )
                          ],
                        ),
                      );
                    },
            ),
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
            value: widget.task.isDone,
            onChanged: (bool? value) => widget.onDeleteTask(),
          ),
          title: Text("${widget.task.title}"),
          subtitle: Text("${widget.task.description}"),
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